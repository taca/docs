# ページの管理

以下の章ではContaoでページを管理する方法を説明しています。Contaoはページを基準としたコンテンツ管理システムなので、ページとサイト構造はウェブサイトの中心的な要素で、ページに関連していないコンテンツは決して表示されません。


## 構成要素

ページ、アーティクル、コンテンツ要素、モジュールが互いの関連の理解が、Contaoを学ぶための鍵となります。前に述べましたように、サイト構造はウェブサイトの中心的な要素です。ウェブサイトの訪問者は常にページをリクエストし、ノードを基盤としたCMSのようにアーティクルをリクエストするのではありません。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/components.jpg)

アーティクルとレイアウトの2つが、もっとも重要なページの要素であることを略図は示しています。アーティクルがページのコンテンツを保持する一方、ページレイアウトはウェブサイトにどのように表示するかを定めています。ContaoのレイアウトはCSSに基づいていて、もちろん表を使用したレイアウトではありません。続く章では、スタイルシートとモジュールの作成方法、それらのページレイアウトへの結合方法、ページレイアウトを使用するページの作成方法について説明します。


## テーマ

テーマ管理はバージョン2.9の新しい機能ですが、実際は今までのContaoの一部だった部分から強化したインターフェイスに過ぎません。ウェブサイトのデザインは一般的にスタイルシート、フロントエンドモジュール、ページレイアウト、ファイル、テンプレートから構成されていて、、これらをContaoのバックエンドで管理できます。このやり方をまったく変えずに、これらのリソースのインポートとエクスポートする選択肢をテーマ管理は追加しただけです。


### テーマとフロントエンドテンプレートの違い

テーマとフロントエンドテンプレートの主な違いは、[フロントエンドテンプレート][1]は完全に事前設定されたウェブサイトで、サンプルのサイト構造、アーティクル、コンテンツ要素、さらにユーザーとグループも含んでいます。テーマは対照的に、実際のウェブサイトのデザインだけを含んでいて、そのため既存のデータを失わずにインポートできます。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/theme-manager.jpg)


### テーマの構成要素

テーマは[スタイルシート][2]、 [フロントエンドモジュール][3]、[ページレイアウト][4]のグループで、これらはすべてデータベースで保持していて、テーマのエクスポート機構が自動的に認識します。続く章で、これらの要素をさらに詳しく学習します。テーマはファイルディレクトリの画像とその他のファイルを通常は含んでいて、テンプレートのディレクトリのテンプレートを含む場合があります。しかし、これらのリソースはテーマに自動的に関連付けられず、このためエクスポートに含めるためにテーマの設定で追加しなければなりません。


![](https://raw.github.com/contao/docs/3.0/manual/en/images/theme-settings.jpg)


### テーマのエクスポートとインポート

テーマをエクスポートするには、単にテーマのエクスポートのボタンをクリックして.ctoファイルを使用しているコンピューターにダウンロードしてください。.ctoはContaoのテーマのための独自の拡張子ですが、実際のファイルはZIPアーカイブで.zipファイルを扱える、どのプログラムでも展開できます。テーマを再インポートするには、.ctoファイルをインストールしたCOntaoにアップロードして、テーマ管理を開いて「テーマのインポート」をクリックしてください。複数のテーマを一度にインポートできます。インポートが完了した後で、サイト構造に新しいテーマのページレイアウトを割り当てられます。


## スタイルシート

アクセスしやすいウェブサイトは常にCSSを使用してスタイルを形作らなければなりませんが、これがContaoがバックエンドで書式定義を管理する「スタイルシート」のモジュールを含めている理由です。様々なContaoの要素を参照するには、それらのclass名を知る必要があります。[コンテンツ要素のクラス][5]は(例えば、ce_textといった)ce_で始まり、[モジュールのクラス][3]は(例えば、mod_searchといった)mod_で始まります。よくわからない場合は、単にページのソースを見てください。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/style-sheet.jpg)

それぞれのスタイルシートは1つ以上のメディアタイプと、Internet Exploreのバージョン(多数のバグの1つを修正が必要な場合)の両方またはどちらかに制限できます。書式定義の順序に注意してください、後の定義が前の書式定義を上書きするからです。

``` {.css}
/* 一般的な値を最初 */
.mod_search {
    margin:24px;
}

/* それからIE7用の値で上書き */
*:first-child+html .mod_search {
    margin:18px;
}
```

もし順序が逆だと、一般的な値をIEに特定のマージンで上書きしてしまうでしょう。


