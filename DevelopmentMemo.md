# ソリューションログ
※　『アジャイルプラクティス』にならって、躓いたポイントをストック☆

## deviseを用いてユーザー登録しようとしたら、「LoadError: cannot load such file — bcrypt_ext」というエラーが発生した。
  * http://stackoverflow.com/questions/33588735/loaderror-cannot-load-such-file-bcrypt-ext-on-windows-2008-x64-server
   * bcryptを入れてみても解消されず。gemfileに追加したら、bundle installでも同様のエラーが発生していた。↑のサイトに習って、db:migrateをしても同様のエラーが発生している。
  * http://qiita.com/yukkie/items/a9a02edd953a505491e5
   * 試しに再起動（PCでしちゃったけど）してみたけど解消されず。
  * http://qiita.com/toshikase/items/d04634c6157656300c72
   * ｷﾀ━━━━(ﾟ∀ﾟ)━━━━!!ここの方法で解消済
    * `TODO` 参考リンク要確認！バージョンが指定バージョンでいいかどうかもチェック！

## deviseの日本語化
 * http://qiita.com/shizuma/items/a52fd0ef5b60d61fa330
  * 日本語化ファイルがあったから、さくっと置き換えができるかなとおもったら、config/application.rbに記載する内容が誤っているのか、日本語化されない。
   * ブログ用のrailsのconfig/applicaiton.rbにはその記載があった！コメントで書かれていないのはバージョンかな？？scaffoldで作っていた（？）からかな？
  * 書いている場所は問題ない。rails サーバー再起動して確認してもだめ。なんでだろう。。
  * !!そうか、viewはベタで書いているから、そっちは別途直さないとだめなのね！

## tmp/pid/server.pid
 * ここに値が記載されていると、rails sで実行できない。
 　* visual studio codeのdebug for chromeを昨日使ってみたけどそれかな？一旦は様子見！

## herokuデプロイ
 * mysqlの設定を忘れずに！自動化できないのかな？？
  * http://qiita.com/fukumone/items/b8934f78f841b19edbbe
 * 最初のデプロイ手順はherokuのページにある手順でOk！久しぶりにやったら忘れていたからメモ！
  * https://dashboard.heroku.com/apps/sakuramarket/deploy/heroku-git

## seedでイメージファイルのデータを登録する方法
 * http://stackoverflow.com/questions/12644057/how-to-use-binary-data-in-rails-fixtures
  * 試しにfile_fixtures_extension.rbを用いてみたけど、uninitialized constant fixtureのエラーが発生していた。
 * https://gist.github.com/averyvery/2361682
  * fileオブジェクトを登録する手順だと、画像ファイルが表示されない。。もしかして、こういう手順の場合は見せ方のコードも変えないといけないのかな？？

## deviseに新たにフィールドを追加する方法
 * 参考サイト：
  * http://stackoverflow.com/questions/3546289/override-devise-registrations-controller
  * http://jacopretor
 * 最終的にはここのサイトを参考に
  * http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html

## 郵便番号を引っ張ってくる方法
 * http://ruby-rails.hatenadiary.com/entry/20150112/1421029284

