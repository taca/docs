# コンテンツの管理

以下の章では、Contaoでコンテンツを管理する方法を説明します。Contaoのコアはアーティクル、ニュース、イベント、ニュースレター、フォームなどの多数の異なるコンテンツの種類をサポートしています。さらにバナー、チケット、プロダクト、お勧めなコンテンツの種類を[機能拡張リポジトリ][1]から利用可能です。コンテンツを作成するには、バックエンドにログインして、ナビゲーションメニューのコンテンツのセクションからモジュールを選択してください。


## アーティクル

アーティクルはコンテンツ要素の入れ物です。コンテンツ要素を一緒にグループ化して、移動、公開、複製、編集、エクスポートを個々に扱うの代わりに一度にまとめて行えます。それぞれのアーティクルは特定のページとレイアウトセクションに関連付けられています。このため、ウェブサイトとサイト構造の固定した位置となります。Contaoには、"続きを読む"のリンクを付けたアーティクルのティーザーだけを表示するオプションがあります。

### コンテンツ要素

コンテンツ要素はコンテンツを作成する簡単で直感的な方法です。Contaoは単にリッチテキストエディターを使用する代わりに、テキスト、箇条書き、表、ハイパーリンク、画像、ダウンロードといったコンテンツの種類に別々のコンテンツ要素を提供しています。Contaonのコアのコンテンツ要素の概要をここに示します:

<table>
<tr>
  <th>名前</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>見出し</td>
  <td>ce_headline</td>
  <td>見出し(h1からh6)を生成します。</td>
</tr>
<tr>
  <td>テキスト</td>
  <td>ce_text</td>
  <td><a href="http://www.tinymce.com">TinyMCE</a>を使用して書式整形できるリッチテキストエディターを生成します。</td>
</tr>
<tr>
  <td>HTML</td>
  <td>-</td>
  <td>独自のHTMLコードを追加できます。</td>
</tr>
<tr>
  <td>箇条書き</td>
  <td>ce_list</td>
  <td>順序付き、または順序なしの箇条書きを生成します。</td>
</tr>
<tr>
  <td>表</td>
  <td>ce_table</td>
  <td>並べ替えもできる表を生成します。</td>
</tr>
<tr>
  <td>コード</td>
  <td>ce_code</td>
  <td>コードの断片を強調表示して画面に表示します。</td>
</tr>
<tr>
  <td>アコーディオン(単一の要素)</td>
  <td>ce_accordion</td>
  <td>単一のアコーディオンの枠を(<a href="http://mootools.net">MooTools</a>で)生成します。</td>
</tr>
<tr>
  <td>アコーディオン(ラッパーの会誌)</td>
  <td>ce_accordionStart</td>
  <td>アコーディオンの枠を開始する部分を生成します。</td>
</tr>
<tr>
  <td>アコーディオン(ラッパーの終了)</td>
  <td>-</td>
  <td>アコーディオンの枠を終了する部分を生成します。</td>
</tr>
<tr>
  <td>コンテントスライダー(ラッパーの開始)</td>
  <td>ce_sliderStart</td>
  <td>スライダーのラッパーを開始する部分を生成します。</td>
</tr>
<tr>
  <td>コンテントスライダー(ラッパーの終了)</td>
  <td>-</td>
  <td>スライダーのラッパーを終了する部分を生成します。</td>
</tr>
<tr>
  <td>ハイパーリンク</td>
  <td>ce_hyperlink</td>
  <td>他のウェブサイトへのリンクを生成します。</td>
</tr>
<tr>
  <td>トップリンク</td>
  <td>ce_toplink</td>
  <td>ページの先頭に移動するリンクを生成します。</td>
</tr>
<tr>
  <td>画像</td>
  <td>ce_image</td>
  <td>単体の画像を生成します。</td>
</tr>
<tr>
  <td>ギャラリー</td>
  <td>ce_gallery</td>
  <td><a href="http://www.digitalia.be/software/slimbox">lightbox</a>の画像ギャラリーを生成します。</td>
</tr>
<tr>
  <td>映像や音声</td>
  <td>ce_player</td>
  <td>映像や音声のプレーヤーを生成します。</td>
