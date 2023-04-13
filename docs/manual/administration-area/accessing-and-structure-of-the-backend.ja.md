---
title: 'バックエンドへのアクセスと構造'
description: '管理領域、いわゆるバックエンドではウェブサイトの管理に関係するすべての作業を行えます。'
aliases:
  - /ja/administration-area/call-and-structure-of-the-backend/
  - /ja/administration-area/accessing-and-structure-of-the-backend/
weight: 10
---

## バックエンドへのアクセス

ウェブサイトのURLに`/contao`を追加して、Contaoのバックエンドにアクセスできます。完全なアドレスは次のようになります:

`https://www.example.com/contao/`

`ユーザー名`と`パスワード`を入力してください。ブラウザーの初期設定の言語も使用します。`続ける`のボタンをクリックして入力を確認してください。

![Contaoのバックエンドの記名](/ja/administration-area/images/en/contao-call-the-backend.png?classes=shadow)

バックエンドのログインは[総当り攻撃](https://ja.wikipedia.org/wiki/%E7%B7%8F%E5%BD%93%E3%81%9F%E3%82%8A%E6%94%BB%E6%92%83)から時間遅延の方法で保護しています。パスワードを連続して3回誤って入力すると、自動的にアカウントを5分間ロックします。これにより、正しいパスワードを見つけるまで連続して多数のパスワードをクラッカーが試すことを防止します。

## バックエンドの構造

バックエンドは3つの領域に別れています。最上部は情報の領域、左はナビゲーション、右が作業領域です。

![Contaoのバックエンドの配分](/ja/administration-area/images/en/contao-dashboard.png?classes=shadow)

### 情報の領域

情報の領域はContaoで作業するときに必要な、いくつかの重要なリンクを表示します。

**ホームページ:** Contaoのロゴをクリックするとバックエンドのホームページに移動します。

**マニュアル:** このリンクをクリックするとマニュアルを開きます。

**お気に入りに保存:** {{< version-tag "5.1" >}} このリンクをクリックすると、バックエンドのURLをお気に入りに保存できます。既存のお気に入りのリンクはナビゲーション領域に表示します。

**注意:** このリンクをクリックするとモーダルなウィンドウを開いて、できるだけのヒントを表示します。(例: 保守モード)

**デザイン:** {{< version-tag "5.1" >}} ライトモードとダークモードを選択できます。

**デバッグモード:** このリンクをクリックすると[デバッグモード](/ja/system/debug-mode/)のオンとオフを切り替えます。{{< version "4.8" >}}

**プレビュー:** This link opens the frontend, i.e. the actual website, in a new window. If you edit a specific page or article in the back end, you will be automatically forwarded to the corresponding page in the frontend.

**ユーザー:** ユーザーをクリックすると、以下のリンクを表示します:

  + **プロフィール:** This link leads to the personal settings of your user account. There you can change your password or change the language.

  + **セキュリティ:** Activate the two-factor authentication for your back end.{{< version "4.6" >}}

  + **お気に入り:** {{< version-tag "5.1" >}} This link will take you to your favorite management.

  + **ログアウト:** Log out of the back end here.

### ナビゲーションの領域

The navigation area contains links to the different back end modules, each of which fulfills a specific task. For a better overview, the modules are organized in groups that you can expand and collapse as needed.

**Contents:** This group contains all modules that manage any kind of content. In Contao, content includes not only articles, but also e.g. news items, events, comments or forms.

**Layout:** This group contains all design-relevant modules that you can use to define the look and structure of your website.

**User management:** This group contains all modules that are related to the management of users and user groups. In Contao, we distinguish between "users" (back end users) and "members" (frontend users).

**System:** This group contains different modules for the configuration and maintenance of your Contao installation and the file management.

### 作業領域

In the workspace, you do all your work within Contao. Depending on the module, different functions are available.

Immediately after logging in, the back end homepage will show you the date of your last login, an overview of the back end keyboard shortcuts and the versions of the last edited content.


### The preview area

You can access the front end preview via the "Preview" link in [the information area](#the-information-area).

The front end preview can be recognized on the one hand by the front end preview bar and on the other hand by `
preview.php` in the URL.

![Front end preview](/ja/administration-area/images/en/front-end-preview-bar.png?classes=shadow)

{{< version-tag "4.13" >}}  **Copy URL:** When you click on the link, the URL without `preview.php` is copied to the clipboard and can be pasted at 
the desired position.

{{< version-tag "4.13" >}} **Share URL:** When you click on the link, the back end will open in a new window and you can [activate the link](../../system/preview-links/).

**Member:** If you have set up a protected area on your website and you want to preview for a specific
member, you can enter the username.

**Unpublished:** Here you can choose whether to show or hide unpublished elements and pages.