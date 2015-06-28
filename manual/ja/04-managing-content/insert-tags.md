## 挿入タグ

挿入タグはページが画面を表示するときに、動的なコンテンツと置き換わるワイルドカードです。例えば、現在の日付を表示し、フロントエンドのユーザーの名前に宛て、ファイルを取り込むといったことができます。挿入タグはContaoのほとんどどこでも、キャッシュされたページでさえも使用できます。


### リンク要素

以下の挿入タグを使用すると、IDやエイリアスで指定した他のページやアーティクルのリンクできます。

{% raw %}
<table>
<tr>
  <th>挿入タグ</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>{{link::*}}</code></td>
  <td>このタグは内部のページのリンクに置き換わります。(*をページのIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{link::back}}</code></td>
  <td>このタグは最後にアクセスしたページのリンクに置き換わります。また、"link_open"、"link_url"、"link_title"とも使用できます。</td>
</tr>
<tr>
  <td><code>{{link::login}}</code></td>
  <td>このタグは現在ログインしているフロントエンドユーザーのログインページ(があれば)のリンクに置き換わります。</td>
</tr>
<tr>
  <td><code>{{link_open::*}}</code></td>
  <td>このタグは内部のページのリンクの開きタグと置き換わります: <code>{{link_open::12}}ここをクリック{{link_close}}</code>。</td>
</tr>
<tr>
  <td><code>{{link_url::*}}</code></td>
  <td>このタグは内部のページのURLと置き換わります: <code>&lt;a href="{{link_url::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{link_title::*}}</code></td>
  <td>このタグは内部のページの題名と置き換わります: <code>&lt;a title="{{link_title::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{link_close}}</code></td>
  <td>このタグは内部のページのリンクの閉じタグと置き換わります: <code>{{link_open::12}}ここをクリック{{link_close}}</code>。</td>
</tr>
<tr>
  <td><code>{{article::*}}</code></td>
  <td>このタグはアーティクルのリンクに置き換わります。(*はアーティクルのIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{article_open::*}}</code></td>
  <td>このタグはアーティクルのリンクの開きタグと置き換わります: <code>{{article_open::12}}ここをクリック{{link_close}}</code>。</td>
</tr>
<tr>
  <td><code>{{article_url::*}}</code></td>
  <td>このタグはアーティクルのURLと置き換わります: <code>&lt;a href="{{article_url::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{article_title::*}}</code></td>
  <td>このタグはアーティクルの題名と置き換わります: <code>&lt;a title="{{article_title::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{news::*}}</code></td>
  <td>このタグはニュース項目のリンクに置き換わります。(*はニュース項目のIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{news_open::*}}</code></td>
  <td>このタグはニュース記事のリンクの開きタグと置き換わります: <code>{{news_open::12}}ここをクリック{{link_close}}</code>。</td>
</tr>
<tr>
  <td><code>{{news_url::*}}</code></td>
  <td>このタグはニュース記事のURLと置き換わります: <code>&lt;a href="{{news_url::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{news_title::*}}</code></td>
  <td>このタグはニュース記事の題名と置き換わります: <code>&lt;a title="{{news_title::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{event::*}}</code></td>
  <td>このタグはイベントのリンクに置き換わります。(*はイベントのIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{event_open::*}}</code></td>
  <td>このタグはイベントのリンクの開きタグと置き換わります: <code>{{event_open::12}}ここをクリック{{link_close}}</code>..</td>
</tr>
<tr>
  <td><code>{{event_url::*}}</code></td>
  <td>このタグはイベントのURLと置き換わります: <code>&lt;a href="{{event_url::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{event_title::*}}</code></td>
  <td>このタグはイベントの題名と置き換わります: <code>&lt;a title="{{event_title::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{faq::*}}</code></td>
  <td>このタグはFAQの質問のリンクに置き換わります。(*はFAQの質問のIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{faq_open::*}}</code></td>
  <td>このタグは質問のリンクの開きタグと置き換わります: <code>{{faq_open::12}}ここをクリック{{link_close}}</code>。</td>
</tr>
<tr>
  <td><code>{{faq_url::*}}</code></td>
  <td>このタグは質問のURLと置き換わります: <code>&lt;a href="{{faq_url::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
