# 動画機能

Android では現在のところ Windows 版に比べて動画関連機能は圧倒的に少ない。  
まず、VideoOverlay オブジェクトは1つのみに制限され、常に最前面に表示される。  
使用出来る動画フォーマットは[ExoPlayerページ](https://google.github.io/ExoPlayer/supported-formats.html)参照のこと。  
端末やバージョン依存があるので、H.264辺りが安定と思われるが、ライセンスの問題があるので注意。  
初期の吉里吉里2のような機能と思ってもらうと良い。

エラー通知については、onStatusChanged にて、load errorかplayer errorとして通知される。

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

