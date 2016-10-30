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
  * 10/21再度試してみたら入れられた？？なんでだろう？？ちなみに今回はbundle exec guard経由だけど、それが理由かな？？

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
### 検証したこと
 * deviseのカスタムフィールドを特定の場合のみvalidationでチェックをするようにしたい。
  * http://qiita.com/yui-knk/items/b02fea5cfc74443c828d
   * validate ifを用いて実装　→　ifに設定している関数を動作確認用にtrueにした結果、遷移先がdevise.registration.editになっている
   * edit以外のフォームを表示するようにしているから、エラー発生後の情報を正しく渡せていない？と仮定 
 * deviseの更新時の処理を確認
  * https://github.com/plataformatec/devise/blob/master/app/controllers/devise/registrations_controller.rb
   * updateでエラー発生時の処理はオーバーライドで編集不可であることを確認
  * http://stackoverflow.com/questions/19574643/rails-4-how-overwrite-devise-respond-path-upon-error
   * エラー時に独自の処理を実装するためには、update関数全体をオーバーライドする必要があるのかもと予測
   * update関数全体をオーバーライドし、お届先情報の入力自体位をcheck_outs_controllerからregistrations_controllerに移動（あわせてroutingやviewも修正）
    * エラー発生後にエラーが表示されない。。（デプロイするために一旦この変更はロールバック）
  * 対応方法について質問実施
### 伺ったこと
 * お届け先住所のフォームのアクションを PUT /user にしているようですが、これだと devise 配下のアクションになり、カスタマイズ不可というわけではないのですが、ちょっと面倒になります。
 * ここでアップデートしている内容は、deviseに関係のないフィールドなので、あえて devise 配下のところで処理しなくても良いと思います。
### 伺ったことのお陰で無事解決できました。。！
 * member {put :update_user_info}
 * check_outs_controllerにアクション追加し、そのアクションでのsave時にvalidationが行われるように設定
 * viewのパスを新たに定義したパスを指定

## 数値フォーマットでカンマ付き
 * http://stackoverflow.com/questions/1078347/is-there-a-rails-trick-to-adding-commas-to-large-numbers
 * number_with_delimiter(@number, :delimiter => ',')
  
## JQueryで日付間の日数取得
 * http://stackoverflow.com/questions/20537165/how-to-count-days-between-two-dates-in-javascript
 * var diffDays = Math.round(Math.abs((firstDate.getTime() - secondDate.getTime())/(oneDay)))

## 週末を除いて日付を取得
 * http://stackoverflow.com/questions/8451190/add-no-of-days-in-a-date-to-get-next-dateexcluding-weekends
 * 愚直にくるくる回しながら該当曜日をスキップする

## phurchased_orders?
 * http://stackoverflow.com/questions/5856838/scope-with-join-on-has-many-through-association
  * 最初上記のサイトを参考に、whereとscopeで対応しようとしたが、whereという関数が定義されていないと怒られてしまったため、現在の作り（リレーションを張っている子供へのwhere）に変更した。

## Hamlでリンクタグ以外でリンクができるように作るには
 * http://stackoverflow.com/questions/11478743/haml-with-rails-making-a-table-column-into-a-link/21482372#21482372
  * data-linkなどdata属性を定義し、且つ、jQuey側で遷移機能を実装すればOK

## linkをボタンレイアウトに
 * 前にもやったけれど、忘れていたのでメモ
  * class: "btn btn-xx"を指定すればOK

## rubocop導入！
 * autocorrectでスペースとかの修正は適時行ってくれる便利！
 * ルールとかも共通設定且つカスタマイズが可能みたい！時間を見て調査すること！
  * http://www.rubydoc.info/github/bbatsov/rubocop/Rubocop/Cop
   * ↑rubocopのルール

## kaminariを導入。でもエラーがでてる。page_entries_infoで。
 * http://qiita.com/rojiuratech/items/7f31fc81fdd2ebc0fe8c
 * http://sandragon.hatenablog.com/entry/2012/09/30/182651
 * 凡ミス。。コントローラーのパラメーター名をタイポしていた。。( TДT)

