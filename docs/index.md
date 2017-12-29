---
layout: default
title: 吉里吉里Z Ver.2
---
# 吉里吉里Z Ver.2 (マルチプラットフォーム版) 仕様/説明
吉里吉里Zマルチプラットフォーム版は、Windows/Androidで動作する吉里吉里Zです。  
現状従来の吉里吉里Zとは互換性はやや低いですが、将来的に一部例外を除いてそのまま移行できるよう互換性を高める予定です。  
また、従来のソフトウェアによる描画(Layer)に加えて、ハードウェア(OpenGL ES2.0/3.0)による描画機能も加えられています。  
Windowsであれば強力なCPUにより力任せの処理もある程度可能ですが、非力なAndroid環境では苦しい場面も予想されます。  
Androidではなるべくハードウェア(GPU)を使用し快適に動作するよう書き換えた方がストレスなくプレイできるようになります。  
当然、Windowsでもハードウェア(GPU)が使われるようになるので、従来よりも低CPU負荷でより複雑で多彩な演出も可能になります。  
従来のスクリプトそのままを移行することはまだ出来ませんが、GPUを利用する描画への書き換えを行う方が、Android/Windows共に快適に動作するため、GPU描画への移行を推奨します。

## マルチプラットフォーム版APIリファレンス
* [APIリファレンス](https://krkrz.github.io/multi_platform_design/apiref/)  
各種メソッド、プロパティの説明の前に使用可能なプラットフォームが以下のように書かれています。  
何も書かれていない場合は全プラットフォームで利用可能です。  
[Windows+] : Windowsでのみ使用可能です。他の環境ではエラーとなります。  
[Windows*] : Windowsでのみ使用可能ですが、他の環境で実行しても何も起こりません。  
[Android+] : Androidでのみ使用可能です。他の環境ではエラーとなります。  
[Android*] : Androidでのみ使用可能ですが、他の環境で実行しても何も起こりません。

## 対応プラットフォーム
### Windows
* Windows 7以降
* DirectX 11必須

### Android
* Android 4.4以降
* OpenGL ES3.0以降推奨(2.0必須)

## マルチプラットフォーム版に関する各種説明

* [Android版のリリース(ビルド)方法](https://krkrz.github.io/multi_platform_design/develop_android.html)
* [Windows版のビルド方法](https://krkrz.github.io/multi_platform_design/build_windows.html)
* [動画再生機能](https://krkrz.github.io/multi_platform_design/video_overlay.html)
* [プラグインの作り方/利用方法](https://krkrz.github.io/android_plugins/)
* [サウンド](https://krkrz.github.io/multi_platform_design/audio.html)
* [シェーダーの使い方](https://krkrz.github.io/multi_platform_design/shader_program.html)
* [KAGΣ(新描画APIサンプル実装)](https://github.com/krkrz/KAGSigma)
* [移植時の注意点](https://krkrz.github.io/multi_platform_design/cautionary_note.html)
