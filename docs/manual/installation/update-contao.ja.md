---
title: 'Contaoの更新'
description: '多くのオープンソースのプロジェクトのように、Contaoは途切れない開発を進めています。'
aliases:
    - /ja/installation/update-contao/
weight: 40
---


多くのオープンソースのプロジェクトのように、Contaoは途切れない開発を進めています。それぞれの更新で、構成要素を更新し、バグを修正し、新しい機能が追加されたり、性能を改善したり、します。このため、常に最新のバージョンを使用することを推奨します。


## Contaoの更新の周期

Contaoは[セマンティック バージョニング](https://semver.org)の概念によるバージョン番号を使用しています。これは少し技術的なものなので、簡単に使用する用語に慣れておきましょう:


### メジャーリリース

メジャーリリースは多くの基本的な事項が変更された完全に新しいバージョンで、もう既存のページは動作しないかもしれません。この行を書いている時点で、現在のContaoのメジャーリリースは**バージョン4**です。


### マイナーリリース

マイナーリリースは開発過程で新しい機能を追加した節目のようなものです。このため既存のページに小さな変更が必要かもしれません。この行を書いている時点で、現在のContaoのマイナーバージョンは**バージョン4.10**です。


### バグ修正リリース

バグ修正リリースは主な目的がバグ修正である保守リリースです。この行を書いている時点で、現在のバグ修正バージョンは**バージョン4.10.4**です。


### 長期サポートバージョン

Contaoの[リリース周期](https://contao.org/en/release-plan.html)には[長期サポート](https://de.wikipedia.org/wiki/Support_(Dienstleistung)#Long_Term_Support)も含んでいます。このContaoのバージョンはバグ修正に3年とセキュリティ修正にさらに1年の長期間のサポートを、その間に新しいContaoのバージョンのリリースがあっても提供します。Contaoのすべてのバージョンの概要は[Wikipedia](https://de.wikipedia.org/wiki/Contao#Versionen)にあります。


## Contao Managerを使用した更新 {#updating-with-the-contao-manager}

{{% notice note %}}
Contaoを更新する前に、`composer.json`と`composer.lock`のファイルとデータベースをバックアップすることを推奨します。
{{% /notice %}}

Contao Managerにログインして開始します。

[バグ修正リリース](#bugfix-release)を更新する場合は、「パッケージを更新」をクリックするだけです。

[マイナーリリース](#minor-release)を更新するときは特殊な機能: "Contao Open Source CMS"にある歯車のアイコンをクリックして、所望のバージョンを入力してください。「パッケージを更新」のボタンをクリックして、「変更を適用」をクリックして開始します。

![マイナーリリースの更新を開始]({{% asset "images/manual/installation/ja/manager-update-contao.png" %}}?classes=shadow)

更新はそれから数分を必要とします。更新の処理の詳細は次のアイコン![コンソール出力の表示/非表示]({{% asset "icons/konsolenausgabe.png" %}}?classes=icon)をクリックすると表示できます。

![マイナーリリースの更新の完了]({{% asset "images/ja/update-for-minor-release-completed.png" %}}?classes=shadow)


### データベースのテーブルの更新

更新の後で[Contaoインストールツール](../contao-installtool/)を開いてデータベースに変更がないかどうか確認してください。必要な場合は、推奨している変更を行ってインストールツールを閉じてください。

これでインストールしているContaoは最新の状態です。

## コマンド行からの更新 {#update-via-the-command-line}

{{% notice note %}}
Contaoをコマンド行から更新するには、Composerを[インストールしている](../install-contao/#install-composer)ことが必要です。
{{% /notice %}}

{{% notice note %}}
Contaoを更新する前に、`composer.json`と`composer.lock`のファイルとデータベースをバックアップすることを推奨します。
{{% /notice %}}

コマンド行から更新するときに`composer update`を実行します。
過剰なシステムの負荷により、ホスティングサービスによってはコマンドの完了ができず、このためインストールに失敗します。この場合は[Contao Manager](#updating-with-the-contao-manager)を使用しなければなりません。

サーバーにユーザー名とドメインを指定してログインします。

```bash
$ ssh benutzername@example.com
```

コンソールで、更新身体Contaoのインストール先のディレクトリに移動します。


```bash
$ cd www/example/
```

[バグ修正リリース](#bugfix-release)を更新するときは、次のコマンドを実行するだけで十分です。

```bash
$ composer update
```

[マイナーリリース](#minor-release)を更新する場合は、希望する`contao/manager-bundle`のバージョンを`composer.json`ファイルで指定する必要があります。

```json
{
    …
    "require": {
        "contao/manager-bundle": "4.10.*",
        …
    },
    …
}
```

それからコマンド行で更新を行います。

```bash
$ composer update
```

### データベースのテーブルの更新

更新の後で[Contaoインストールツール](../contao-installtool/)を開いてデータベースに変更がないかどうか確認してください。必要な場合は、推奨している変更を行ってインストールツールを閉じてください。

Contaoインストールツールを使用する代わりに、(Contao 4.9以降では)コマンドを使用できます。

```bash
$ vendor/bin/contao-console contao:migrate
```

これでインストールしているContaoは最新の状態です。


## Composerリゾルバークラウドなしでローカルに更新

上記の[コマンド行からの更新](#update-via-the-command-line)と[Contao Managerを使用した更新](#updating-with-the-contao-manager)は、ローカルに使用することも可能です。ホスティングサービスの環境と異なり、必要に応じて自身で構成を行えるので、メモリが十分でないといったシステム環境の不足するといったことがないという利点がこれにはあります。

### コマンド行を使用するためのシステム要件

コンピューターに何がひつようですか?

- 作業を行う任意のディレクトリ(作業ディレクトリ)
- PHP、理想的にはホスティングに使用するのと同じバージョン
- Composer (全体的に[インストール](../install-contao/#install-composer)していると仮定しています。)
- ホスティング先にインストールしたContaoのファイル`composer.json`と`composer.lock`のコピー

_必要でない_ ものは何ですか?

- MySQL
- ローカルにインストールしたContao


### アップデートの実行

ホスティング先にインストールしたContaoのファイル`composer.json`と`composer.lock`を作業ディレクトリにコピーします。それから[コマンド行からの更新](#update-via-the-command-line)に説明していることと本質的に同じです:

ターミナルを開いて作業ディレクトリに移動します。そして次を実行します。

```bash
$ composer update
```

composer updateの実行が正しく完了した後で、更新された`composer.lock`のファイル(変更を加えたなら`composer.json`のファイル)をホスティング先にインストールしたContaoにコピーして戻します。

その後、サーバー(ホスティング先)に`ssh`でログインします。

```bash
$ ssh username@example.com
```

Composerでパッケージの更新をインストールします。

```bash
$ composer install
```

または、Contao Managerを使用します。この場合は「保守」、「Composerの依存関係」、「インストーラーを実行」と選択してください。

![Contao Managerでcomposer installを実行]({{% asset "images/ja/composer-install-using-the-contao-manager.png" %}}?classes=shadow)

最後にデータベースのテーブルを更新しなければなりません。


### データベースのテーブルの更新

[Contaoインストールツール](/ja/installation/contao-installtool/)を開いてデータベースの変更が必要かどうか確認してください。必要な場合は、推奨された変更を行ってインストールツールを閉じてください。

Contaoインストールツールの代わりに、(Contao 4.9以降では)コマンド行を使用できます。この場合は次のコマンドを実行してください:

```bash
$ vendor/bin/contao-console contao:migrate
``` 

これでインストールしているContaoは最新の状態となります。


### 異なるバージョンのPHP

ローカルで使用しているPHPのバージョンが、ホスティングで使用しているバージョンと異なる場合は、`composer.json`ファイルで使用するPHPのバージョンを指定しなければなりません:

```json 
    ...
    "config": {
        "platform": {
            "php": "7.4.99"
        }
    },
    "require": {
        ...
    }
    ...
```


### Contao Managerでローカルな更新

ローカルなContaoのインストールを使用される場合はContao Managerをインストールして、[Contao Managerを使用した更新](#updating-with-the-contao-manager)の節に記述している方法の更新を実行します。

ただし、その前にComposerリゾルバークラウドを使用しないことを確認してください!  使用している自身のサーバーで十分なメモリを利用できますから、リゾルバークラウドの負荷を減らしてください。

これは「サーバー設定」の節の「システム検査」に設定があります。

![Composerリゾルバークラウドの無効化]({{% asset "images/ja/disable_cloud_resolver.png" %}}?classes=shadow)

更新を成功した後で、`composer.json`と`composer.lock`のファイルをホスティングのContaoのインストールに戻します。そして、上記に記述したのと同じ段階を行います。
