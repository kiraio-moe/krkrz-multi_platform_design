# 吉里吉里Zマルチプラットフォーム版仕様/説明
吉里吉里Zマルチプラットフォーム版は、Windows/Androidで動作する吉里吉里Zです。  
現状従来の吉里吉里Zとの互換性はやや低いですが、将来的に一部例外を除いてそのまま移行できるよう互換性を高める予定です。  
また、従来のソフトウェアによる描画(Layer)に加えて、ハードウェア(OpenGL ES2.0/3.0)による描画機能も加えられています。  
Windowsであれば強力なCPUにより力任せの処理もある程度可能ですが、非力なAndroid環境では苦しい場面も予想されます。  
Androidではなるべくハードウェア(GPU)を使用し快適に動作するよう書き換えた方がストレスなくプレイできるようになります。  
当然、Windowsでもハードウェア(GPU)が使われるようになるので、従来よりも低CPU負荷でより複雑で多彩な演出も可能になります。  
従来のスクリプトそのままを移行することはまだ出来ませんが、GPUを利用する描画への書き換えを行う方が、Android/Windows共に快適に動作するため、GPU描画への移行を推奨します。

## マルチプラットフォーム版APIリファレンス
* [APIリファレンス](https://krkrz.github.io/multi_platform_design/apiref/)

## Android 版に関する各種説明

まずはこの場所に各種ドキュメントをまとめるが、最終的には Windows 版のドキュメントとも統合されることを目標としている。

* [Android版のリリース(ビルド)方法](https://krkrz.github.io/multi_platform_design/develop_android.html)
* [Windows版のビルド方法](https://krkrz.github.io/multi_platform_design/build_windows.html)
* [動画再生機能](https://krkrz.github.io/multi_platform_design/video_overlay.html)
* [プラグインの作り方/利用方法](https://krkrz.github.io/android_plugins/)
* [サウンド](https://krkrz.github.io/multi_platform_design/audio.html)
* [シェーダーの使い方](https://krkrz.github.io/multi_platform_design/shader_program.html)