</tr>
<tr>
  <td>YouTube</td>
  <td>ce_youtube</td>
  <td>YouTubeの映像を追加します。</td>
</tr>
<tr>
  <td>ダウンロード</td>
  <td>ce_download</td>
  <td>単体のファイルをダウンロードするリンクを生成します。</td>
</tr>
<tr>
  <td>複数ダウンロード</td>
  <td>ce_downloads</td>
  <td>複数のファイルをダウンロードするリンクを生成します。</td>
</tr>
<tr>
  <td>アーティクル</td>
  <td>-</td>
  <td>他のアーティクルを取り込みます。</td>
</tr>
<tr>
  <td>コンテンツ要素</td>
  <td>(親のclass)</td>
  <td>他のコンテンツ要素を取り込みます。</td>
</tr>
<tr>
  <td>フォーム</td>
  <td>ce_form</td>
  <td>フォームを取り込みます。</td>
</tr>
<tr>
  <td>モジュール</td>
  <td>(親のclass)</td>
  <td>フロントエンドモジュールを取り込みます。</td>
</tr>
<tr>
  <td>アーティクルのティーザー</td>
  <td>ce_teaser</td>
  <td>アーティクルのティーザーを取り込みます。</td>
</tr>
<tr>
  <td>コメント</td>
  <td>ce_comments</td>
  <td>アーティクルにコメントのフォームを追加します。</td>
</tr>
</table>


### アクセス制御

それぞれのコンテンツ要素を保護して、ウェブサイトでゲストだけ、または特定のグループのメンバーだけに表示するようにできます。

![](images/protected-element.jpg?raw=true)


### Flashコンテンツ

FLashコンテンツは特殊な種類のコンテンツで、ウェブサイトのアーティクルに表示する代わりに動的なFlash動画を"loadVars()"を使用して読み込みます。ContaoとFlashの間の通信ができるように、以下の関数を動画のルートのフレームに追加しなければなりません。:

``` {.as}
TextField.prototype._loadArticle = function(flashID) {
  tf = this;

  // HTMLモードを有効にして、HTMLのコンテンツを削除
  tf.html = true;
  tf.htmlText = "";

  // 新しいLoadVarsオブジェクトを生成
  lv = new LoadVars();
  lv["flashID"] = flashID;
  lv.sendAndLoad(URL + "flash.php", lv, "POST");

  lv.onLoad = function(success) {
    if (success) {
      tf.htmlText = lv["content"];
    }
  }
}

// Flashのコンテンツ"myArticle"をテキスト項目の"myTextBox"に読み込み
myTextBox._loadArticle("myArticle");
```


#### スタイルシートのインポート

以下のActionScriptで動的なテキスト項目を整形するスタイルシートをインポートできます:

``` {.as}
TextField.prototype._addCSS = function(style_sheet) {
  tf= this;
  tf.styleSheet = null;

  // 新しいStyleSheetオブジェクトのインスタンスを生成
  st = new TextField.StyleSheet();
  st.load(URL + style_sheet);

  st.onLoad = function(success) {
    if (success) {
      tf.styleSheet = st;
    }
  }
}

// スタイルシート"basic.css"をテキストボックス"myTextBox"に追加
myTextBox._addCSS("basic.css");
```

FlashはHTMLタグの少ない一部だけをサポートしているため、正しく表示されないスタイルもあることに注意してください。


## ニュース項目

ニュースの機能を使用すると、ニュース項目やブログのポストの管理とフロントエンドに表示をできます。特定のページに関連付けられているアーティクルと異なり、ニュース項目はニュースアーカイブにまとめられていて、簡単にグループ、分類、エクスポートができます。


### ニュースアーカイブ

ニュースアーカイブはニュース項目をグループ化と分類、またはその一方だけを行うために使用します。それぞれのアーカイブは特定の言語や話題に関連したものにできます。


### フロントエンドモジュール

ウェブサイトにニュース項目を表示するためにフロントエンドモジュールを使用します。フロントエンドモジュールはバックエンドの"モジュール"から設定でき、ウェブサイトに実際に表示するためにはアーティクルかページレイアウトに追加しなければなりません。ニュース/ブログには4つのフロントエンドモジュールがあります:

