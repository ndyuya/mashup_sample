mashup_sample
=============
「Webサービスのマッシュアップ」のサンプルプログラム。  
NIFTY Cloud C4SA の rubyコンテクストを使う。  


使い方
------
0. このリポジトリのファイルを取得 (cloneでもzipダウンロードでも可)
1. Google Maps APIとTwitterのAPIを使えるように準備する
    * Google API key
    * Twitter [Consumer key]
    * Twitter [Consumer secret]
    * Twitter [Access Token]
    * Twitter [Access Token secret]
2. 1.で取得したキーをそれぞれファイルに書き込む
    * Google API keyはproject/views/index.erbの12行目にある「YOUR_API_KEY」の部分
    * Twitterのキー４種はproject/app.rbの14〜17行目にある「YOUR_*」の部分
    * OAuth tokenはAccess Token、Oauth token secretはAccess Token secretに読み替える
3. http://c4sa.nifty.com/ へアクセスして、rubyコンテクストでキャンバスを作る
    * Ruby on railsと間違えないように!!
4. C4SA上のファイルをこのリポジトリのファイルで上書き
5. C4SAコンパネの「バンドルインストール」を「実行」
6. C4SAコンパネの「デーモン管理」で「unicorn」を「リスタート」
7. ヘッダー部分にあるURLへアクセスして動作確認する