<tr>
  <td><code>{{faq_title::*}}</code></td>
  <td>このタグは質問の題名と置き換わります: <code>&lt;a title="{{faq_title::12}}"&gt;ここをクリック&lt;/a&gt;</code>。</td>
</tr>
</table>
{% endraw %}


### ユーザーの属性

以下の挿入タグを使用すると、現在ログインしているユーザーの任意の属性を表示できます。

{% raw %}
<table>
<tr>
  <th>挿入タグ</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>{{user::firstname}}</code></td>
  <td>このタグは現在ログインしているユーザーの名に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::lastname}}</code></td>
  <td>このタグは現在ログインしているユーザーの姓に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::company}}</code></td>
  <td>このタグは現在ログインしているユーザーの会社や組織の名前に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::phone}}</code></td>
  <td>このタグは現在ログインしているユーザーの電話番号に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::mobile}}</code></td>
  <td>このタグは現在ログインしているユーザーの携帯番号に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::fax}}</code></td>
  <td>このタグは現在ログインしているユーザーのFAX番号に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::email}}</code></td>
  <td>このタグは現在ログインしているユーザーの電子メールアドレスに置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::website}}</code></td>
  <td>このタグは現在ログインしえいるユーザーのウェブアドレスに置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::street}}</code></td>
  <td>このタグは現在ログインしているユーザーの住所に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::postal}}</code></td>
  <td>このタグは現在ログインしているユーザーの郵便番号に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::city}}</code></td>
  <td>このタグは現在ログインしているユーザーの市区町村に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::country}}</code></td>
  <td>このタグは現在ログインしているユーザーの国に置き換わります。</td>
</tr>
<tr>
  <td><code>{{user::username}}</code></td>
  <td>このタグは現在ログインしているユーザーのユーザー名に置き換わります。</td>
</tr>
</table>
{% endraw %}


### ページの属性

次の挿入タグを使用すると、現在のページの任意の属性を表示できます。

{% raw %}
<table>
<tr>
  <th>挿入タグ</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>{{page::id}}</code></td>
  <td>このタグは現在のページのIDに置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::alias}}</code></td>
  <td>このタグは現在のページのエイリアスに置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::title}}</code></td>
  <td>このタグは現在のページの名前に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::pageTitle}}</code></td>
  <td>このタグは現在のページの題名に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::language}}</code></td>
  <td>このタグは現在のページの言語に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::parentAlias}}</code></td>
  <td>このタグは親のページのエイリアスに置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::parentTitle}}</code></td>
  <td>このタグは親のページの名前に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::parentPageTitle}}</code></td>
  <td>このタグは親のページの題名に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::mainAlias}}</code></td>
  <td>このタグは親のメインページのエイリアスに置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::mainTitle}}</code></td>
  <td>このタグは親のメインページの名前に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::mainPageTitle}}</code></td>
  <td>このタグは親のメインページの題名に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::rootTitle}}</code></td>
  <td>このタグはウェブサイトの名前に置き換わります。</td>
</tr>
<tr>
  <td><code>{{page::rootPageTitle}}</code></td>
  <td>このタグはウェブサイトの題名に置き換わります。</td>
</tr>
</table>
{% endraw %}


### 環境変数

以下の挿入タグを使用すると、ページ名やリクエスト文字列のような環境変数を表示できます。

{% raw %}
<table>
<tr>
  <th>挿入タグ</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>{{env::host}}</code></td>
  <td>このタグは現在のホスト名に置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::url}}</code></td>
  <td>このタグは現在のホスト名とプロトコルに置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::path}}</code></td>
  <td>このタグはContaoのディレクトリのパスを含んだ現在の基準(base)のURLに置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::request}}</code></td>
  <td>このタグは現在のリクエスト文字列に置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::ip}}</code></td>
  <td>このタグは現在アクセスしているクライアントのIPアドレスに置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::referer}}</code></td>
  <td>このタグは最後にアクセスしたページのURLに置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::files_url}}</code></td>
  <td>このタグはfilesディレクトリの静的なURLに置き換わります。</td>
</tr>
<tr>
  <td><code>{{env::assets_url}}</code></td>
  <td>このタグはassetsディレクトリの静的なURLに置き換わります。</td>
</tr>
</table>
{% endraw %}


### 要素の取り込み