<table>
<tr>
  <th>モジュール</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>ニュースリスト</td>
  <td>mod_newslist</td>
  <td>ニュース項目のリストをページに追加します。</td>
</tr>
<tr>
  <td>ニュースリーダー</td>
  <td>mod_newsreader</td>
  <td>ニュース項目の詳細を表示します。</td>
</tr>
<tr>
  <td>ニュースアーカイブ</td>
  <td>mod_newsarchive</td>
  <td>ニュースアーカイブをページに追加します。</td>
</tr>
<tr>
  <td>ニュースアーカイブメニュー</td>
  <td>mod_newsarchiveMenu</td>
  <td>ニュースアーカイブを閲覧するためのナビゲーションメニューを生成します。</td>
</tr>
</table>


### 固定リンク

それぞれのニュース項目には、その参照に使用できる重複しないURL(固定リンク)があります:

```
http://www.example.com/news/items/james-wilson-returns.html
```

上記のURLは"news"というページから"james-wilson-returns"というニュース項目を要求します。Contaoはページに基づいたCMSであることを忘れないでください、"news"というページが存在しなかったり、ニュースリーダーモジュールを含んでいなかったりするとニュース項目を表示しません。


## イベント

カレンダーを使用すると、イベントを管理してウェブサイトにカレンダーやイベントのリストを表示できます。特定のページに関連付けられているアーティクルと異なり、イベントはカレンダーにまとめられていて、簡単にグループ、分類、エクスポートができます。


### カレンダー

カレンダーはイベントのグループ化と分類、またはその一方だけを行うために使用します。それぞれのカレンダーは特定の言語や話題に関連したものにできます。


### フロントエンドモジュール

ウェブサイトにイベントを表示するためにはフロントエンドモジュールを使用します。フロントエンドモジュールはバックエンドの"モジュール"から設定でき、ウェブサイトに実際に表示するためにはアーティクルかページレイアウトに追加しなければなりません。カレンダー拡張には4つのフロントエンドモジュールがあります:

<table>
<tr>
  <th>モジュール</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>カレンダー</td>
  <td>mod_calendar</td>
  <td>カレンダーをページに追加します。</td>
</tr>
<tr>
  <td>イベントリーダー</td>
  <td>mod_eventreader</td>
  <td>イベントの詳細を表示します。</td>
</tr>
<tr>
  <td>イベントリスト</td>
  <td>mod_eventlist</td>
  <td>イベントのリストをページに追加します。</td>
</tr>
<tr>
  <td>イベントリストメニュー</td>
  <td>mod_eventmenu</td>
  <td>イベントのリストを閲覧するメニューのナビゲーションを生成します。</td>
</tr>
</table>


### 固定リンク

それぞれのイベントには、その参照に使用できる重複しないURL(固定リンク)があります:

```
http://www.example.com/event-reader/events/final-exams.html
```

上記のURLは"events"というページから"final-exams"というニュース項目を要求します。Contaoはページに基づいたCMSであることを忘れないでください、"events"というページが存在しなかったり、イベントリーダーモジュールを含んでいなかったりするとイベントを表示しません。


## RSS/Atomフィード

この機能はニュースアーカイブとカレンダーに使用できます。ここではカレンダーリストでの例です。

![](images/rss-calendar.jpg?raw=true)


### 設定

1つ以上のカレンダーをグループにして、RSSやAtomのフィードに出力できます。ニュースアーカイブでも同様です。同時に、それぞれのイベントやニュースを、ティーザーだけか記事全体を出力するか選択できます。

![](images/rss-settings.jpg?raw=true)


### XMLファイル

XMLファイルは自動的にインストールしているContaoの```share```というディレクトリに生成します。ここでの例では次の様になります: ```share/events.xml```。


## ニュースレター

ニュースレターの機能を使用すると、ニュースレターの管理と送信、必要であればウェブサイトにニュースレターを表示できます。特定のページと関連付けられているアーティクルと違い、ニュースレターはチャンネルにまとめられていて、簡単にグループ化と分類ができます。


### 宛先

