---
title: '機能拡張のアンインストール'
description: 'Contao Managerまたはコマンド行から機能拡張をアンインストール'
aliases:
    - /ja/installation/uninstalling-extensions/
weight: 80
---

## Contao Managerでアンインストール

始めにContao Managerにログインしなければなりません。それには再び使用されているドメインに`/contao-manager.phar.php`を追加して呼び出し、アクセスするためのデータを入力します。

機能拡張の"terminal42/contao-easy\_themes"をアンインストールしたい場合、「パッケージ」のタブに切り替えて、機能拡張にある「更新」のボタンを「削除」に切り替えます。もちろん、他の機能拡張の削除も指定できます。

![Contao Managerで機能拡張の削除を設定](/ja/installation/images/ja/mark-extensions-in-contao-manager-for-uninstallation.png?classes=shadow)

「変更を適用」をクリックするとアンインストールを開始します。アンインストールには数分を必要とします。![コンソール出力を表示/非表示](/ja/icons/konsolenausgabe.png?classes=icon)のアイコンをクリックすると、アンインストールの処理の詳細を表示できます。

![Contao Managerで機能拡張のアンインストール](/ja/installation/images/ja/uninstalling-extensions-in-contao-manager.png?classes=shadow)

Contao Managerが機能拡張をアンインストールしましたら、必要な場合は[Contaoインストールツール](../contao-installtool/)を実行してデータベースを更新しなければなりません。

## コマンド行でアンインストール {#uninstalling-using-the-command-line}

サーバーにユーザー名とドメインでログインします:

```bash
ssh username@example.com
```

インストールしているContaoのディレクトリに移動します。

```bash
cd www/example/
```

`remove`コマンドが機能拡張を`composer.json`からの削除と、プロジェクトからコードの削除を行います。

機能拡張を削除するため`composer.lock`を更新するには、`remove`コマンドを実行します。いくつかのホスティング環境では、システム要件が高すぎるため、処理に失敗して更新できないかもしれません。この場合は[Contao Manager](#uninstalling-with-the-contao-manager)を使用しなければなりません。

**1つの機能拡張を削除:**

```bash
php composer.phar remove terminal42/contao-easy_themes
```

**複数の機能拡張を削除:**

```bash
php composer.phar remove terminal42/notification_center terminal42/contao-leads
```

機能拡張の削除が完了しましたら、必要な場合は[Contaoインストールツール](../contao-installtool/)を実行してデータベースを更新しなければなりません。