以下の挿入タグを使用すると、アーティクル、モジュール、"templates"ディレクトリからのファイルのような様々なリソースを取り込めます。

{% raw %}
<table>
<tr>
  <th>挿入タグ</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>{{insert_article::*}}</code></td>
  <td>このタグは参照しているアーティクルに置き換わります。(*をアーティクルのIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{insert_content::*}}</code></td>
  <td>このタグは参照しているコンテント要素に置き換わります。(*をコンテント要素のIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{insert_module::*}}</code></td>
  <td>このタグは参照しているモジュールに置き換わります。(*をモジュールのIDかエイリアスに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{insert_form::*}}</code></td>
  <td>このタグは参照しているフォームに置き換わります。(*をフォームのIDに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{article_teaser::*}}</code></td>
  <td>このタグはアーティクルのティーザーに置き換わります。(*をアーティクルのIDに置き換えてください。).</td>
</tr>
<tr>
  <td><code>{{news_teaser::*}}</code></td>
  <td>このタグはニュースのティーザーに置き換わります。(*をニュースのIDに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{event_teaser::*}}</code></td>
  <td>このタグはイベントのティーザーに置き換わります。(*をイベントのIDに置き換えてください。)</td>
</tr>
<tr>
  <td><code>{{file::*}}</code></td>
  <td>このタグは"templates"のディレクトリにある.php、.tpl、.xhtml、.html5の拡張子のファイルの内容に置き換わります。(*をファイル名に置き換えてください。)<br>引数を指定することもできます。例: <code>{{file::file.php?arg1=val&amp;arg2=val}}</code> さらにファイルのUUIDを指定してパスをデータベースから取り出せます。例: <code>{{file::6939a448-9b30-11e4-bcba-079af1e9baea}}</code></td>
</tr>
</table>
{% endraw %}


### 様々な挿入タグ

以下の挿入タグを使用すると、現在の日付やlightbox画像を含めるといった様々な処理を実行できます。

{% raw %}
<table>
<tr>
  <th>挿入タグ</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>{{date}}</code></td>
  <td>このタグは全体的な日付の書式による現在の日付に置き換わります。</td>
</tr>
<tr>
  <td><code>{{date::*}}</code></td>
  <td>このタグは独自に指定した日付の書式による、現在の日付に置き換わります。</td>
</tr>
<tr>
  <td><code>{{last_update}}</code></td>
  <td>このタグは全体的な日付の書式による最終更新の日付に置き換わります。</td>
</tr>
<tr>
  <td><code>{{last_update::*}}</code></td>
  <td>このタグは独自に指定した日付の書式による、最終更新の日付に置き換わります。</td>
</tr>
<tr>
  <td><code>{{email::*}}</code></td>
  <td>このタグはクリック可能な暗号化した電子メールアドレスに置き換わります。</td>
</tr>
  <td><code>{{email_open::*}}</code></td>
  <td>このタグはクリック可能な暗号化した電子メールアドレスに置き換わります。しかし、閉じる<code>&lt;/a&gt;</code>を追加しません。</td>
</tr>
<tr>
  <td><code>{{email_url::*}}</code></td>
  <td>このタグは暗号化した電子メールアドレスだけに置き換わります。</td>
</tr>
<tr>
  <td><code>{{lang::*}}</code></td>
  <td>このタグはテキスト中の外国の単語にしるしを付けるのに使用できます: <code>{{lang::fr}}Au revoir{{lang}}</code>。これは<code><span lang="fr" xml:lang="fr">Au revoir</span></code>に置き換わります。</td>
</tr>
<tr>
  <td><code>{{abbr::*}}</code></td>
  <td>テキストに略称を付けます: <code>{{abbr::World Wide Web}}WWW{{abbr}}</code>。これは<code><abbr title="World Wide Web">WWW</abbr></code>に置き換わります。</td>
</tr>
<tr>
  <td><code>{{acronym::*}}</code></td>
  <td>テキストに頭字語を付けます: <code>{{acronym:: Multipurpose Internet Mail Extensions}}MIME{{acronym}}</code>。これは<code><acronym title="Multipurpose Internet Mail Extensions">MIME</acronym></code>に置き換わります。</td>
