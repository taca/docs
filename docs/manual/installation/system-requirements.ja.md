---
title: "システム要件"
aliases:
    - /ja/installation/system-requirements/
weight: 10
---

Contaoをうまく動作させるには、ウェブサーバーはこれらのシステム要件を満たしていなければなりません。Contaoは元々はおなじみの[LAMP](https://en.wikipedia.org/wiki/LAMP_(software_bundle))スタックに向けて開発していましたが、最近のPHPとMySQLを提供しているウェブサーバーであれば動作します。


## ソフトウェアの推奨

最小限の要件はインストールしようとしているのが最新のバージョンか_長期サポート版_のバージョンであるかに依存します。Contaoのすべての保守されているバージョンはPHPとMySQLの最新のバージョンと互換性があります。このため、常に以下の使用を推奨します。

- **PHP:** バージョン7.4+ (最新のパッチバージョン)
- **MySQL:** バージョン8.0+ または同等の**MariaDB**サーバー


### PHPの拡張

| 拡張名 | Contao 4.4 | Contao 4.9 |
|:------------------------------------------|:-------------------------|:--------------------------------------------|
| [DOM][ext-dom] (`ext-dom`)                | **必須**                 | **必須**                                |
| [PCRE][ext-pcre] (`ext-pcre`)             | **必須**                 | **必須**                                |
| [Intl][ext-intl] (`ext-intl`)             | 推奨                     | **必須**                                |
| [PDO][ext-pdo] (`ext-pdo`)                | **必須**                 | **必須**                                |
| [ZLIB][ext-zlib] (`ext-zlib`)             | **必須**                 | **必須**                                |
| [JSON][ext-json] (`ext-json`)             | **必須**                 | **必須**                                |
| [Curl][ext-curl] (`ext-curl`)             | **必須**                 | **必須**                                |
| [Mbstring][ext-mbstring] (`ext-mbstring`) | **必須**                 | **必須**                                |
| [GD][ext-gd] (`ext-gd`)                   | **必須**<sup>1</sup>     | **必須**<sup>1</sup>                    |
| [Imagick][ext-imagick] (`ext-imagick`)    | 推奨<sup>1</sup>         | GDが必要、ImagickまたはGmagick<sup>1</sup> |
| [Gmagick][ext-gmagick] (`ext-gmagick`)    | 推奨<sup>1</sup>         | GDが必要、ImagickまたはGmagick<sup>1</sup> |

{{% notice note %}}
<sup>1</sup> Contaoは自動的に利用可能な状況に依存した画像処理のライブラリを選択します。けれども、PHP GDライブラリは利用できなければなりません。すべての場合でPHPのImagickまたはGmagickライブラリを経由してImageMagickを使用することを推奨します。ImageMagickはより良い性能と品質をContaoが実際にどちらのライブラリを使用しているかは、以下のコマンドを実行して確認できます:
```bash
$ vendor/bin/contao-console debug:container contao.image.imagine
```
{{% /notice %}}

[ext-zlib]: https://www.php.net/manual/en/book.zlib.php
[ext-dom]: https://www.php.net/manual/en/book.dom.php
[ext-pcre]: https://www.php.net/manual/en/book.pcre.php
[ext-intl]: https://www.php.net/manual/en/book.intl.php
[ext-pdo]: https://www.php.net/manual/en/book.pdo.php
[ext-json]: https://www.php.net/manual/en/book.json.php
[ext-curl]: https://www.php.net/manual/en/book.curl.php
[ext-mbstring]: https://www.php.net/manual/en/book.mbstring.php
[ext-gd]: https://www.php.net/manual/en/book.image.php
[ext-imagick]: https://www.php.net/manual/en/book.imagick.php
[ext-gmagick]: https://www.php.net/manual/en/book.gmagick.php

現在のPHPのバージョンでは、すべての必要な拡張は初期状態で有効です。けれども、ホスティングの提供者によっては明示的に無効にしている場合があります。[Contao Manager](../../installation/contao-manager)または[Composer](https://getcomposer.org)でインストールする家庭で、これらの要件を自動的に検査します。

### PHPの設定 (`php.ini`)

Contaoの理想的な操作のための推奨です。異なった設定はContaoが動作しないという意味ではありませんが、予期せぬ動作や性能の低下や遅い反応を起こす可能性があります。

| 構成名                          | Webでの処理                | コマンド行            | 注記                                                                                                                     |
|:--------------------------------|:---------------------------|:----------------------|:-------------------------------------------------------------------------------------------------------------------------|
| `memory_limit`                  | `256M`以上                 | `-1`&nbsp;(無制限)    |                                                                                                                          |
| `max_execution_time`            | `30`以上                   | `0` (無制限)          |                                                                                                                          |
| `file_uploads`                  | `On`                       | _該当なし_            |                                                                                                                          |
| `upload_max_filesize`           | minimum `32M`              | _該当なし_            |                                                                                                                          |
| `post_max_size`                 | `upload_max_filesize`と同様| _該当なし_            |                                                                                                                          |
| `max_input_vars`                | `1000`                     | _該当なし_            | 多数の拡張をインストールしている場合は増やす必要があるかもしれません。ユーザーのアクセス権が正しく保存されない場合は増やしてください。 |
| `opcache.enable`                | `1` (有効)                 | `0` (無効)       | opcode cacheを無効にすると著しい性能の低下を招きます。                                                                        |
| `opcache.enable_cli`            | `0` (無効)                 | `0` (無効)       |                                                                                                                               |
| `opcache.max_accelerated_files` | `16000` 推奨               | _該当なし_            | 低い値は余計な減速をするかもしれません。                                                                                |
| `safe_mode`                     | `Off`                      | `Off`                 |                                                                                                                          |
| `open_basedir`                  | `NULL`                     | `NULL`                | 有効な場合は、システムの一時ディレクトリにアクセスできることを確認してください。                                        |


### MySQLの設定

- **MySQL** storage engine `InnoDB` (MySQL 5.7以降の初期設定)
- **MySQL** option `innodb_large_prefix = 1` (MySQL 5.7.7以降では初期設定で有効)
- **MySQL** option `innodb_file_format = Barracuda` (MySQL 8.0以降では不要)
- **MySQL** option `innodb_file_per_table = 1` (MySQL 5.6.7以降では初期設定で有効)
- **MySQL** character set `utf8mb4`


### PHPの最小の要件

#### Contao 4.11以降

- **PHP**バージョン7.3.0以降が必要です。


#### Contao 4.9 (LTS)

- **PHP**バージョンVersion 7.2.0以降が必要です。
- 画像の処理はPHPの拡張GD(`ext-gd`)とImagick(`ext-imagick`)またはGmagick(`ext-gmagick`)で処理できます。Contaoは自動的に検出して最良の利用できる拡張を使用します。


#### Contao 4.4 (LTS)

- **PHP**バージョンVersion 5.6.0以降が必要です。
- 拡張GD(`ext-gd`)が画像の処理に必要です。

{{% notice info %}}
MySQLサーバーのバージョン**8.0.17**以降を使用している場合は、少なくともPHP **7.2.0**が必要です。
{{% /notice %}}


### PHPのバージョンの変更

既に動作しているPHPのバージョンを変更する場合、その後で常に`composer update`を実行しなければなりません。メジャーバージョンを変更、例えばPHP 7.xから8.xやその逆の場合は特に重要です。
(Contao自身、インストールしたContaoの拡張、他の第3者のパッケージを含んだ)各パッケージは特定のPHPのバージョンとPHPの拡張を必要とするかもしれないので、インストールしたパッケージがそれぞれのPHPのバージョンと互換性があることを保証します。

Contao Managerを使用している場合、保守のセクションで_Composerの依存関係_の下から`composer update`の処理を実行できます。

![Composer update in the Contao Manager](/ja/installation/images/en/composer-update.png?classes=shadow)


### MySQLの最小の要件

Contaoは[Doctrine DBAL](https://www.doctrine-project.org/projects/dbal.html)のデータベースの抽象化レイヤーを使用していますが、MySQL(または互換性のあるMariaDBのような分岐)以外のデータベースサーバーは現在サポートしていません。

はMySQLサーバーのバージョン5.1 / 5.5で`MyISAM`のテーブルの形式でContaoはテストに成功しています。文字セットの`utf8mb4`の代わりに`utf8_general_*`を使用すると、UTF8のサポートが悪化(例: 絵文字がない)します。

以上の推奨する選択がサーバーで有効にできない場合は、他のデータベースエンジンで異なる文字セットを`app/config/config.yml`ファイルに構成してください:

{{% notice note %}}
**Contao 4.8**以降では、[`config/config.yml`](../../system/settings/#config-yml)ファイルになります。
{{% /notice %}}

```yml
doctrine:
    dbal:
        connections:
            default:
                default_table_options:
                    charset: utf8
                    collate: utf8_unicode_ci
```

さらにMySQLを"厳密モード"で動作することを推奨します、これによってデータの破損や切り詰めを防止し、データの一貫性を保証できます。

{{% notice note %}}
**Contao 4.9**以降では、データーベースサーバーが厳密モードで動作していないとインストールツールが警告を表示します。
{{% /notice %}}

厳密モードを有効にするには、以下を`my.cnf`または`my.ini`に追加するか、設定が適切に調整されていることを確認してください:

```
[mysqld]
…
sql_mode="TRADITIONAL"
…
```
サーバーで設定を有効にできない場合は、接続のオプションを`app/config/config.yml`ファイル ({{< version-tag "4.8" >}}`config/config.yml`ファイル)に構成してください:

```yml
doctrine:
    dbal:
        connections:
            default:
                options:
                    # DBドライバーによってはオプションのキーは1002 (pdo_mysql)または3 (mysqli)
                    1002: "SET SESSION sql_mode=(SELECT CONCAT(@@sql_mode, ',TRADITIONAL'))"
```

{{% notice "note" %}}
[`TRADITIONAL`SQLモード](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#sqlmode)は、SQLのモードの中でも特に`STRICT_TRANS_TABLES`と`STRICT_ALL_TABLES`のようなモードを組み合わせたようなものです。"[厳密なSQLモード](https://dev.mysql.com/doc/refman/8.0/ja/sql-mode.html#sql-mode-strict)"は`STRICT_TRANS_TABLES`または`STRICT_ALL_TABLES`を設定すると有効になり、これは現在のMySQLとMariaDBの両方で初期設定で有効です。けれども、多くの共用のホスティング環境では異なる設定をしています。厳密モードの利点は誤ったデータベースの操作をデータベースサーバーが静かに無視する代わりに、実際にエラーとします。この結果、より良いデータの一貫性と安全性につながります。
{{% /notice %}}


## Webサーバー

- 今日の現代的なホスティング環境では、顧客にSSHターミナル経由でのアクセスを許可しています。これは伝統的な暗号化されていないFTPによるアクセスよりも安全であるだけではなく、アプリケーションの効率的なデバッグと開発を可能にしています。

- [PHP-FPM](https://php-fpm.org)または同様なFastCGIの設定をPHPスタックで使用することを推奨します。Contaoは[`fastcgi_finish_request()`](https://www.php.net/manual/en/function.fastcgi-finish-request.php)を使用して、ブラウザーが応答を待つことなく(ページのコンテンツのインデックスといった)バックグランドのタスクを実行できます。

### ホスティングの構成

Contaoでは、すべての公開したアクセスをするファイルはインストールした場所の`web/`というサブフォルダーに配置します。
ホスティング提供者の管理パネルから、この場所をドキュメントルートに設定して、この機会にデータベースの設定をしてください。

例: `example.com`はディレクトリ`/www/example/web`を指す

({{< version-tag "4.12" >}} Symfonyの標準に従って、公開するサブフォルダー`/web`は`/public`と名前が変更になりました。インストール先に`/web`というディレクトリがある場合は、Contaoは自動的に代わりに`/public`を使用します。)

{{% notice note %}}
このため、それぞれのContaoのインストールには別々の(サブ)ドメインが必要です。
{{% /notice %}}

## プロバイダー特有の設定

Internetサービスのいくつかの大規模なプロバイダーではContaoを動作させるための特別な設定を用意している場合があります。幸いなことに、それらは規則の例外です。プロバイダー特有の設定はドイツ語の[Contaoフォーラム](https://community.contao.org/de/forumdisplay.php?67-Erfahrungen-mit-Webhostern)にあります。Contaoに最適なホスティングのパッケージは"Webホスティング"のカテゴリーの[Contaoパートナー](https://contao.org/en/contao-partners.html)から得ることができます。