ニュースレターの購読は、それぞれのフロントエンドモジュールによって通常は処理するので、宛先を手作業で管理する必要はありません。データのプライバシーの理由で、Contaoは[二重のオプトイン][2]による購読の登録を必要とし、購読者の電子メールのアドレスだけ保管しています。

![](images/newsletter-recipients.jpg?raw=true)

既に宛先のリストがある場合は、CSVファイルからContaoにインポートできます。


### 名前入りのニュースレター

ニュースレターを登録したメンバーに送信する場合には、「シンプルトークン」と呼ばれる方法で個人向けにカスタマイズできます。シンプルトークンは[挿入タグ][3]に似ていて、ニュースレターのHTMLとテキストのコンテンツ両方に使用できます。

```
Dear ##firstname## ##lastname##,

please check and update your personal data:

Street: ##street##
Postal: ##postal##
City:   ##city##
Phone:  ##phone##
E-mail: ##email##

The Administrator
```

挿入タグと対照的に、シンプルトークンはメンバーのテーブル`tl_member`のデータを取り込むだけではなく、単純なif-else文を、例えば最初の挨拶の部分に指定できます。

```
{if gender=="male"}
Dear Mr ##lastname##,
{elseif gender=="female"}
Dear Mrs ##lastname##,
{else}
Dear Sirs,
{endif}

[newsletter content]

{if phone==""}
Please update your contact details and enter your phone number.
{endif}

The Administrator
```


### ニュースレターの送信

特に共有タイプのホスティングサービスでは、スクリプトの実行時間と1分に送信できる電子メールの数の両方、またはその一方について通常は制限されています。Contaoは両方の問題に、スクリプトの実行時間切れを防ぐために送信処理をいくつかの周期に分け、各周期の間に個別の待ち時間を加えて各周期の1分間の電子メールの数を制御する、といった方法で対処に努めています。

![](images/sending-newsletters.jpg?raw=true)


### フロントエンドモジュール

購読の処理と、ウェブサイトにニュースレーターを表示したい場合にフロントエンドモジュールを使用します。フロントエンドモジュールはバックエンドの"モジュール"から設定でき、ウェブサイトに実際に表示するためにはアーティクルかページレイアウトに追加しなければなりません。


<table>
<tr>
  <th>モジュール</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>登録の申し込み</td>
  <td>mod_subscribe</td>
  <td>1つ以上のチャンネルの登録を申し込みできるフォームを生成します。</td>
</tr>
<tr>
  <td>解除の申し込み</td>
  <td>mod_unsubscribe</td>
  <td>1つ以上のチャンネルの解除を申し込みできるフォームを生成します。</td>
</tr>
<tr>
  <td>ニュースレターリスト</td>
  <td>mod_nl_list</td>
  <td>ニュースレターのリストをページに追加します。</td>
</tr>
<tr>
  <td>ニュースレターリーダー</td>
  <td>mod_nl_reader</td>
  <td>ニュースレターの詳細を表示します。</td>
</tr>
</table>


### 固定リンク

それぞれのニュースレターには、その参照に使用できる重複しないURL(固定リンク)があります:

```
http://www.example.com/newsletters/items/james-wilson-returns.html
```

上記のURLは"newsletters"というページから"james-wilson-returns"というニュースレターを要求します。Contaoはページに基づいたCMSであることを忘れないでください、"newsletters"というページが存在しなかったり、ニュースレターリーダーモジュールを含んでいなかったりするとニュースレターを表示しません。


## フォーム

組み込みのフォームジェネレーターを使用すると対話的なフォームを作成して、記入内容を電子メールで送信や、Contaoのデータベースに保存できます。アップロードしたファイルは電子メールの添付ファイルとして送信や、Contaoのファイルディレクトリに保存できます。フォームジェネレターは4つの異なるデータの書式をサポートしています:

<table>
<tr>
  <th>書式</th>
  <th>説明</th>
</tr>
<tr>
  <td>生のデータ</td>
  <td>各項目を1行にしたテキスト形式のメッセージでフォームのデータを送信します。</td>
</tr>
<tr>
  <td>XMLファイル</td>
  <td>フォームのデータをXMLファイルとして電子メールに添付します。</td>
