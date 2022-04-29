---
title: "System requirements"
aliases:
    - /en/installation/system-requirements/
weight: 10
---

To run Contao successfully, the web server must meet these system requirements. Contao was originally
developed for the familiar [LAMP](https://en.wikipedia.org/wiki/LAMP_(software_bundle)) stack, but runs on
any web server that provides a current version of PHP and MySQL.


## Software Recommendations

The minimum requirements depend on whether you are installing the latest or the _Long Term Support_ version. All
maintained versions of Contao are compatible with the latest PHP and MySQL versions. Therefore, we recommend to
always use them.

- **PHP:** Version 7.4+ (latest patch version)
- **MySQL:** Version 8.0+ or equivalent **MariaDB** server


### PHP Extensions

| Extension Name | Contao 4.4 | Contao 4.9 |
|:------------------------------------------|:-------------------------|:--------------------------------------------|
| [DOM][ext-dom] (`ext-dom`)                | **required**             | **required**                                |
| [PCRE][ext-pcre] (`ext-pcre`)             | **required**             | **required**                                |
| [Intl][ext-intl] (`ext-intl`)             | recommended              | **required**                                |
| [PDO][ext-pdo] (`ext-pdo`)                | **required**             | **required**                                |
| [ZLIB][ext-zlib] (`ext-zlib`)             | **required**             | **required**                                |
| [JSON][ext-json] (`ext-json`)             | **required**             | **required**                                |
| [Curl][ext-curl] (`ext-curl`)             | **required**             | **required**                                |
| [Mbstring][ext-mbstring] (`ext-mbstring`) | **required**             | **required**                                |
| [GD][ext-gd] (`ext-gd`)                   | **required**<sup>1</sup> | **required**<sup>1</sup>                    |
| [Imagick][ext-imagick] (`ext-imagick`)    | recommended<sup>1</sup>  | requires GD, Imagick or Gmagick<sup>1</sup> |
| [Gmagick][ext-gmagick] (`ext-gmagick`)    | recommended<sup>1</sup>  | requires GD, Imagick or Gmagick<sup>1</sup> |

{{% notice note %}}
<sup>1</sup> Contao automatically selects an image processing library depending on its availability.
However, the PHP GD library must still be available.
Using ImageMagick via the PHP Imagick or Gmagick library is recommended in all cases. ImageMagick
offers better performance and quality. To find out which library is actually used by Contao,
the following command can be executed:
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

All required extensions are enabled by default in current PHP versions. However, some hosting providers
explicitly disable them. The requirements are automatically checked during installation via the
[Contao Manager](../../installation/contao-manager) or [Composer](https://getcomposer.org).


### PHP configuration (`php.ini`)

These are the recommended settings for the ideal operation of Contao. A different configuration does not mean
that Contao does not work, but may cause unexpected behavior or performance degradation/slow reactions.

| Configuration Name              | Web Process                | Command Line          | Notes                                                                                                                    |
|:--------------------------------|:---------------------------|:----------------------|:-------------------------------------------------------------------------------------------------------------------------|
| `memory_limit`                  | minimum `256M`             | `-1`&nbsp;(unlimited) |                                                                                                                          |
| `max_execution_time`            | minimum `30`               | `0` (unlimited)       |                                                                                                                          |
| `file_uploads`                  | `On`                       | _not applicable_      |                                                                                                                          |
| `upload_max_filesize`           | minimum `32M`              | _not applicable_      |                                                                                                                          |
| `post_max_size`                 | like `upload_max_filesize` | _not applicable_      |                                                                                                                          |
| `max_input_vars`                | `1000`                     | _not applicable_      | May need to be increased if many extensions are installed. Increase if the user access rights cannot be saved correctly. |
| `opcache.enable`                | `1` (enabled)              | `0` (disabled)        | Disabling the opcode cache has a significant negative impact on performance.                                             |
| `opcache.enable_cli`            | `0` (disabled)             | `0` (disabled)        |                                                                                                                          |
| `opcache.max_accelerated_files` | `16000` empfohlen          | _not applicable_      | A lower value may cause an unnecessary slowdown.                                                                         |
| `safe_mode`                     | `Off`                      | `Off`                 |                                                                                                                          |
| `open_basedir`                  | `NULL`                     | `NULL`                | If active, make sure that the system's temporary directory can be accessed.                                              |


### MySQL Configuration

- **MySQL** storage engine `InnoDB` (default since MySQL 5.7)
- **MySQL** option `innodb_large_prefix = 1` (enabled by default since MySQL 5.7.7)
- **MySQL** option `innodb_file_format = Barracuda` (not necessary any more since MySQL 8.0)
- **MySQL** option `innodb_file_per_table = 1` (enabled by default since MySQL 5.6.7)
- **MySQL** character set `utf8mb4`


### Minimum PHP Requirements

#### Contao 4.11 and later

- **PHP** Version 7.3.0 or higher is required.


#### Contao 4.9 (LTS)

- **PHP** Version 7.2.0 or higher is required.
- Images can be processed with the PHP extensions GD (`ext-gd`), Imagick (`ext-imagick`) or Gmagick (`ext-gmagick`). 
Contao automatically detects and uses the best available extension.


#### Contao 4.4 (LTS)

- **PHP** Version 5.6.0 or higher is required.
- The GD extension (`ext-gd`) is required for image processing.

{{% notice info %}}
If a MySQL server in version **8.0.17** or higher is used, at least PHP **7.2.0** is required.
{{% /notice %}}


### Switching the PHP version

In case you want to switch the PHP version of an already running PHP instance, you should always run a full `composer update` after
switching. This is especially important when switching between major versions, e.g. from PHP 7.x to 8.x - or vice versa. This ensures 
compatibility of your installed packages with the respective PHP version, since each package (including Contao itself, installed Contao 
extensions and other third-party packages) can require specific PHP versions and PHP extensions that it needs and is known to be compatible 
with.

In case you are using the Contao Manager, you can run the `composer update` process in the maintenance section under _Composer Dependencies_:

![Composer update in the Contao Manager](/ja/installation/images/en/composer-update.png?classes=shadow)


### MySQL minimum requirements

Although Contao uses the [Doctrine DBAL](https://www.doctrine-project.org/projects/dbal.html) database abstraction layer, 
no database server types other than MySQL (or a compatible fork like MariaDB) are currently supported.

Contao has been successfully tested on MySQL servers version 5.1 / 5.5 with `MyISAM` table format. The use of
of `utf8_general_*` instead of the `utf8mb4` character set results in a worse UTF8 support (e.g. no emojis).

If the above recommended options cannot be enabled on your server, please configure another
database engine and a different character set in your `app/config/config.yml` file:

{{% notice note %}}
As of **Contao 4.8**, you can find the file under [`config/config.yml`](../../system/settings/#config-yml)  
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

It is further recommended to run MySQL in "strict mode" to prevent corrupt or truncated
data and to guarantee data integrity.

{{% notice note %}}
As of **Contao 4.9**, the install tool shows a warning if the database server is not running
in strict mode.
{{% /notice %}}

To enable it, add the following to your `my.cnf` or `my.ini` file or make sure that the
setting is adjusted accordingly:

```
[mysqld]
…
sql_mode="TRADITIONAL"
…
```

If the setting cannot be enabled on your server, please configure the connection
options in your `app/config/config.yml` file ({{< version-tag "4.8" >}} `config/config.yml` file):

```yml
doctrine:
    dbal:
        connections:
            default:
                options:
                    # Depending on the DB driver, the option key is either 1002 (pdo_mysql) or 3 (mysqli)
                    1002: "SET SESSION sql_mode=(SELECT CONCAT(@@sql_mode, ',TRADITIONAL'))"
```

{{% notice "note" %}}
The [`TRADITIONAL` SQL mode](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#sqlmode_traditional) is a combination mode consisting of
several SQL modes like `STRICT_TRANS_TABLES` and `STRICT_ALL_TABLES` among others. The "[Strict SQL Mode](https://dev.mysql.com/doc/refman/8.0/en/sql-mode.html#sql-mode-strict)" 
is active when either `STRICT_TRANS_TABLES` or `STRICT_ALL_TABLES` is enabled. Strict mode (specifically `STRICT_TRANS_TABLES`) is enabled 
by default in current versions of MySQL as well as MariaDB. However, many shared hosting environments use different settings. The advantage 
of strict mode is that erroneous database operations will actually cause an error instead of being silently ignored by the database server, 
leading to better data integrity and security.
{{% /notice %}}


## Web server

- Modern hosting environments of today allow customers to access their account via an SSH terminal. This is not only
a more secure connection than traditional unencrypted FTP, but also allows efficient debugging and the development of 
the application.

- It is recommended to use [PHP-FPM](https://php-fpm.org) or a similar FastCGI setup for the PHP stack. Contao can
perform background tasks (such as indexing the page content) without the browser waiting for the response by using 
[`fastcgi_finish_request()`](https://www.php.net/manual/en/function.fastcgi-finish-request.php).

### Hosting configuration

In Contao, all publicly accessible files are located in the `web/` subfolder of the installation. Set the
document root of the installation via the admin panel of the hosting provider to this subfolder and set up a database 
on this occasion.

Example: `example.com` points to the directory `/www/example/web`

({{< version-tag "4.12" >}} Following the Symfony standard, the public subfolder of `/web` has been renamed to 
`/public`. If there is a `/web` directory in your installation, Contao will automatically use it instead of `/public`).


{{% notice note %}}
Therefore, a separate (sub)domain is required for each Contao installation.
{{% /notice %}}

## Provider-specific settings

There are a few major Internet service providers that offer special settings for running Contao. Fortunately, they are 
only the exception to the rule. The provider-specific settings can be found in the German 
[Contao forum](https://community.contao.org/de/forumdisplay.php?67-Erfahrungen-mit-Webhostern). You can get optimal 
hosting packages for Contao from the [Contao partners](https://contao.org/en/contao-partners.html) in the service 
category "Web hosting".