## kaminariにbootstrapのデザイン適用しようとしたらエラーが出てる
 *  `connect_nonblock': SSL_connect returned=1 errno=0 state=SSLv3 read server certificate B: certificate verify failed
  * rails g kaminari:views bootstrap
  * rails g kaminari:views bootstrap3
 * http://d.hatena.ne.jp/komiyak/20130508/1367993536
 * http://stackoverflow.com/questions/21201493/couldnt-require-openssl-in-ruby
 * http://gagapi.hatenablog.jp/entry/2013/06/09/213814
  * ここのを参考に対応→ただ、「どこのサイトの（GitHub?のどこ?）」証明書を「どのように」取得可能なのかがいまいち不明。一旦は後回しに。
 * C:\Ruby23-x64\lib\ruby\2.3.0\openssl
  * 関連するクラスとかはここにあるみたい。

## rubocopのルール上書き
 * http://qiita.com/necojackarc/items/8bc16092bbc69f17a16d
 
## users model rubocop
 * http://www.rubydoc.info/github/bbatsov/rubocop/Rubocop/Cop/Style/RedundantSelf
  * selfを付けると上記の指摘があったため、selfつけず。

## 以下はhashのキーが文字列なのであえて=>の記法
 * %tr.clickable-row{"data-link" => check_out_path(order)}
 * %div.img-thumbnail.image-box{"data-link" => product_path(product)}
 * applicaiton.html.hamlのデフォルト記述

## associationは設定していたけれど、テーブルのリレーションを貼っていなかったことが判明
 * shouldaのテストを書いた時に、何故かExpected OrderItem to have a belongs_to association called Product (no association called Product)とエラーがでていた。
  * shouldaではない書き方だったらエラーにならず。
   *    t = Product.reflect_on_association(:order_items)
   *    t.macro.should == :has_many
  * 調べたところリレーションが正しく貼られていないことが原因ぽい
   * http://stackoverflow.com/questions/11705772/rails-one-to-many-association-fails-due-to-foreign-key-validation

## テーブルのリレーションの貼り方
 * http://tkymtk.hatenablog.com/entry/rails-4-three-way-to-write-migration-2014-1
  * 作成時に設定してしまうのがシンプル。今回はadd_referenceで対応する。
   * add_referenceだと新たに列を作っちゃう。。そうすると既存の列と同じだからって怒られてしまうから、一旦はindexとforeignkeyをそれぞれ追加する方法で対応してみた。

### 。。のにもかかわらずテストでエラーが！
~~~
  describe OrderItem do
     it { should belong_to(:product) }
  end
~~~
* belong_toのところ、誤った理解で先頭大文字で書いてしまっていたのが原因！
 * http://stackoverflow.com/questions/15723856/correct-way-of-testing-associations-with-rspec

## migrationファイル
 * destroyしてmigrationファイルを消しても、当然ながら、db:migrateしたあとは消したファイルの変更もdbに反映されちゃってる！
 * rollbackで変更前に戻れなかったのは、そもそもmigrationファイルをそういう作りにしておかなかったからかな。。

## Cannot add or update a child row: a foreign key constraint fails
 * foreignKeyを貼ろうとしている列の整合性を満たしていないデータが存在している場合に発生するエラー。

## herokuにデプロイできない？！
 * herokuにデプロイしようとしたらエラーが発生している
  * 最後にデプロイしたのは昨日（10/20）今日は21時近くに初めてデプロイ対応。
   * Heroku Git error, please try again shortly. 
   * fatal: unable to access 'https://git.heroku.com/sakuramarket.git/': The requested URL returned error: 500
 * ここで一旦Herokuにアクセスしてみればよかったんだけど、、一旦検索して以下のページを参考に対応
  * http://nafuruby.hatenablog.com/entry/2014/10/18/004834
   * 手順2でsshのところで上手く動かず、エラーメッセージも少し違っていたので、別のところで再検索
  * http://stackoverflow.com/questions/28641851/cannot-push-to-heroku-fatal-unable-to-access-could-not-resolve-host-nil-n 
   * git remote add heroku git@heroku.com:sakura_market.git
   * fatal: Could not read from remote repository. 
   * あ、アンスコいらなかったからかも。
  * 以下を実行
   * git remote rm heroku  
   * git remote add heroku git@heroku.com:sakuramarket.git
  * heroku keys:addでもエラーが起きてる
   * spawn ssh-keygen ENOENT
  * git push heroku masterしてみると
   * ssh_exchange_identification: read: Connection reset by peer

### sshコマンドを利用する
 * http://vogel.at.webry.info/201507/article_3.html      
 * herokuのページにアクセスしてみたら、以下のような画面が表示されてる！
  * API Unavailable
   * Our apologies, but there seems to have been a problem communicating with the Heroku API. If this problem persists, please e-mail support@heroku.com.
 * heroku担当者に問い合わせ実施

### 無事デプロイできた！
 * herokuのログインができるようになっていた！
  * heroku toolbeltを再インストールしたことが時間差で効いたのかな？
 * 作業ディレクトリのherokuのリレーションが切れてしまっていたから、別のディレクトリにHerokuとのヒモ付を行った環境を再度構築！その上でデプロイできた！！

## カバレッジ計測ツールの導入
 * http://tech.mof-mof.co.jp/blog/coverage-wercker.html
 
## カバレッジを走らせるため、guardで毎回のrspec実行方法を変更（現状修正したファイルのみ実行）
 * http://ruby-rails.hatenadiary.com/entry/20141021/1413819783#guard-rspec-options
  * guard :rspec, cmd: "bundle exec rspec", all_after_pass: true
   * 上記の切り替えで実行の種類を制御可能

## deviseのユニットテスト作成
 * 新規ユーザーを登録するにあたってfactory_girlを導入
  * https://github.com/plataformatec/devise/wiki/How-To:-Test-controllers-with-Rails-3-and-4-(and-RSpec)
  * http://ayaketan.hatenablog.com/entry/2014/06/03/211110

### factory_girlの導入
 * http://qiita.com/muran001/items/436fd07eba1db18ed622
 * http://ruby-rails.hatenadiary.com/entry/20150102/1420174315
  * このサイトは丁寧な手順で記載されていて分かりやすかった

### faker導入
 * http://qiita.com/saino-katsutoshi/items/29c0918e489b27df637a
 * http://xoyip.hatenablog.com/entry/2014/05/11/201307
  * Faker::Internet.email↑について記載あり
 * https://github.com/stympy/faker
  * おお！なんだか色々あるみたい！slackの絵文字とか、ビールとか、本とか！へぇ！

## githubにpushできていなかった。。。
 * herokuの方だけ対応していて、githubの方はcloneとかしていなかった。。はう。。
 * cloneで同じローカルの作業ディレクトリから複数のpush先を設定するのがちょっと大変そうだったので、追加で調査
 * herokuは一番最初にまだdeployしていないタイミングでgithubのリポジトリと関連付けたからスムーズに行ったんだね。
  * http://stackoverflow.com/posts/16900010/revisions

## rspecのマッチャー
 * http://morizyun.github.io/blog/rspec-builtin-matcher-rails/
  * 色々と便利な書き方ができるみたい！都度都度で確認しよう！

## featureテスト記載
 * http://qiita.com/jnchito/items/607f956263c38a5fec24
  * ↑超参考になる！
### deviseのログインメソッド利用
 * http://totutotu.hatenablog.com/entry/2015/08/26/Devise%E3%81%A7%E3%83%AD%E3%82%B0%E3%82%A4%E3%83%B3%E7%8A%B6%E6%85%8B%E3%82%92%E7%94%A8%E3%81%84%E3%81%9F%E6%8C%AF%E3%82%8B%E8%88%9E%E3%81%84%E3%83%86%E3%82%B9%E3%83%88%E3%82%92%E6%9B%B8%E3%81%8F
### capybaraでalertのボタンを押す
 * http://altarf.net/computer/rails/3178
  * ↑ちょっとこれは煩雑。。で、↓を追加調査
 * http://stackoverflow.com/questions/6922241/rspec-capybara-how-to-click-on-alert-box
 * http://qiita.com/sawamur@github/items/952f34ac07cc3cc7515f
 * http://qiita.com/noriyotcp/items/9c469f2a1d8dece004b3
  * gem 'capybara-webkit'が入っていなかったのが原因かな？
#### capybara-webkitを入れられない。。
 * windowsでcapybara-webkitを入れる方法↓
  * http://d.hatena.ne.jp/penult/20140429/1398755123
  * 新たにアカウント作らないといけないのかぁ。。一旦保留だね。
  * https://groups.google.com/forum/#!topic/capybara-webkit/2tnnGLkrQkU
   * ここまでしないといけないの。。うーん。。。ちょっとなぁ。。
  * rubyを64bitから32bitに変更してみて検証してみる価値はあるかも

## deviseで管理者権限ユーザー
 * http://qiita.com/Yama-to/items/54ab4ce08e126ef7dade
  * でもこれはモデルまで分けるパターンだからここでは違うかな
 * https://github.com/plataformatec/devise/wiki/How-To:-Add-an-Admin-Role
  * 管理者ユーザーの列を追加する方式でしている。
   * userのモデルに管理者かどうかのチェックをするメソッドを追加しよう

## before_actionで処理を止める
 * https://teratail.com/questions/22079
  * rails5以降はfalseではなくthrow(:abort)を用いる

## railsで拡張メソッドを定義する際にどこにファイルを置くのか
 * http://stackoverflow.com/questions/5654517/in-ruby-on-rails-to-extend-the-string-class-where-should-the-code-be-put-in


 