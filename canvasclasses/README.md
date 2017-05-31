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

## 互換性に関して
OffscreenにLayer Treeを描画する機能の要望があり、更新領域のみコピー可能ということで、OffscreenクラスはLayer Tree Ownerインターフェイスを持つ実装した方が良い。   
OffscreenにLTOインターフェイスを持たせれば、従来とほぼ互換動作を実現できる。  
現在のWindowクラスのLTOインターフェイスは、ほぼDrawDeviceが提供しているが、DrawDeviceではなく新設されたハードウェア描画が使われる場合に、Windowを指定してLayerが生成された時、Offscreenクラスを内部で生成しCanvasにデフォルトOffscreenとして登録、Layer更新時の通知からOnDrawイベントを生成して、Canvasでの描画開始前にデフォルトOffscreenを描画、もしくはOnDraw呼出し後に描画することで、従来と同じようにLayerが使用可能となるように実装できると考えられる。  
ただし、DrawDeviceに関してはなくなるので、DrawDevice依存している部分や独自DrawDeviceを使用している場合、その部分の互換性は失われる。