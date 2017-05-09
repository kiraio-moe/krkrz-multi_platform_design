# 動画機能

Android では現在のところ Windows 版に比べて動画関連機能は圧倒的に少ない。  
まず、VideoOverlay オブジェクトは1つのみに制限され、常に最前面に表示される。  
初期の吉里吉里2のような機能と思ってもらうと良い。

現在サポートされているメソッド等は以下の通り。

## メソッド
* close
* open
* play
* stop

## プロパティ
* audioVolume
* totalTime
* position

## イベント
* onStatusChanged( stop/ready/play )