## モジュール

フロントエンドモジュールは、ウェブサイトに殆どどのような種類の機能でも追加できます。Contaoのコアは様々なナビゲーションメニューの生成、ユーザーの登録と認証、ウェブサイトの検索、RSSフィードの取り込み、さらに様々なモジュールを含んでいます。モジュールを作成するには、バックエンドにログインして、ナビゲーションメニューから「テーマ」→「フロントエンドモジュール」と選択してください。

<table>
<tr>
  <th>モジュール</th>
  <th>CSSのクラス</th>
  <th>説明</th>
</tr>
<tr>
  <td>ナビゲーションメニュー</td>
  <td>mod_navigation</td>
  <td>サイト構造からナビゲーションメニューを生成します。</td>
</tr>
<tr>
  <td>カスタムナビゲーション</td>
  <td>mod_customnav</td>
  <td>独自のナビゲーションメニューを生成します。</td>
</tr>
<tr>
  <td>パンくずナビゲーション</td>
  <td>mod_breadcrumb</td>
  <td>パンくずナビゲーションのメニューを生成します。</td>
</tr>
<tr>
  <td>クイックナビゲーション</td>
  <td>mod_quicknav</td>
  <td>サイト構造からドロップダウンメニューを生成します。</td>
</tr>
<tr>
  <td>クイックリンク</td>
  <td>mod_quicklink</td>
  <td>独自ののドロップダウンメニューを生成します。</td>
</tr>
<tr>
  <td>ブックナビゲーション</td>
  <td>mod_booknav</td>
  <td>ブックナビゲーションメニューを生成します。</td>
</tr>
<tr>
  <td>アーティクルナビゲーション</td>
  <td>mod_article_nav</td>
  <td>アーティクルをナビゲートするページネーションのメニューを生成します。</td>
</tr>
<tr>
  <td>サイトマップ</td>
  <td>mod_sitemap</td>
  <td>サイト構造のすべてのページの一覧を生成します。</td>
</tr>
<tr>
  <td>ログインフォーム</td>
  <td>mod_login</td>
  <td>ログインのフォームを生成します。</td>
</tr>
<tr>
  <td>自動ログアウト</td>
  <td>-</td>
  <td>ユーザーを自動的にログアウトします。</td>
</tr>
<tr>
  <td>個人データ</td>
  <td>member_default</td>
  <td>ユーザーの個人データを編集するフォームを生成します。</td>
</tr>
<tr>
  <td>登録</td>
  <td>member_default</td>
  <td>ユーザーの登録フォームを生成します。</td>
</tr>
<tr>
  <td>パスワードの紛失</td>
  <td>mod_password</td>
  <td>新しいパスワードを要求するフォームを生成します。</td>
</tr>
<tr>
  <td>フォーム</td>
  <td>mod_form</td>
  <td>ページにフォームを追加します。</td>
</tr>
<tr>
  <td>検索エンジン</td>
  <td>mod_search</td>
  <td>ページに検索フォームを追加します。</td>
</tr>
<tr>
  <td>アーティクルリスト</td>
  <td>mod_article_list</td>
  <td>一列のアーティルクの一覧を生成します。</td>
</tr>
<tr>
  <td>カスタムHTML</td>
  <td>-</td>
  <td>独自のHTMLコードを追加します。</td>
</tr>
<tr>
  <td>Flash動画</td>
  <td>mod_flash</td>
  <td>ページにFlash動画を埋め込みます。</td>
</tr>
<tr>
  <td>ランダムな画像</td>
  <td>mod_random_image</td>
  <td>ページにランダムな画像を追加します。</td>
</tr>
<tr>
  <td>リスティング</td>
  <td>list_default</td>
  <td>テーブルのレコードを一覧します。</td>
</tr>
<tr>
  <td>RSSリーダー</td>
  <td>rss_default</td>
  <td>RSSフィードをページに追加します。</td>
</tr>
</table>


### アクセス制御

それぞれのフロントエンドモジュールは保護してウェブサイドでゲストだけ、または特定のグループのメンバーだけに表示するようにできます。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/protected-module.jpg)


## ページレイアウト

ページレイアウトは例えば列の数や全体の幅といった基本的なページの設定と、それぞれの列にどのフロントエンドモジュールを表示するか定めます。また、ページに含めるスタイルシート、RSSやATOMのフィードのリンク、GoogleアナリティクスのIDの関連付け、対話的な要素とプラグインに必要な任意のJavaScriptのコードを追加できます。ContaoのCSSのフレームワークはブラウザーのウィンドウを自動的にいくつかのレイアウトセクションに分割して、次の図のようにそれぞれのセクションに割り当てたモジュールを下図のように表示します。


