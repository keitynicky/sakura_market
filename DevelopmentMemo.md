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

## unmatched OUTDENTっていうエラーが出たら
 * http://qiita.com/mrpepper/items/e49fed1e22bc976c3813
  * coffee scriptで何か記載ミスしているっぽい

## bootstrap datepicker
 * bootstrap-datepicker.ja.min.self-759c412….j…:1 Uncaught TypeError: Cannot read property 'dates' of undefined
  * 日本語化しようとしたらエラーがでていて日本語化できない。。
   * http://stackoverflow.com/questions/15606022/twitter-bootstrap-datepicker-error
   * https://github.com/rajit/bootstrap3-datepicker/issues/13

## 1フォームに複数の要素がある場合
### Wizard化検討
 * https://github.com/katoy/rails4-form-after-wizard/tree/master/screenshots
  * include Wicked::Wizardで実現できないか検討
   * 単一のモデルを複数フォームで更新する用のウィザードなので、採用を断念

### wizard以外での実装を検討
 * http://stackoverflow.com/questions/1231608/rails-user-input-for-multiple-models-on-a-single-form-how
  * fields_forというのがあるみたい！
   * deviseでfields_forを用いる場合について調査
    * http://stackoverflow.com/questions/21764623/rails-devise-fields-for-not-working
    * http://stackoverflow.com/questions/21765482/rails-devise-build-nested-model-in-controller
    * うーん、難しい。Wizardにはできないけど、やっぱりフォーム分けておいたほうがいいかなぁ。。
* https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb
  * deviseの大本クラスの構造を確認し、そこから更新時の処理分岐を作成することで対応
    * http://stackoverflow.com/questions/5113248/devise-update-user-without-password/11676957#11676957
    
## お買い上げ時のフォームでprogress barを実現
 * bootstrapのtabだと、リンクになってしまうので、選択が可能になってしまう。
 * http://bootsnipp.com/snippets/featured/progress-bars-responsive
  * bootstrap progress bar order processあたりで検索

## 配送日時が保存されない
 * current_orderをそのまま用いていたから。一度変数に保持してその変数の値を変更することで保存することができた。確かにメソッドとして呼んでいるものだからってことかな。。(ﾉ∀`)ｱﾁｬｰ

## validate_presence_ofを使いたい
 *   gem 'shoulda-matchers'
 * だけど、x64で入れてしまっているから用いられない模様。。残念！

## hirbとpryを使う
 * .pryrcというファイルを作成しておく必要がある。作っておけばデータ表示時は表で表示される☆
 * http://ruby-rails.hatenadiary.com/entry/20141024/1414160189

## delivery_dateがnilだけどpresenceのチェックが効いていない？？ 
 * 下手にnilを再設定したことによる動作不良。値設定の分岐でクリア。
  * unless order_params[:delivery_date].empty?

## delivery_dateのエラーメッセージが表示されない
 * http://qiita.com/ozy-san/items/940d3b3aae2f7141f9ec
  * renderにしてるけど、表示されないなぁ。。
   * renderにした結果、再度表示される画面のURLが当初と違うけど。。？
 * http://stackoverflow.com/questions/16680930/simple-form-not-displaying-error
  * saveで保存してるけどなぁ！
   * 特別な場合にしかエラーを出さないようにしていることがもしかして何か影響してる？？うーんでも、エラー時にもとの画面に戻ってきてるし、この分岐はきちんと働いてるんだよね。
  * ん！もしかしてcurrent_orderを使っているからかな？！
 * deliveryのアクション内で、@orderを使っていなかったからだぁ。。はぁ、、ちゃんと画面に渡すパラメータのことを理解しよう！

## undefined method `map' for "translation missing: ja.date.order" っていうエラーが発生
 * 配送日を設定するところで、エラーメッセージを表示するためにsimple_formの形式で記載したところ、このエラーが発生した。
 * http://qiita.com/wada811/items/e26692ca3dea4e03ba30

## simple_form形式だと、Date型のが3インプットになってしまってる。（年月日）
 * http://stackoverflow.com/questions/19761080/formatting-a-date-input-using-simple-form
  * :as => :string
   * これを追加すればOKだった！

## validationメッセージ
  * 各項目ごとに未入力のメッセージ書いてるけど、これって共通化できないのかな？

## deviseに追加したテーブルのフィールドバリデーションが上手くいっていない
 * edit以外のフォームを表示するようにしているから、エラー発生後の情報を正しく渡せていない？
### 検証したこと
 * deviseのカスタムフィールドを特定の場合のみvalidationでチェックをするようにしたい。
  * http://qiita.com/yui-knk/items/b02fea5cfc74443c828d
   * validate ifを用いて実装　→　ifに設定している関数を動作確認用にtrueにした結果、遷移先がdevise.registration.editになっている
 * deviseの更新時の処理を確認
  * https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb
   * updateでエラー発生時の処理はオーバーライドで編集不可
  * http://stackoverflow.com/questions/19574643/rails-4-how-overwrite-devise-respond-path-upon-error
   * エラー時に独自の処理を実装するためには、update関数全体をオーバーライドする必要があるのかもと予測
   * update関数全体をオーバーライドし、お届先情報の入力自体位をcheck_outs_controllerからregistrations_controllerに移動（あわせてroutingやviewも修正）
    * エラー発生後にエラーが表示されない。。（デプロイするために一旦この変更はロールバック）
  * 対応方法について質問実施
  