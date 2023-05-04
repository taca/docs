---
title: 'Contaoの移設'
description: 'Moving a Contao installation is almost the same as a new installation.'
aliases:
    - /en/installation/move-contao/
weight: 50
---

インストールしたContaoをある場所から別の場所(例えばローカルのインストールから稼働中のサーバー)に移動するのは、ほとんど[インストール](../install-contao)と同じですが、既存のデータベースとアプリケーションに関連したファイルの転送も含みます。

1. [データベースの転送](#transferring-the-database)
2. [ファイルの転送](#transferring-the-files)
3. [Contaoのインストール](#installing-contao)

{{% notice warning %}}
不一致による危険性を減らすため、元のサーバーと目的のサーバーの両方が**[同じバージョンのPHP](../system-requirements/#minimum-php-requirements)**であることを確認してください。
{{% /notice %}}


## テータベースの転送 {#transferring-the-database}

### データベースのエクスポート (元)

GUIのツール[phpMyAdmin](https://www.phpmyadmin.net/)、またはコマンド行から`mysqldump`プログラムを使用してSQLのdumpを作成できます。

{{< tabs groupId="mysql-transfer" >}}
{{% tab name="phpMyAdmin" %}}
"phpMyAdmin"にログインして、エクスポートするデータベースを選択し、上部のメニューの"Export"タブを選択して、"Ok"をクリックしてください。

次の段階でインポートに使用できる`sql`ファイルを受け取るでしょう。

![データベースのエクスポート]({{% asset "images/manual/installation/ja/database-export.png" %}}?classes=shadow)
{{% /tab %}}
{{% tab name="コマンド行" %}}
`mysqldump`と`gzip`をインストールしていることを確認して、("my_user"と"my_db_name"をデータベースのユーザーと名前に置き換えて)以下のコマンドを実行してください:

```bash
mysqldump --host=localhost --user=my_user --password --hex-blob --opt my_db_name | gzip -c > my_dump.sql.gz
```

データベースのパスワードを聞かれたら入力してください。

次の段階でインポートに使用できる`my_dump.sql.gz`ファイルをカレントディレクトリに保存します。
{{% /tab %}}
{{< /tabs >}}


### データベースのインポート (目的)

{{< tabs groupId="mysql-transfer" >}}
{{% tab name="phpMyAdmin" %}}
"phpMyAdmin"を開いて新しい(空の)データベースを選択します。

上部のメニューの"Import"ボタンをクリックし、前に作成したSQLのdumpファイルをアップロードしてインポートを開始してください。

![データベースをインポート]({{% asset "images/manual/installation/ja/database-import.png" %}}?classes=shadow)
{{% /tab %}}
{{% tab name="コマンド行" %}}
前に作成しdumpファイルを目的のサーバーにコピーして、ログインします。

`mysqldump`と`gzip`をインストールしていることを確認して、("my_user"と"my_db_name"をデータベースのユーザーと名前に、また"my_dump.sql.gz"をコピーしたdumpファイルの名前に適切に置き換えて)以下のコマンドを実行してください:

```bash
gunzip < my_dump.sql.gz | mysql --host=localhost --user=my_user --password my_db_name
```

データベースのパスワードを聞かれたら入力してください。
{{% /tab %}}
{{< /tabs >}}


## ファイルの転送 {#transferring-the-files}

以下のファイルとフォルダーを元のサーバーから目的のサーバーに転送しなければなりません。

- `files`                           (ファイル)
- `templates`                       (テンプレート)
- `composer.json`                   (希望する依存関係)
- `composer.lock`                   (実際にインストールした依存関係)
- `system/config/localconfig.php`   (環境設定)

以下のファイルとフォルダーが該当する場合は元のサーバーから目的のサーバーに転送しなければなれいません。

- `config`  (または **Contao 4.8** より前では`app/config/`)         
- `contao`  (または **Contao 4.8** より前では`app/Resources/contao/`
- `src`
- `.env*`

未だに`system/modules/`に古い機能拡張があるか、古いシステム構成が`system/config/`にある場合は、これらも併せて転送しなければなりません。

この作業にはFTPクライアントを使用できますが、コマンド行が良い場合は`scp`を使用してください:

```bash
cd /path/to/project

scp -r files/ templates/ composer.json composer.lock your_server:/www/project/
```

## Contaoのインストール {#installing-contao}

1. [ホスティングの構成](../install-contao/#hosting-configuration)を正しく設定していることを確認してください。
2. その次に*Composer*に仕事をしてもらいます。元のサーバーからすべてのパッケージのバージョンを含んだ`composer.lock`ファイルを転送していますので、Composerは以前と同様の状態を再現します。
   
   これを行うには通常のインストールの様に[Contao Manager](../install-contao#installation-via-the-contao-manager)を使用するか、[コマンド行](../install-contao#installation-via-the-command-line)を使用してください。
   
3. [インストールツール](../contao-installtool)を使用して新しいデータベース接続を構成してください。

以上!  これで新しい場所でContaoインストールツールを使用する準備ができました。
