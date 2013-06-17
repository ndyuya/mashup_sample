mashup_sample
=============
「Webサービスのマッシュアップ」のサンプルプログラム。  
NIFTY Cloud C4SA の rubyコンテクストを使う。  


使い方
------
1. http://c4sa.nifty.com/ へアクセスして、rubyコンテクストでキャンバスを作る
    * Ruby on railsと間違えないように!!
2. sinatraとtwitterを使うのでGemfileを更新する（project/Gemfile)
    * このリポジトリにあるGemfileで上書きしてもOK
3. C4SAコンパネの「バンドルインストール」を「実行」
4. このリポジトリにあるファイルをそのままアップロード
    * 重複するものは上書き
5. C4SAコンパネの「デーモン管理」で「unicorn」を「リスタート」
6. ヘッダー部分にあるURLへアクセスして動作確認する


