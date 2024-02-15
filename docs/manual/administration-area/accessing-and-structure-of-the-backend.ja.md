---
title: 'Contaoのバックエンド'
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

![Contaoのバックエンドの登録]({{% asset "images/manual/administration-area/ja/contao-call-the-backend.png" %}}?classes=shadow)

バックエンドのログインは[総当り攻撃](https://ja.wikipedia.org/wiki/%E7%B7%8F%E5%BD%93%E3%81%9F%E3%82%8A%E6%94%BB%E6%92%83)から時間遅延の方法で保護しています。パスワードを連続して3回誤って入力すると、自動的にアカウントを5分間ロックします。これにより、正しいパスワードを見つけるまで連続して多数のパスワードをクラッカーが試すことを防止します。


## バックエンドの構造

バックエンドは3つの領域に別れています。最上部は情報領域、左はナビゲーション、右が作業領域です。

![バックエンドの構造]({{% asset "images/manual/administration-area/ja/structure-of-the-back-end.png" %}}?classes=shadow)


### 情報領域

情報領域はContaoで作業するときに必要な、いくつかの重要なリンクを表示します。

![情報領域]({{% asset "images/manual/administration-area/ja/notes.png" %}}?classes=shadow)

![ホームページ]({{% asset "icons/logo.svg" %}}?classes=icon,backend) **ホームページ:** Contaoのロゴをクリックするとバックエンドのホームページに戻ります。

![マニュアル]({{% asset "icons/manual.svg" %}}?classes=icon,backend) **マニュアル:** このリンクをクリックするとマニュアルを開きます。

![お気に入りに保存]({{% asset "icons/favorite.svg" %}}?classes=icon,backend)  **お気に入りに保存:** このリンクをクリックすると、現在のバックエンドのURLをお気に入りに保存できます。既存のお気に入りのリンクはナビゲーション領域に表示します。
{{< version-tag "5.1" >}}

![お気に入り]({{% asset "images/manual/administration-area/ja/favorites.png" %}}?classes=shadow)

![注意]({{% asset "icons/alert.svg" %}}?classes=icon,backend) **注意:** このリンクをクリックするとモーダルなウィンドウを開いて、できるだけのヒントを表示します。(例: 保守モード)

![デザイン]({{% asset "icons/color_scheme.svg" %}}?classes=icon,backend) **デザイン:** ライトモードとダークモードを選択できます。{{< version-tag "5.1" >}}

![ダークモード]({{% asset "images/manual/administration-area/ja/dark-mode.png" %}}?classes=shadow)

**デバッグモード:** このリンクをクリックすると[デバッグモード](/ja/system/debug-mode/)のオンとオフを切り替えます。

**プレビュー:** このリンクはフロントエンド、言い換えれば実際のウェブサイトを新しいウィンドウに開きます。バックエンドで特定のページやアーティクルを編集している場合は、自動的にフロントエンドの対応するページを表示します。

**ユーザー:** ユーザーをクリックすると、以下のリンクを表示します:

  + ![Profile]({{% asset "icons/profile_small.svg" %}}?classes=icon,backend) **プロフィール:** This link leads to the personal settings of your user account. There you can change your password or change the language.

  + ![Security]({{% asset "icons/shield_small.svg" %}}?classes=icon,backend) **セキュリティ:** Activate the two-factor authentication for your back end.

  + ![Favorites]({{% asset "icons/favorite.svg" %}}?classes=icon,backend) **お気に入り:** This link will take you to your favorite management. {{< version-tag "5.1" >}}

  + ![Log out]({{% asset "icons/exit.svg" %}}?classes=icon,backend) **ログアウト:** ここでバックエンドからログアウトします。


### ナビゲーションの領域

The navigation area contains links to the different back end modules, each of which fulfills a specific task. For a 
better overview, the modules are organized in groups that you can expand and collapse as needed.

![The navigation area]({{% asset "images/manual/administration-area/ja/the-navigation-area.png" %}}?classes=shadow)

**Contents:** This group contains all modules that manage any kind of content. In Contao, content includes not only 
articles, but also e.g. news items, events, comments or forms.

**Layout:** This group contains all design-relevant modules that you can use to define the look and structure of your 
website.

**User management:** This group contains all modules that are related to the management of users and user groups. In 
Contao, we distinguish between "users" (back end users) and "members" (frontend users).

**System:** This group contains different modules for the configuration and maintenance of your Contao installation and 
the file management.


### 作業領域

In the workspace, you do all your work within Contao. Depending on the module, different functions are available.

![The workspace]({{% asset "images/manual/administration-area/ja/the-workspace.png" %}}?classes=shadow)

Immediately after logging in, the back end homepage will show you the date of your last login, an overview of the back 
end keyboard shortcuts and the versions of the last edited content.


### The preview area

You can access the front end preview via the "Preview" link in [the information area](#the-information-area).

The front end preview can be recognized on the one hand by the front end preview bar and on the other hand by `
preview.php` in the URL.

![Front end preview]({{% asset "images/manual/administration-area/ja/front-end-preview-bar.png" %}}?classes=shadow)

**Copy URL:** When you click on the link, the URL without `preview.php` is copied to the clipboard and can be pasted at 
the desired position.

**Share URL:** When you click on the link, the back end will open in a new window and you can [activate the link](../../system/preview-links/).

**Member:** If you have set up a protected area on your website and you want to preview for a specific
member, you can enter the username.

**Unpublished:** Here you can choose whether to show or hide unpublished elements and pages.