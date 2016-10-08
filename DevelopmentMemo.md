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
 * http://railstutorial.jp/chapters/user_microposts?version=4.2#sec-micropost_images
  * http://ja.stackoverflow.com/questions/19451/rails%E3%81%A7%E3%83%86%E3%82%B9%E3%83%88%E3%82%84%E9%96%8B%E7%99%BA%E7%94%A8%E3%81%AE%E5%88%9D%E6%9C%9F%E3%83%87%E3%83%BC%E3%82%BF%E3%83%90%E3%82%A4%E3%83%8A%E3%83%AA%E3%82%92%E7%94%A8%E6%84%8F%E3%81%99%E3%82%8B%E6%96%B9%E6%B3%95
  * バイナリデータではなく、ファイル形式で持たせないとやっぱりまずいのかなぁ。。
 * http://ja.stackoverflow.com/questions/23694/rails%E3%81%A7seed%E3%83%87%E3%83%BC%E3%82%BF%E3%82%92%E4%BF%9D%E5%AD%98%E3%81%97%E3%82%88%E3%81%86%E3%81%A8%E3%81%99%E3%82%8B%E3%81%A8-%E5%A4%96%E9%83%A8%E3%82%AD%E3%83%BC%E3%81%8Cnot-null-constraint-failed
  * path = Rails.root.join("db/fixtures/images/image.png")
  * s.photo = Rack::Test::UploadedFile.new(path, "image/jpeg", true)
  * 上記で試してみたけどダメだった
 * !!!!解決!!!!
  * s.photo = File.open(path, "rb").read
   * rb指定でバイナリでfileをopenして、readしたものを設定すればOK！


## deviseに新たにフィールドを追加する方法
 * 参考サイト：
  * http://stackoverflow.com/questions/3546289/override-devise-registrations-controller
  * http://jacopretor
 * 最終的にはここのサイトを参考に
  * http://jacopretorius.net/2014/03/adding-custom-fields-to-your-devise-user-model-in-rails-4.html

## 郵便番号を引っ張ってくる方法
 * http://ruby-rails.hatenadiary.com/entry/20150112/1421029284
  * キャッシュを破棄しないと二回目以降は適用されない？？TODO化済

## migrateして最新のはずなのに、migrateされていないというエラーがでた。
 * rails destroy migration AddDetailsToUsers
  * たぶん、上記コマンドで削除した後、visual studio codeで未保存をすべて保存とした際に、表示していた削除済みのファイルが再度保存されてしまったことによる現象   

## 商品詳細ページの作成
 * http://dotinstall.com/lessons/basic_rails_v2/24911
 * controllerのshowで実装。表示用のview側を作成すればOK！

## bootstrapの適用
 * http://qiita.com/shizuma/items/83cdadbe0a629f1f74d1
 * http://qiita.com/masamitsu-konya/items/e3630046774ac1fbd346
 * 最初windows64bitの関連でエラーが発生していたけれど、必要なgemを限定したら導入できた。
 * http://getbootstrap.com/css/#helper-classes
  * 現状はbootstrapのCSSを適用しているだけだけれど。。

### bootstrapのiconをlink_toで利用したい
 * Hamlとbootstrapでiconを表示することができていない。一旦はアイコンを導入しないことにしたけれど、以下の調査記録だけは残しておく。 
  * http://stackoverflow.com/questions/20694997/how-to-add-glyphicons-to-rails-link-to-helper-bootstrap-3

## simple_formの適用
 * https://github.com/plataformatec/simple_form
 * 結構便利な機能が多いっぽい。
 * 基本的なフォームの記載ならば、1行で記載できて便利♪

## order_items_controllでsave_orderでorder_itemとorderの両方をsaveしているのは少し冗長だった
 * http://stackoverflow.com/questions/6736265/rails-update-parent-object-when-saving-child
  * belongs_toのmodelにtouchをtrueにしていたから、それで親のsaveは不要であることが判明！
