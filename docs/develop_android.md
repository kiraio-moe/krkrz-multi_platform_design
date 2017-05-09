# 吉里吉里Z Android版のリリース
Android版は開発用とパッケージ化用で分離しています。  
開発用はAndroid5.0以降用で、起動時にフォルダを選択してそこにあるstartup.tjsから起動できます。  
それに対してパッケージ化用のものはAsset内のstartup.tjsかdata.xp3から起動します。  
Asset以外にもGoogle Play の拡張ファイル(Expansion Files)や指定サーバのhttp経由でのデータ(xp3)ダウンロードによって起動可能です(予定)。  
全てダウンロードするのではなく、フォントデータ等変更がほぼないデータ等をAssetに置きつつ、その他のデータはダウンロードするなどの対応も可能です(予定)。  
開発用かパッケージ化用の切り替えはAndroid StudioのProduct Flavor機能によって行います。  
開発用は公式からリリースされるもので問題ないですが、プラグインを足したものが必要な場合は自前でapk化します。 
パッケージ化用はゲームをリリースする時に使用します。  
開発用はdevelop、パッケージ化用はproductと言う名前になっています。

## アプリケーション(ゲーム)名の変更
以下の2つのXMLファイルのapp_name要素を変更します。  
既定ではGameName/ゲーム名と言うものが入っているので、そこをリリースするゲームの名前に変更します。  
krkrz/android/app/src/product/res/values/strings.xml (英語)  
krkrz/android/app/src/product/res/values-ja/strings.xml (日本語)

## アイコンの変更
krkrz/android/app/src/product/res/以下のmipmap-xxxディレクトリにic_launcher.pngと言う名前で置きます。  
アイコンサイズはそれぞれ以下のサイズで置きます。
* mipmap-mdpi : 48x48
* mipmap-hdpi : 72x72
* mipmap-xhdpi : 96x96
* mipmap-xxhdpi : 144x144
* mipmap-xxxhdpi : 192x192

## バージョン番号
人が読むバージョン名と自動処理されるバージョンコードの2つが必要です。  
バージョンコードはリリースするごとに1ずつ加算し、Android端末が更新を検出し自動更新(もしくは更新通知)するために使われます。  
最初は1にしてリリースします。  
バージョン名はテキストです。  
1.0.0等にしてリリースします。  
どのように上げていくかは任意です。  
バージョン名は versionName の項、バージョンコードは versionCode の項に該当します。  
krkrz/android/app/build.gradle の android { productFlavors { product { versionCode/versionName } } } を更新します。  
既定ではそれぞれ1と'1.0.0'になっています。  
初回リリースはそのままでも問題ないです。

## パッケージ名
apk のパッケージ名で、Google Play 内で重複しないものをつける必要があります。  
その他のストアでも同様です。  
Java のパッケージ名のメイメイ規則に従い一般的にアプリ名+ドメイン名を.ごとに逆さにした形でつけます。  
自分の持つドメイン名をつけることで重複を避けます。  
krkrz/android/app/build.gradle の android { productFlavors { product { applicationId } } } を更新します。  
既定では 'com.domain.productname' となっているので、ドメイン名 + アプリ名とします。

## data.xp3 の配置
krkrz/android/app/src/product/assets フォルダ内に置きます。  
ここに置くと apk にまとめられます。

## プラグインの追加
[Android版でのプラグインの利用](https://krkrz.github.io/android_plugins/)を参照してください。  
xp3 ファイル内には置かず、apk 内に入るよう置き場所が決まっています。