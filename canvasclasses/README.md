# ハードウェア描画用のクラス関係

* 3D機能対応用.tjs  
要望されたもの。実装上等の問題などでクラス設計は少し変更されている。  
texture id などで指定されているものは、クラス化して実行時エラー検出可能にするなど。
* Canvas.tjs  
要望ではWindowクラスに直接描画メソッド追加であったが、肥大化等の問題があるため分離。
* Matrix44.tjs  
受け渡しなど容易に行えるようにクラス化した。
* Mesh2D.tjs  
Meshクラスではもし3D対応した時に名前が被りそうなので、名前に2Dを付与。  
効率化のためのクラスと言うことなので、このクラスが持つ詳細な情報は実装しつつ検討を進める。
* Offscreen.tjs  
要望ではscreen idとなっていたが、Screenクラスだとやや紛らわしく名前も被りそうなので、Offscreenと言う名前へ。
* Texture.tjs  
テクスチャをクラス化。直接読み込むかBitmapクラスから読み込むか。
* Window.tjs  
メソッド等が大きく削られ、一部追加されたWindowクラス。

## Layerを描画する方法
BitmapLayerTreeOwnerクラスにclearDirtyRectメソッド、dirtyRect/isUpdatedプロパティを追加した。  
BitmapLayerTreeOwnerクラスをオーナーとしてLayerクラスを生成。  
描画タイミングでBitmapLayerTreeOwner.isUpdatedがtrueなら以前から画像が更新されているので、テクスチャに画像を転送する。  
更新された領域はdirtyRectで取得。  
テクスチャサイズはプライマリーレイヤサイズ(BitmapLayerTreeOwner.bitmap)と合わせておく。  
仮想コードで書くと以下のように記述することで更新矩形をテクスチャに転送できる。  
```javascript
BitmapLayerTreeOwner lto;
Texture texture = new Texture( width, height );
texture.copyRect( lto.dirtyRect.left, lto.dirtyRect.top, lto.bitmap, lto.dirtyRect );
lto.clearDirtyRect();
```
Offscreenクラスにも同様のコピーメソッドがあるので、同じように出来るが、レンダーターゲットとして設定できるようFBOなど含むためメモリ的にオーバーヘッドがある。  
レンダーターゲットとして使わないのであれば、Textureクラスを使う方が良い。  
Layerで描画するという用途的に、Offscreenクラスを使う必要はないと思われる。


## 互換性に関して
OffscreenにLayer Treeを描画する機能の要望があり、更新領域のみコピー可能ということで、OffscreenクラスはLayer Tree Ownerインターフェイスを持つ実装した方が良い。   
OffscreenにLTOインターフェイスを持たせれば、従来とほぼ互換動作を実現できる。  
現在のWindowクラスのLTOインターフェイスは、ほぼDrawDeviceが提供しているが、DrawDeviceではなく新設されたハードウェア描画が使われる場合に、Windowを指定してLayerが生成された時、Offscreenクラスを内部で生成しCanvasにデフォルトOffscreenとして登録、Layer更新時の通知からOnDrawイベントを生成して、Canvasでの描画開始前にデフォルトOffscreenを描画、もしくはOnDraw呼出し後に描画することで、従来と同じようにLayerが使用可能となるように実装できると考えられる。  
ただし、DrawDeviceに関してはなくなるので、DrawDevice依存している部分や独自DrawDeviceを使用している場合、その部分の互換性は失われる。

## TextureLayerTreeOwner
今回はTextureLayerTreeOwnerを作らなくても、上述のBitmapLayerTreeOwnerのメンバ追加によって部分的な更新は対応できるため、作らない。  
互換性向上のためにはTextureLayerTreeOwnerは必要であるので、PBOを使った非同期更新の効率の良い実装で将来作りたい。  
その場合、OpenGL ES3.0 以降専用となるが、それほど大きな問題ではないだろう。  

OpenGL ES3.0 以降であればPBOが使え、PBOからTextureへの転送はDMA処理されるため、CPU負荷が軽い。  
Layer更新時に自動的にPBOコピーからTextureへ転送する。  
それに合わせてOnDrawイベント呼び出しを行い、画面へ描画を反映させると従来と同じような動作となる。  
毎フレーム更新するような場合は、PBO/Textureを2つ作りダブルバッファリングすることで、転送待ちをなくせる。  

## 間接的に実現できる機能
### クロスフェード
```javascript
var crossfadeShader = new ShaderProgram( default.vert, crossfade.frag );
crossfadeShader.s_opacity = 0.0;
Canvas.drawTexture( prevTexture, nextTexture, crossfadeShader );
```
のようなスクリプトで実現可能。  
シェーダーのopcityを変化させることで徐々にフェードを進める。  
crossfadeShaderなどのシェーダーは1個だけ作り、保持し続けるのが効率的。

### ユニバーサルトランジション
```javascript
var universalShader = new ShaderProgram( default.vert, universal.frag );
universalShader.s_vague = 64.0/255.0;
universalShader.s_phase = 0.0;
Canvas.drawTexture( prevTexture, nextTexture, ruleTexture, crossfadeShader );
```
のようなスクリプトで実現可能。  
シェーダーのphaseを変化させることで徐々にフェードを進める。  
universalShaderなどのシェーダーは1個だけ作り、保持し続けるのが効率的。

### アルファクリッピング
```javascript
var alphaclipShader = new ShaderProgram( default.vert, alphaclip.frag );
Canvas.drawTexture( texture, clipAlpha, alphaclipShader );
```
のようなスクリプトで実現可能。  
alphaclipShaderなどのシェーダーは1個だけ作り、保持し続けるのが効率的。