![](https://raw.github.com/contao/docs/3.0/manual/en/images/front-end-structure.jpg)

![](https://raw.github.com/contao/docs/3.0/manual/en/images/front-end-modules.jpg)

これは、ページレイアウトを作成するまでに含めるすべてのスタイルシートとフロントエンドモジュールを作成が必要なことを意味します。従って、以下の順序でリソースを作成することをお勧めします:

* 必要なフロントエンドモジュールの作成
* 必要なスタイルシートの作成
* ニュースアーカイブやカレンダーが必要であれば作成
* 新しいページレイアウトを作成して、これらの構成要素を結合


## ページの種類

The page type determines whether a page shows content, forwards to another page
or defines the starting point of a new website within the page tree. Contao
supports 6 different page types which are explained below.

<table>
<tr>
  <th>Page type</th>
  <th>Description</th>
</tr>
<tr>
  <td>Regular page</td>
  <td>A regular page contains articles and content elements. It behaves like a
      static HTML page.</td>
</tr>
<tr>
  <td>External redirect</td>
  <td>This type of page automatically redirects visitors to an external website.
      It works like a hyperlink.</td>
</tr>
<tr>
  <td>Internal redirect</td>
  <td>This type of page automatically forwards visitors to another page within
      the site structure.</td>
</tr>
<tr>
  <td>Website root</td>
  <td>This type of page marks the starting point of a new website within the
      site structure.</td>
</tr>
<tr>
  <td>403 Access denied</td>
  <td>If a user requests a protected page without permission, a 403 error page
      will be loaded instead.</td>
</tr>
<tr>
  <td>404 Page not found</td>
  <td>If a user requests a non-existent page, a 404 error page will be loaded
      instead.</td>
</tr>
</table>


### Multi-domain mode

Contao supports multiple websites within the site structure and automatically
redirects visitors to a particular website root page depending on its DNS and
language settings. Let us assume that you are running a bilingual corporate
website which uses the domain "www.company.com" and a small private website
which uses the domain "www.personal-website.com". You need three website root
pages for that:

<table>
<tr>
  <th>Type</th>
  <th>DNS</th>
  <th>Language code</th>
  <th>Fallback language</th>
</tr>
<tr>
  <td>German corporate website</td>
  <td>none</td>
  <td>de</td>
  <td>no</td>
</tr>
<tr>
  <td>English corporate website</td>
  <td>none</td>
  <td>en</td>
  <td>yes</td>
</tr>
<tr>
  <td>Personal website</td>
  <td>personal-website.com</td>
  <td>de</td>
  <td>yes</td>
</tr>
</table>

The following table shows to which page a visitor will be redirected depending
on the domain and his browser language.

<table>
<tr>
  <th>Domain</th>
  <th>Browser language</th>
  <th>Redirect target</th>
</tr>
<tr>
  <td>www.company.com</td>
  <td>English</td>
  <td>English corporate website</td>
</tr>
<tr>
  <td>www.company.com</td>
  <td>German</td>
  <td>German corporate website</td>
</tr>
<tr>
  <td>www.company.com</td>
  <td>Spanish</td>
  <td>English corporate website</td>
</tr>
<tr>
  <td>www.personal-website.com</td>
  <td>irrelevant</td>
  <td>Personal website</td>
</tr>
</table>

Note that if we had not set the "language fallback" option, the personal website
would only be available for German speaking users!


### Access rights

Access rights determine what back end users are allowed to do with a page and
its articles. It has nothing to do with protected pages that can only be
accessed by certain front end users! Similar to the Unix file permission system,
there are three permission levels:

* Access as the owner of a page
* Access as a member of the group that owns the page
* Access as an unprivileged user


Each level can have different permissions. By default, the owner of a page is
allowed to edit the page itself as well as its articles, whereas a member of the
group that owns a page is only allowed to edit articles. Unprivileged users have
no writing permissions at all.

![](https://raw.github.com/contao/docs/3.0/manual/en/images/access-rights.jpg)


[1]: https://contao.org/en/contao-themes-and-templates.html
[2]: 03-Managing-pages.md#style-sheets
[3]: 03-Managing-pages.md#modules
[4]: 03-Managing-pages.md#page-layouts
[5]: 04-Managing-content.md#articles