</tr>
<tr>
  <td>CSVファイル</td>
  <td>フォームのデータをCSVファイルとして電子メールに添付します。</td>
</tr>
<tr>
  <td>電子メール</td>
  <td>email、subject、message、cc(カーボンコピー)以外のすべての項目を無視して、フォームのデータをメールのクライアントから送信されたかのように送信します。ファイルのアップロードはできません。</td>
</tr>
</table>


### フォームの項目

コンテンツ要素と同様に、Contaoはテキスト入力、パスワード入力、選択メニュー、ファイルのアップロード、隠し入力、提出ボタンといった各種のフォームの項目に分けた要素を提供しています。Contaoのコアのフォームの項目の概要をここに示します:

<table>
<tr>
  <th>項目</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>見出し</td>
  <td>headline</td>
  <td>セクションの見出しを挿入するフォームの項目です。</td>
</tr>
<tr>
  <td>説明</td>
  <td>explanation</td>
  <td>説明のテキストを挿入するフォームの項目です。</td>
</tr>
<tr>
  <td>HTMLコード</td>
  <td>-</td>
  <td>HTMLコードを挿入するフォームの項目です。</td>
</tr>
<tr>
  <td>フィールドセット</td>
  <td>-</td>
  <td>オプションで見出しを付けられる、フォームの項目のコンテナです。
説明文を追加できる、フォームの項目を囲む枠です。(表を使用しないレイアウトだけで利用できます。)</td>
</tr>
<tr>
  <td>テキスト入力</td>
  <td>text</td>
  <td>短めから中くらいの長さのテキストのための1行の入力項目です。</td>
</tr>
<tr>
  <td>パスワード入力</td>
  <td>password</td>
  <td>パスワード入力のための1行の入力項目です。</td>
</tr>
<tr>
  <td>テキストエリア</td>
  <td>textarea</td>
  <td>中くらいから長いテキストのための複数行の入力項目です。</td>
</tr>
<tr>
  <td>選択メニュー</td>
  <td>select/multiselect</td>
  <td>1行または複数行のドロップダウンメニューです。</td>
</tr>
<tr>
  <td>ラジオボタンメニュー</td>
  <td>radio</td>
  <td>1つだけ選択できる複数の選択肢の一覧です。</td>
</tr>
<tr>
  <td>チェックボックスメニュー</td>
  <td>checkbox</td>
  <td>いくつでも選択できる複数の選択肢の一覧です。</td>
</tr>
<tr>
  <td>ファイルアップロード</td>
  <td>upload</td>
  <td>ローカルのファイルをサーバーにアップロードする1行の入力項目です。</td>
</tr>
<tr>
  <td>隠し入力</td>
  <td>-</td>
  <td>フォームに表示しない1行の入力項目です。</td>
</tr>
<tr>
  <td>セキュリティ質問</td>
  <td>captcha</td>
  <td>spamボットから保護するための単純な数学の質問(CAPTCHA)です。</td>
</tr>
<tr>
  <td>提出ボタン</td>
  <td>submit</td>
  <td>フォームを提出するボタンです。</td>
</tr>
</table>


### フロントエンドモジュール

フォームをウェブサイトに表示するためにフロントエンドモジュールを使用します。
フォームはバックエンドの"Modules"のモジュールで構成でき、ウェブサイトに実際に表示するにはアーティクルやページに追加しなければなりません。フォームジェネレーター拡張はフロントエンドもジュールを1つ含んでいます:

<table>
<tr>
  <th>モジュール</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>フォーム</td>
  <td>mod_form</td>
  <td>フォームをページに追加します。</td>
</tr>
</table>


### コンテンツ要素

フォームをウェブサイトに表示するためにコンテンツ要素を使用します。フォームはバックエンドで"Form"のコンテンツ要素で構成でき、ウェブサイトに実際に表示するにはアーティクルに追加しなければなりません。フォームジェネレーター拡張はコンテンツ要素を1つ含んでいます:

<table>
<tr>
  <th>コンテンツ要素</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>フォーム</td>
  <td>ce_form</td>
  <td>フォームを含めます。</td>
</tr>
</table>


## コメント