</tr>
<tr>
  <td><code>{{ua::*}}</code></td>
  <td>ユーザーエージェントの特性を出力します: <code>{{ua::browser}}</code>。これは"chrome"に置き換わります。</td>
</tr>
<tr>
  <td><code>{{iflng::*}}</code></td>
  <td>このタグはページの言語がタグの言語と一致していないと完全に削除されます。言語に特定なラベルを設定するのに使用できます: <code>{{iflng::en}}Your name{{iflng::de}}Ihr Name{{iflng}}</code>。</td>
</tr>
<tr>
  <td><code>{{ifnlng::*}}</code></td>
  <td>このタグはページの言語がタグの言語と一致していると完全に削除されます。言語に特定なラベルを設定するのに使用できます: <code>{{ifnlng::de}}Your name{{ifnlng}}{{iflng::de}}Ihr Name{{iflng}}</code>。</td>
</tr>
<tr>
  <td><code>{{image::*}}</code></td>
  <td>このタグは画像のサムネイルに置き換わります。(*をデータベースのID、UUID、ファイルのパスに置き換えてください。):
      <code>{{image::58ca4a90-2d30-11e4-8c21-0800200c9a66?width=200&amp;height=150}}</code>.<br>
      <strong>width</strong>: サムネイルの幅、<br>
      <strong>height</strong>: サムネイルの高さ、<br>
      <strong>alt</strong>: 代替テキスト、<br>
      <strong>class</strong>: CSSのclass、<br>
      <strong>rel</strong>: rel属性(例えば"lightbox")、<br>
      <strong>mode</strong>: モード("proportional"、"crop"、"box")。</td>
</tr>
<tr>
  <td><code>{{label::*}}</code></td>
  <td>このタグは翻訳したラベルに置き換わります: <code>{{label::CNT:au}}</code>や<code>{{label::tl_article:title:0}}</code>。 最初のパラメーターは言語ファイルの名前、または<code>CNT</code>(国)、<code>LNG</code>(言語)といった頭字語です。例えば、<code>{{label::CNT:au}}</code>は"Australia"を、<code>{{label::tl_article:title:0}}</code>は"Title"を表示します。<br>
  最初のコロンだけ二重のコロンとなっていることに注意してください。</td>
</tr>
<tr>
  <td><code>{{version}}</code></td>
  <td>このタグは現在のContaoのバージョン(例えば 3.2.7)に置き換わります。</td>
</tr>
<tr>
  <td><code>{{request_token}}</code></td>
  <td>このタグは現在のセッションのリクエストトークに置き換わります。</td>
</tr>
<tr>
  <td><code>{{toggle_view}}</code></td>
  <td>携帯端末とデスクトップのレイアウトを切り替えるリンクを追加します。</td>
</tr>
<tr>
  <td><code>{{br}}</code></td>
  <td>このタグはHTMLの&lt;br&gt;タグ(改行)に置き換わります。</td>
</tr>
</table>
{% endraw %}


### 挿入タグのフラッグ

フラッグを使用すると、さらに挿入タグを処理できます。例えば、値を特定のPHPモジュールに渡せます。複数のフラッグを適用できます:

{% raw %}
```
{{ua::browser|uncached}}
{{page::title|decodeEntities|strtoupper}}
```
{% endraw %}

利用できるフラッグです:

<table>
<tr>
    <th>フラッグ</th>
    <th>説明</th>
    <th>さらなる情報</th>
</tr>
<tr>
    <td><code>uncached</code></td>
    <td>ページをキャッシュする時に挿入タグを置き換えません。</td>
    <td></td>
</tr>
<tr>
    <td><code>refresh</code></td>
    <td>同一のページで複数回使用している場合でも、挿入タグをキャッシュしません。</td>
    <td></td>
</tr>
<tr>
    <td><code>addslashes</code></td>
    <td>文字列をバックスラッシュによる引用をします。</td>
    <td><a target="_blank" href="http://php.net/addslashes">PHP function</a></td>
</tr>
<tr>
    <td><code>stripslashes</code></td>
    <td>文字列からバックスラッシュによる引用を削除します。</td>
    <td><a target="_blank" href="http://php.net/stripslashes">PHPの関数</a></td>
</tr>
<tr>
    <td><code>standardize</code></td>
    <td>出力を標準化します。(例: ページのエイリアスやCSSのクラス)</td>
    <td></td>
