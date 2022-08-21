---
title: '機能拡張の更新'
description: 'Contao Managerまたはコマンド行から機能拡張を更新'
aliases:
    - /ja/installation/update-extensions/
weight: 70
---

## Contao Managerで更新 {#updating-with-the-contao-manager}

始めにContao Managerにログインしなければなりません。それには再び使用されているドメインに`/contao-manager.phar.php`を追加して呼び出し、アクセスするためのデータを入力します。

機能拡張の"terminal42/contao-easy\_themes"を更新したい場合、「パッケージ」のタブに切り替えて、機能拡張にある「更新」のボタンをクリックします。もちろん、他の機能拡張の更新も指定できます。「変更を適用」をクリックすると更新を開始します。更新には数分を必要とします。![コンソール出力を表示/非表示](/ja/icons/konsolenausgabe.png?classes=icon)のアイコンをクリックすると、更新の処理の詳細を表示できます。

![Contao Managerで機能拡張を更新](/ja/installation/images/en/update-extensions-in-contao-manager.png?classes=shadow)

Contao Managerが機能拡張を更新しましたら、必要な場合は[Contaoインストールツール](../contao-installtool/)を実行してデータベースを更新しなければなりません。

## コマンド行で更新 {#update-via-the-command-line}

サーバーにユーザー名とドメインでログインします:

```bash
ssh username@example.com
```

インストールしているContaoのディレクトリに移動します。

```bash
cd www/example/
```

機能拡張を最新のバージョンにするため`composer.lock`を更新するには、`update`コマンドを実行します。いくつかのホスティング環境では、システム要件が高すぎるため、処理に失敗して更新できないかもしれません。この場合は[Contao Manager](#updating-with-the-contao-manager)を使用しなければなりません。

**1つの機能拡張を更新:**

```bash
php composer.phar update terminal42/contao-easy_themes
```

**複数の機能拡張を更新:**

```bash
php composer.phar update terminal42/notification_center terminal42/contao-leads
```

更新を利用可能な機能拡張のの現在と最新のバージョンを含めて一覧表示をするには、`outdated`コマンドも使用できます。

```bash
php composer.phar outdated
```

**問い合わせの結果:**

```bash
doctrine/dbal               v2.8.1 v2.9.2  Database Abstraction Layer
knplabs/knp-menu            2.6.0  v3.0.1  An object oriented menu library
monolog/monolog             1.25.1 2.0.0   Sends your logs to files, sockets, inboxes, databases …
php-http/client-common      1.9.1  2.0.0   Common HTTP Client implementations and tools for HTTPlug
php-http/guzzle6-adapter    v1.1.1 v2.0.1  Guzzle 6 HTTP Adapter
php-http/httplug            v1.1.0 v2.0.0  HTTPlug, the HTTP client abstraction for PHP
sensiolabs/security-checker v5.0.3 v6.0.2  A security checker for your composer.lock
```

機能拡張の更新が完了しましたら、必要な場合は[Contaoインストールツール](../contao-installtool/)を実行してデータベースを更新しなければなりません。
