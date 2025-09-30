---
title: 'Contaoのインストール'
description: 'Contaoをサーバーにインストールする2つの方法があります、1つはContao Managerのグラフィカル・ユーザー・インターフェイスを使用、もう1つはコマンド行を使用する方法です。'
aliases:
    - /ja/installation/install-contao/
weight: 30
---

すべてのシステム要件を確認し、Webサーバーの設定ができると、インストールを開始できます。

Contaoをサーバーにインストールする2つの方法があります、[Contao Manager](#installation-with-the-contao-manager)のグラフィカル・ユーザー・インターフェイスを使用する方法とコマンド行を使用する方法です。

## Contao Managerでインストール

### Contao Managerをインストール

Contaoをサーバーにインストールする前に、[Contao Managerのインストールと構成](../../installation/contao-manager/#install-contao-manager)を行う必要があります。

### Contao ManagerでContaoをインストール

基本的な構成を完了した後で、Contaoをインストールできます。希望するバージョンと初期構成を選択して、「インストール」のボタンをクリックしてください。

![Contao ManagerでContaoをインストール]({{% asset "images/manual/installation/ja/contao-manager-setup.png" %}}?classes=shadow)

インストールには数分を必要とします。インストールの処理の詳細は次のアイコン![コンソールの表示を表示/非表示]({{% asset "icons/konsolenausgabe.png" %}}?classes=icon)をクリックして表示できます。

![Contaoをインストールしました]({{% asset "images/manual/installation/ja/contao-manager-background-task.png" %}}?classes=shadow)


### データベースのテーブルの更新

すべてのパッケージをContao Managerがインストールできたら、次にデータベースを更新しなければなりません。これは[Contao Manager]({{% relref "installation/contao-manager" %}})で直接に、またはコマンド行から更新できます。

## コマンド行でインストール

コマンド行から`create-project`を用いてインストールするとき、`composer update`というコマンドをインストール中に実行します。ホスティングサービスによっては、高いシステム負荷のためにプロセスを完了できずに、インストールの失敗を引き起こすことがあります。この場合は[Contao Manager](#installing-contao-with-the-contao-manager)を使用しなければなりません。

ユーザー名とドメインでサーバーにログインします。

```bash
ssh user@example.com
```

ウェブホスティングの公開ディレクトリに移動します。

```bash
cd www
```

### Composerのインストール {#install-composer}

[Composer](https://en.wikipedia.org/wiki/Composer_(software))は、PHPプログラミング言語と依存関係のインストールのためのアプリケーション指向のパッケージマネージャーです。

{{% notice info %}}
Composerは[ローカル](https://getcomposer.org/doc/00-intro.md#locally)にも、[全体的](https://getcomposer.org/doc/00-intro.md#globally)にもインストールできます。
 
Composerをローカルにインストールする場合、作業ディレクトリ(つまり、プロジェクトのファイル`composer.json`と`composer.lock`をおいている場所)に`composer.phar`のファイルを置くことになります。Composerを`php composer.phar`として呼び出すことになります。

Composerを全体的にインストールした場合は、どのディレクトリでも`composer`コマンドを使用できます。
{{% /notice %}}

### コマンド行からContaoのインストール作業

第2段階では、Composerを使用してContaoをインストールします。"example"は望ましいインストール先のディレクトリで、{{% siteparam "currentContaoVersion" %}}は[インストールしたいContaoのバージョン](https://to.contao.org/release-plan)です。

```bash
php composer.phar create-project contao/managed-edition example {{% siteparam "currentContaoVersion" %}}
```

### ホスティングの構成 {#hosting-configuration}

Contaoでは、すべての公開してアクセス可能なファイルはインストールしたディレクトリのサブフォルダーの`/web`に配置します。このフォルダーを作成して、ドキュメントルートをこのサブフォルダーにホスティングプロバイダーの管理パネルを使用して設定してください。そして、この機会にデータベースを作成してください。

例: `example.com`にディレクトリ`/www/example/web`を指すよう設定

({{< version-tag "4.12" >}} Symfonyの標準に従い、公開サブフォルダーの`/web`は`/public`に名前を変更しました。`/web`ディレクトリがインストール先に存在する場合、Contaoは自動的に`/public`の代わりに使用します。).

{{% notice info %}}
このため、それぞれのContaoのインストールでは固有の(サブ)ドメインが必要です。
{{% /notice %}}


### データベースのテーブルの更新
インストールの後で、データベースを[Contao Manager]({{% relref "installation/contao-manager" %}})から更新するか、次のようにコマンド行から更新します:

```bash
php vendor/bin/contao-console contao:migrate
``` 

{{% notice tip %}}
事前にデータベースをコマンド行から作成することもできます:<br>
`php vendor/bin/contao-console doctrine:database:create`
{{% /notice %}}

{{% notice note %}}
Contaoはデータベースに対応するデータ接続先を知っている必要があります。
この情報は(現在は[Contaoインストールツール](/ja/installation/contao-installtool/)を使用するとインストールされる)"config/parameters.yaml"ファイル、またはインストール先のルートディレクトリにある"[.env](https://docs.contao.org/dev/getting-started/starting-development/#application-configuration)"ファイルを経由して取り出します。<br><br>
".env"ファイルで必要な環境変数([DATABASE_URL](https://docs.contao.org/dev/reference/config/#database-url)と[APP_SECRET](https://docs.contao.org/dev/reference/config/#app-secret))については[こちら](https://docs.contao.org/dev/getting-started/starting-development/#application-configuration)を参照してください。
{{% /notice %}}


### Contaoのバックエンドのユーザーの作成

[Contao Manager]({{% relref "installation/contao-manager" %}})を使用して、バックエンドのユーザーを作成できます。

Contao **4.10**からは[コマンド行]({{% relref "/cli" %}})で以下の[コマンド]({{% relref "/cli/user" %}})も使用できます:

```bash
php vendor/bin/contao-console contao:user:create
``` 