</tr>
<tr>
    <td><code>ampersand</code></td>
    <td>アンパサンドをHTMLのエンティティに変換します。</td>
    <td></td>
</tr>
<tr>
    <td><code>specialchars</code></td>
    <td>特殊文字をHTMLのエンティティに変換します。</td>
    <td></td>
</tr>
<tr>
    <td><code>nl2br</code></td>
    <td>文字列のすべての改行の前にHTMLの改行を挿入します。</td>
    <td><a target="_blank" href="http://php.net/nl2br">PHPの関数</a></td>
</tr>
<tr>
    <td><code>nl2br_pre</code></td>
    <td>nl2brと同様ですが、<code>&lt;pre&gt;</code>タグの中の改行を保持します。</td>
    <td></td>
</tr>
<tr>
    <td><code>strtolower</code></td>
    <td>文字列を小文字に変換します。</td>
    <td><a target="_blank" href="http://php.net/strtolower">PHPの関数</a></td>
</tr>
<tr>
    <td><code>utf8_strtolower</code></td>
    <td>Unicodeに配慮した小文字に変換します。</td>
    <td></td>
</tr>
<tr>
    <td><code>strtoupper</code></td>
    <td>文字列を大文字に変換します。</td>
    <td><a target="_blank" href="http://php.net/strtoupper">PHPの関数</a></td>
</tr>
<tr>
    <td><code>utf8_strtoupper</code></td>
    <td>Unicodeに配慮した大文字に変換します。</td>
    <td></td>
</tr>
<tr>
    <td><code>ucfirst</code></td>
    <td>文字列の最初の文字を大文字に変換します。</td>
    <td><a target="_blank" href="http://php.net/ucfirst">PHPの関数</a></td>
</tr>
<tr>
    <td><code>lcfirst</code></td>
    <td>文字列の最初の文字を小文字に変換します。</td>
    <td><a target="_blank" href="http://php.net/lcfirst">PHPの関数</a></td>
</tr>
<tr>
    <td><code>ucwords</code></td>
    <td>文字列中の単語のそれぞれの最初の文字を大文字にします。</td>
    <td><a target="_blank" href="http://php.net/ucwords">PHPの関数</a></td>
</tr>
<tr>
    <td><code>trim</code></td>
    <td>文字列の前後の空白を削除します。</td>
    <td><a target="_blank" href="http://php.net/trim">PHPの関数</a></td>
</tr>
<tr>
    <td><code>rtrim</code></td>
    <td>文字列の最後にある空白を削除します。</td>
    <td><a target="_blank" href="http://php.net/rtrim">PHPの関数</a></td>
</tr>
<tr>
    <td><code>ltrim</code></td>
    <td>文字列の最初にある空白を削除します。</td>
    <td><a target="_blank" href="http://php.net/ltrim">PHPの関数</a></td>
</tr>
<tr>
    <td><code>utf8_romanize</code></td>
    <td>出力をローマ字化します。</td>
    <td></td>
</tr>
<tr>
    <td><code>strrev</code></td>
    <td>文字列を逆順にします。</td>
    <td><a target="_blank" href="http://php.net/strrev">PHPの関数</a></td>
</tr>
<tr>
    <td><code>encodeEmail</code></td>
    <td>出力の電子メールのアドレスをエンコードします。</td>
    <td><code>String::encodeEmail</code>を参照</td>
</tr>
<tr>
    <td><code>decodeEntities</code></td>
    <td>出力のHTMLのエンティティをデコードします。</td>
    <td><code>String::decodeEntities()</code>を参照</td>
</tr>
<tr>
    <td><code>number_format</code></td>
    <td>数値を(少数桁なしで)書式整形します。</td>
    <td><code>System::getFormattedNumber()</code>を参照</td>
</tr>
<tr>
    <td><code>currency_format</code></td>
    <td>通貨を(少数第2位で)書式整形します。</td>
    <td><code>System::getFormattedNumber()</code>を参照</td>
</tr>
<tr>
    <td><code>readable_size</code></td>
    <td>ファイルの大きさを人が読みやすい書式に変換します。</td>
    <td><code>System::getReadableSize()</code>を参照</td>
</tr>
</table>
