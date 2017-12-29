# マルチプラットフォーム化

## 要求
* WindowsとAndroidで共通のシステムでリリース可能であること  
OSの違いによる避けがたい仕様を除く。
* 完全な互換性の維持は考えず、工数を抑える  
将来的には従来バージョンとの互換性を高めていく。
* ハードウェアでの描画を主体とする  
3Dを利用した2D描画を主体とし、従来のソフトウェアベースの描画は必須ではない。  
将来はうまく両方使えるようになることが望ましい。
* ベクター描画  
解像度非依存UI等を実現するためにベクター描画機能を追加する。  
[NanoVG](https://github.com/memononen/nanovg)を想定

### Windows
* Windows 7以降限定
* DirectX 11必須

### Android
* Android4.4以降限定  
* OpenGL ES 3.0以降推奨(2.0必須 再考の可能性あり)

その他 [Android作業項目や制限等](andoird_design.md) を参照。

### ハードウェア描画設計
[ハードウェア描画設計](hwdrawing_design.md) を参照。

### 開発環境
Visual Studioで完結するのが理想であるが、現状は困難との見通し。  
Android Studioでビルド。

### 開発の進め方
[開発の進め方](development_plan.md)

### マルチプラットフォーム版への対応
[吉里吉里Z マルチプラットフォーム版開発/移植時の注意点](https://krkrz.github.io/multi_platform_design/cautionary_note.html)

### その他マルチプラットフォーム化に関して
プラットフォーム依存部分のスタブ作成と各種ライブラリでの実装(置き換え)で行うとPC上である程度開発できるので効率的に進められる。  
グラフィック部分をPC上でOpenGL(ES2)を使い開発出来るとAndroidの開発効率がかなり違うが、それをできるまでの工数を考える必要がある。  
スタブ作成は、その中身を実装することで複数プラットフォーム展開しやすくするためで、各種ライブラリでの実装は適切に依存部分が切り分けられていることを確認するためと、Windows以外のAndroid/MacOSX/Linuxなどは似たようなAPI体系なのでついでに実装できるとお得と言うことから。  
下位部分を置き換えたWindows版はAndroid相当の機能に制限した開発用機能制限版としても使えるようにして、現在の直接Win32API叩いているバージョンはそのまま使用。  

#### 各種ライブラリは以下のものを検討

* POCO : Threadや環境情報など → Thread は C++11の機能+pthreadへ
* PortAudio : サウンド。Android の OpenSL は対応していないので別実装の必要あり → 環境ごとに実装
* GLFW : OS GUI周り。Android はこの部分独自になるが、OpenGL は共通。 → 環境ごとに実装
* Movie は固有で実装。

Windowについては、Androidでは1つのみ生成可能、Layer Tree Ownerでダイアログのハードウェアレイヤーの実装案で将来代替も考慮。

