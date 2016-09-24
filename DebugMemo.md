 # 躓きストック

 * deviseを利用した際に、「LoadError: cannot load such file — bcrypt_ext」というエラーが発生した。
  * http://stackoverflow.com/questions/33588735/loaderror-cannot-load-such-file-bcrypt-ext-on-windows-2008-x64-server
   * bcryptを入れてみても解消されず。gemfileに追加したら、bundle installでも同様のエラーが発生していた。↑のサイトに習って、db:migrateをしても同様のエラーが発生している。
  * http://qiita.com/yukkie/items/a9a02edd953a505491e5
   * 試しに再起動（PCでしちゃったけど）してみたけど解消されず。
  * http://qiita.com/toshikase/items/d04634c6157656300c72
   * ｷﾀ━━━━(ﾟ∀ﾟ)━━━━!!ここの方法で解消済
    * `TODO` 参考リンク要確認！バージョンが指定バージョンでいいかどうかもチェック！