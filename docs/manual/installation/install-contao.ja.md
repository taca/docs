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

基本的な構成を完了した後で、Contaoをインストールできます。希望するバージョンと初期構成を選択して、「完了」のボタンをクリックしてください。

![Contao ManagerでContaoをインストール](/ja/installation/images/en/contao-manager-setup.png?classes=shadow)

The installation can now take several minutes. Details about the installation process can be displayed by clicking the 
following icon![Show/Hide Console Output](/ja/icons/konsolenausgabe.png?classes=icon).

![Contao is installed](/ja/installation/images/en/contao-manager-background-task.png?classes=shadow)


### Update database tables

Once the Contao Manager has installed all packages, you have to [run](../contao-installtool/) the 
[Contao install tool](../contao-installtool/) to update the database.


## Installation via the command line

When installing from the command line via `create-project`, a `composer update` command is executed during the 
installation. This will cause some hosters not to be able to terminate the process due to high system load, and the 
installation will fail. In this case you should use the [Contao Manager](#installing-contao-with-the-contao-manager).

You have logged on to your server with your user name and domain.

```bash
ssh user@example.com
```

Change to the public directory of your web hosting.

```bash
cd www
```

### Install Composer

[Composer](https://en.wikipedia.org/wiki/Composer_(software)) is an application-oriented package manager for the 
PHP programming language and installs dependencies.

{{% notice note %}}
You can either install Composer [locally](https://getcomposer.org/doc/00-intro.md#locally) 
or [globally](https://getcomposer.org/doc/00-intro.md#globally). 
 
If you install Composer locally, you will have a `composer.phar` file in your working directory (i.e. where your project's
`composer.json` and `composer.lock` files are located). You would then call Composer with `php composer.phar`.
 
If you install Composer globally, you can use the `composer` command in any directory. 
{{% /notice %}}



### Installing Contao from the command line

In the second step, you install Contao using the Composer. "example" stands for the desired installation directory and 
4.11 for the [version of Contao you want to install](https://contao.org/de/download.html).

```bash
php composer.phar create-project contao/managed-edition example 4.11
```


### Hosting Configuration

In Contao, all publicly accessible files are located in the subfolder `/web` of the installation. Create this folder and 
use the admin panel of your hosting provider to set the document root of the installation to this subfolder and create 
a database on this occasion.

Example: `example.com`points to the directory `/www/example/web`

({{< version-tag "4.12" >}} Following the Symfony standard, the public subfolder of `/web` has been renamed to
`/public`. If there is a `/web` directory in your installation, Contao will automatically use it instead of `/public`).

{{% notice note %}}
Every Contao installation therefore requires its own (sub)domain.
{{% /notice %}}


### Update database tables
After installation, you can update the database using the [Contao install tool](/ja/installation/contao-installtool/). 

Since Contao 4.9 you can use the following command on the command line:

```bash
php vendor/bin/contao-console contao:migrate
``` 

{{% notice tip %}}
You can also create a database beforehand on the command line:<br>
`php vendor/bin/contao-console doctrine:database:create`
{{% /notice %}}

{{% notice info %}}
Contao needs to know the corresponding connection data for your database. This information can either be retrieved via 
an existing "config/parameters.yml" (currently installed using the [Contao-Install tool](/ja/installation/contao-installtool/)) 
or via a "[.env](https://docs.contao.org/dev/getting-started/starting-development/#application-configuration)" file 
in the root directory of your installation.<br><br> 
For details on the necessary environment variables ([DATABASE_URL](https://docs.contao.org/dev/reference/config/#database-url) 
and [APP_SECRET](https://docs.contao.org/dev/reference/config/#app-secret)) in a ".env" file you can find 
[here](https://docs.contao.org/dev/getting-started/starting-development/#application-configuration).
{{% /notice %}}


### Creating Contao back end users

Using the [Contao-Installtool](/ja/installation/contao-installtool/), you can create your back end user. Since Contao 
**4.10** you can use the following command on the command line:

```bash
php vendor/bin/contao-console contao:user:create
``` 



