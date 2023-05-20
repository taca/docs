---
title: '機能拡張のインストール'
description: '必要な機能に適切な機能拡張を見つけるには、3つの方法があります。'
aliases:
    - /ja/installation/install-extensions/
weight: 60
---

## 機能拡張の検索

必要な機能に適切な機能拡張を見つけるには、3つの方法があります。

### ウェブサイト

機能拡張をウェブサイトの[extensions.contao.org](https://extensions.contao.org/)で検索できます。

![extensions.contao.orgで機能拡張を検索]({{% asset "images/ja/extensions-contao-org.png"?classes=shadow)

### Contao Manager

インストールしているContao Managerで直接機能拡張を検索できます。

![Contao Managerでの高度な検索]({{% asset "images/manual/installation/ja/search-extensions-in-the-contao-manager.png" %}}?classes=shadow)

### コマンド行

コマンド行で機能拡張を検索できます。

**例えば、"codefog"というベンダーの機能拡張を検索:**

```bash
php composer.phar search codefog
```

**検索の結果:**

```bash
codefog/contao-haste haste extension for Contao Open Source CMS
codefog/contao-cookiebar cookiebar extension for Contao Open Source CMS
codefog/contao-news_categories News Categories bundle for Contao Open Source CMS
codefog/tags-bundle Tags bundle for Contao Open Source CMS
codefog/contao-social_images social_images extension for Contao Open Source CMS
codefog/contao-mobile_menu mobile_menu extension for Contao Open Source CMS
codefog/contao-bootstrap Bootstrap extension for Contao Open Source CMS
codefog/contao-widget_tree_picker widget_tree_picker extension for Contao Open Source CMS
codefog/contao-polls polls extension for Contao Open Source CMS
codefog/contao-member_export Member Export bundle for Contao Open Source CMS
codefog/contao-link-registry Link Registry bundle for Contao Open Source CMS
codefog/contao-instagram Instagram for Contao Open Source CMS
codefog/contao-events_subscriptions events_subscriptions extension for Contao Open Source CMS
codefog/contao-template_override template_override extension for Contao Open Source CMS
codefog/contao-elements-filter elements-filter extension for Contao Open Source CMS
```

機能拡張を見つけ出したらなら、[Contao Manager](#installation-via-the-contao-manager)または[コマンド行](#installation-via-the-command-line)でインストールできます。

## 機能拡張のインストール

### Contao Managerでインストール {#installation-via-the-contao-manager}

1. Contao Manager(`my-domain.com/contao-manager.phar.php`)を開いてログイン情報を入力します。
2. インストールしたい機能拡張を検索して、「追加」をクリックします。
3. さらに機能拡張を追加したい場合は2.を繰り返します。
4. 「パッケージ」のタブを選択して「変更を適用」をクリックしてインストールの処理を開始します。
5. 処理が終わりましたら、[Contaoインストールツール](../contao-installtool/)を実行してデータベースを更新します。

{{% notice info %}}
インストールの処理は数分を必用とするでしょう。![コンソール出力を表示/非表示]({{% asset "icons/konsolenausgabe.png" %}}?classes=icon)のアイコンをクリックすると、動作中の処理の詳細を表示できます。
{{% /notice %}}

#### 例

機能拡張の`terminal42/contao-easy_themes`をインストールしたい場合、検索欄に"EasyThemes"と入力して、「追加」をクリックし、...

![Contao Managerで機能拡張を検索]({{% asset "images/manual/installation/ja/search-package-in-contao-manager.png" %}}?classes=shadow)

そして「パッケージ」のタブに移り、変更を適用します。

![Contao Managerで機能拡張をインストール]({{% asset "images/manual/installation/ja/install-package-in-contao-manager.png" %}}?classes=shadow)

処理が終わりましたら、[Contaoインストールツール](../contao-installtool/)を実行してデータベースを更新します。これで機能拡張を使用する準備ができました。

![Contao Managerでインストールした機能拡張]({{% asset "images/manual/installation/ja/package-installed-in-the-contao-manager.png" %}}?classes=shadow)

### コマンド行でインストール {#installation-via-the-command-line}

1. `ssh`でサーバーにログインします。
2. プロジェクトのルートディレクトリに移動します。
3. 1つの機能拡張をインストールするには`php composer.phar require <extension>`と、複数の機能拡張をインストールするには`php composer.phar require <extension1> <extension2> …`と実行します。
4. 処理が終わりましたら、`contao:migrate`を実行するか[Contaoインストールツール](../contao-installtool/)を使用してデータベースを更新します。

#### 例
ログインしてプロジェクトのルートに移動します。

```bash
ssh user@example.com
```

```bash
cd www/my-project/
```

`terminal42/contao-easy_themes`をインストールしましょう。

```bash
php composer.phar require terminal42/contao-easy_themes
php vendor/bin/contao-console contao:migrate
```

{{% notice note %}}
`contao:migrate`コマンドはバージョン**4.9**以上で利用できます。その代わりに[Contaoインストールツール](../contao-installtool/)を使用できます。
{{% /notice %}}