コメントはバックエンドから管理できる別の形のコンテンツです。コメントを使用するには、カレンダーやニュースアーカイブの設定で有効にする必要があります。


### フロントエンドモジュール

ウェブサイトにコメントを表示するためにフロントエンドモジュールを使用します。フロントエンドモジュールはバックエンドの"モジュール"から設定でき、ウェブサイトに実際に表示するにはアーティクルかページレイアウトに追加しなければなりません。コメント拡張はフロントエンドモジュールが1つあります:

<table>
<tr>
  <th>モジュール</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>コメント</td>
  <td>mod_comments</td>
  <td>コメントやゲストブックの項目を管理します。</td>
</tr>
</table>


### コンテンツ要素

ウェブサイトにコメントを表示するにはコンテンツ要素を使用します。コメントはバックエンドで"コメント"のコンテンツ要素を構成して、ウェブサイトで実際に表示するにはアーティクルに追加しなければなりません。コメント拡張にはコンテンツ要素が1つあります:

<table>
<tr>
  <th>コンテンツ要素</th>
  <th>CSSのclass</th>
  <th>説明</th>
</tr>
<tr>
  <td>コメント</td>
  <td>ce_comments</td>
  <td>コメントのフォームをページに追加します。</td>
</tr>
</table>


### BBCode

フロントエンドユーザーが[BBCodeマークアップ言語][7]を使えるようにできます。

Contaoは以下のタグをサポートしています:

<table>
<tr>
  <th>BBCode</th>
  <th>定義</th>
</tr>
<tr>
  <td>[b][/b]</td>
  <td>タグを太字体のテキストに置き換えます。</td>
</tr>
<tr>
  <td>[i][/i]</td>
  <td>タグを斜体のテキストに置き換えます。</td>
</tr>
<tr>
  <td>[u][/u]</td>
  <td>タグを下線のあるテキストに置き換えます。</td>
</tr>
<tr>
  <td>[img][/img]</td>
  <td>タグを画像と(タグの間をURLに加えて)置き換えます。</td>
</tr>
<tr>
  <td>[code][/code]</td>
  <td>タグを等幅のテキストで置き換えます。</td>
