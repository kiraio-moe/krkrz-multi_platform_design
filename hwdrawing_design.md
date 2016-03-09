# ハードウェア描画設計
## XXWindow
* ベースになる画面を提供
* 表画面/裏画面でのトランジション機能
* タッチやマウス用のインターフェースは全面的にここで管理。  
　　レイヤから先では、指定した座標にそのオブジェクトが存在するかどうか、が判定できるインターフェースがあれば良い（イベント伝播は不要）
* 重なってる Surface 描画の任意の位置での画面キャプチャ

## XXSurface
### 3D系コンポーネントの基底クラス
* トランジション用のプレーン指定(表/裏/両方)
* 表示ON/OFF
* オーダー指定
* レンダーテクスチャ関係処理は入れるならここか？  
キャプチャ/レンダー処理後の色加工/合成モード指定/不透明度指定

## XXMeth extends XXSurface
3Dメッシュ描画を準備するならこの層で対応？

## XXNanoVGLayer extends XXSurface
2Dレイヤと同格の描画用としてみるとここの層？

## XXLayer extends XXSurface
### 2D描画の基本処理を提供する機構
* 描画クリッピング機能
* 描画全体のアフィン変形処理 ← これがADV案件やUIの演出処理的には重要な要素となる
* 配下の XXLayerObject が必要とするリソースを保持管理

## XXLayerObject
### XXLayer 上に単純配置可能な2D系描画要素の基底クラス
* XXLayer上での表示順と配置オフセット指定指定は共通的に指定可能に
* 画像変形指定（拡縮回転）、合成モード、不透明度などの指定  
※実際に対応するかどうかはオブジェクト次第  
E-mote だと合成モードは描画のパーツごとに変化してる

## XXPicture extends XXLayerObject
* 画像の表示
* 指定した画像から任意領域を切り出して表示する
* ここで吉里吉里の LTO がそのまま描画できるのが理想

## XXNanoVGPicture  extens XXLayerObject
* 2D描画を画像の一種とするならこの階層が妥当

## XXTextRender extends XXLayerObject
* テキストレンダリング処理用

## XXEmote extends XXLayerObject
* E-mote データを表示

# 全体の構成
構造的に Window > Surface  
　　　　　　　　　　　　　Layer(Surface) > LayerObj

の３層想定です  
Layer を「Surface の親になれる Surface」にしてしまって、LayerObj と Surface と同格にしてしまうのが、自在に入れ子できて汎用性の点では高いとは思うのですが、実用上はこの3層のがわかりやすくて、特に問題にもならないはずです