</tr>
<tr>
  <td>[color=#ff0000][/color]</td>
  <td>タグを色の付いたテキストで置き換えます。</td>
</tr>
<tr>
  <td>[quote][/quote]</td>
  <td>タグを引用したテキストで置き換えます。</td>
</tr>
<tr>
  <td>[quote=John]Hello[/quote]</td>
  <td>タグを引用したテキストと作成者の名前で置き換えます。(例: John wrote: Hello)</td>
</tr>
<tr>
  <td>[url][/url]</td>
  <td>タグをリンクで置き換えます。</td>
</tr>
<tr>
  <td>[url=http://][/url]</td>
  <td>タグを(URLをパラメーターとして)リンクで置き換えます。</td>
</tr>
<tr>
  <td>[email][/email]</td>
  <td>タグをmailtoのリンクで置き換えます。</td>
</tr>
<tr>
  <td>[email=name@example.com][/email]</td>
  <td>タグを(電子メールアドレスをパラメーターとして)mailtoのリンクで置き換えます。</td>
</tr>
</table>


## 挿入タグ

挿入タグはページが画面を表示するときに、動的なコンテンツと置き換わるワイルドカードです。例えば、現在の日付を表示し、フロントエンドのユーザーの名前に宛て、ファイルを取り込むといったことができます。挿入タグはContaoのほとんどどこでも、キャッシュされたページでさえも使用できます。


### リンク要素

以下の挿入タグを使用すると、IDやエイリアスで指定した他のページやアーティクルのリンクできます。

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


### ユーザーの属性

以下の挿入タグを使用すると、現在ログインしているユーザーの任意の属性を表示できます。

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


### ページの属性

次の挿入タグを使用すると、現在のページの任意の属性を表示できます。

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
  <td>このタグはウェブサイトの題名に置き換わります。</td>
</tr>
</table>


### 環境変数

以下の挿入タグを使用すると、ページ名やリクエスト文字列のような環境変数を表示できます。

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


### 要素の取り込み

以下の挿入タグを使用すると、アーティクル、モジュール、"templates"ディレクトリからのファイルのような様々なリソースを取り込めます。

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
  <td>このタグは参照しているコンテンツ要素に置き換わります。(*をコンテンツ要素のIDかエイリアスに置き換えてください。)</td>
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
  <td>このタグは"templates"のディレクトリにあるファイルの内容に置き換わります。(*をファイル名に置き換えてください。)<br>引数を指定することもできます。例: <code>{{file::file.php?arg1=val&amp;arg2=val}}</code></td>
</tr>
</table>


### 様々な挿入タグ

以下の挿入タグを使用すると、現在の日付やlightbox画像を含めるといった様々な処理を実行できます。

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
  <td>このタグはページの言語がタグの言語と一致していないと完全に削除されます。言語に特定なラベルを設定するのに使用できます: <code>{{iflng::en}}Your name{{iflng}}{{iflng::de}}Ihr Name{{iflng}}</code>。</td>
</tr>
<tr>
  <td><code>{{ifnlng::*}}</code></td>
  <td>このタグはページの言語がタグの言語と一致していると完全に削除されます。言語に特定なラベルを設定するのに使用できます:
  <code>{{ifnlng::de}}Your name{{ifnlng}}{{iflng::de}}Ihr Name{{iflng}}</code>。</td>
</tr>
<tr>
  <td><code>{{image::*}}</code></td>
  <td>このタグは画像のサムネイルに置き換わります:
  <code>{{image::files/image.jpg?width=200&amp;height=150}}</code>。<br>
  <strong>width</strong>: サムネイルの幅、<br>
  <strong>height</strong>: サムネイルの高さ、<br>
  <strong>alt</strong>: 代替テキスト、<br>
  <strong>class</strong>: CSSのclass、<br>
  <strong>rel</strong>: rel属性(例えば"lightbox")、<br>
  <strong>mode</strong>: モード("proportional"、"crop"、"box")。</td>
</tr>
<tr>
  <td><code>{{label::*}}</code></td>
  <td>このタグは翻訳したラベルに置き換わります: <code>{{label::CNT:au}}</code>や<code>{{label::tl_article:title:0}}</code>。 最初のコロンだけ二重のコロンとなっていることに注意してください。</td>
</tr>
<tr>
  <td><code>{{version}}</code></td>
  <td>このタグは現在のContaoのバージョン(例えば 2.11.2)に置き換わります。</td>
</tr>
<tr>
  <td><code>{{request_token}}</code></td>
  <td>このタグは現在のセッションのリクエストトークに置き換わります。</td>
</tr>
<tr>
  <td><code>{{toggle_view}}</code></td>
  <td>携帯端末とデスクトップのレイアウトを切り替えるリンクを追加します。</td>
</tr>
</table>


### 挿入タグのフラッグ

フラッグを使用すると、さらに挿入タグを処理できます。例えば、値を特定のPHPモジュールに渡せます。複数のフラッグを適用できます:

```
{{ua::browser|uncached}}
{{page::title|decodeEntities|strtoupper}}
```

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
    <td><a target="_blank" href="http://php.net/addslashes">PHPの関数</a></td>
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
    <td>こじれ角すべての改行の前にHTMLの改行を挿入します。</td>
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
<tr>
    <td><code>base64_encode</code></td>
    <td><a href="https://en.wikipedia.org/wiki/Base64" target="_blank">Base64アルゴリズム</a>を使用してテキストをエンコードします。</td>
    <td><a target="_blank" href="http://php.net/base64_encode">PHPの関数</a></td>
</tr>
<tr>
    <td><code>base64_decode</code></td>
    <td><a href="https://en.wikipedia.org/wiki/Base64" target="_blank">Base64アルゴリズム</a>を使用してテキストをデコードします。</td>
    <td><a target="_blank" href="http://php.net/base64_decode">PHPの関数</a></td>
</tr>
</table>


[1]: https://contao.org/en/extension-list.html
[2]: http://en.wikipedia.org/wiki/Opt_in_e-mail
[3]: 04-Managing-content.md#insert-tags
[7]: http://en.wikipedia.org/wiki/BBCode
