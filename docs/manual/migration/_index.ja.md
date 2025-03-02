---
title: "アップデートと移行"
description: "インストールしたContaoを高いメジャーバージョンにアップグレードと移行します。"
url: "migration"
aliases:
    - /ja/migration/
weight: 3
---

この節では既存のインストールしているContaoを高い「メジャーバージョン」、つまりContao 3から4やContao 4から5に更新と移行を行う方法を説明します。


## 概要

一般に、次のメジャーバージョンに更新しようとする前に、最初に _現在の_ メジャーバージョンの最新版に確実に更新してください。
また、メジャーバージョンを飛ばさないでください。例えば、現在員ストーリしているContaoのバージョンが`3.2.10`の場合は、Contao `4.13.x`に更新する前に(最新のContao 3のバージョンである)`3.5.40`に更新しなければなりません。
現在のバージョンが`4.10.2`の場合は、Contao `5.x`に更新する前に`4.13.x`に更新しなければなりません、といった具合です。
こうすることで、Contaoのバージョンを適切に(主にデータベースについて)更新するための必要な移行処理を自動的に実効できます。

それぞれのContaoの(マイナーだけでなくメジャーな)バージョンの更新には、テンプレートのファイルの更新も含まれる場合があります。また一方、新しいメジャーバージョンに更新するときは、`templates/`フォルダーにあるカスタマイズしたテンプレートは調整が必要となる可能性が高いので、それらを確認することもたいへん重要です。

また、PHPのフレームワーク自身についても後方互換性のない変更を伴うことがありますので、独自のPHPのコードも調整が必要になる可能性があります。
通常、そのような変更は`contao/core-bundle`の`UPGRADE.md`に記述しています。デバッグモードでContaoを動作させると、非推奨の注意を確認できるでしょう。


## Contao `3.5`から`4.x`

1. Contao 3.5のデータベースをコピーします。
2. 新しい[Contao 4のインストール][ContaoInstallation]を作成します。
3. 先に作成したコピーのデータベースの認証情報を使用します。
4. 以下のファイルを元のContao 3のインストールからコピーします。
    * `files/`
    * `system/config/dcaconfig.php`
    * `system/config/langconfig.php`
    * `system/config/initconfig.php`
    * `system/config/localconfig.php`
    * `templates/`
5. Webサーバーの設定でContaoのインストールのドメインが`public/`フォルダーを指すようにします。([ホスティングの構成][HostingConfig]を参照).
6. [Contaoインストールツール][ContaoInstallTool]をブラウザーで開くか、コンソールで`vendor/bin/contao-console contao:migrate`コマンドを使用してデータベースの移行を開始してください。 _注意:_ この段階ではテーブルや項目を削除しないでください。


### 機能拡張

Contao 4は、まだContao 3の機能拡張をサポートしているので、`system/modules/`にコピーできるかもしれません。しかし、そのようなアップグレードでは、これらの機能拡張のより新しいバージョンが利用できるかどうかをComposer(またはContao Manager)で確認すべきです。もしそれができなかった場合はそれでも機能拡張が必要かどうかと破棄できるかどうかを評価しなければなりません。

機能拡張をインストールした後で、インストールツールまたは`contao:migrate`コマンドを使用して、機能拡張が提供する移行とデータベースの更新を実行してください。


## Contao `4.13` to `5.x`

Contao 4と5は構造的にはあまり変更はありません。`contao/managed-edition`の`composer.json`でさえ、Contao 4.13と大部分は同じです。しかし、移行を始める現在のContaoのバージョンと行っているカスタマイズによっては、Contao 5に更新する前に追加の手順が必世になるかもしれません。


### バージョンの必要条件の変更

理論的には、Contao `4.13`を`5.0`に更新するには、`composer.json`でContaoパッケージのバージョンの必要条件をそれぞれ`^5.0`または`5.0.*`と更新することだけが必要です。例えば、`"contao/news-bundle": "^4.13"`を`"contao/news-bundle": "^5.0"`などとする一方、`"contao/manager-bundle": "4.13.*"`は`"contao/manager-bundle": "5.0.*"`と変更しなければなりません。

```json
{
    "require": {
        "contao/calendar-bundle": "^5.0",
        "contao/comments-bundle": "^5.0",
        "contao/conflicts": "@dev",
        "contao/faq-bundle": "^5.0",
        "contao/listing-bundle": "^5.0",
        "contao/manager-bundle": "5.0.*",
        "contao/news-bundle": "^5.0",
        "contao/newsletter-bundle": "^5.0"
    }
}
```

{{% notice "info" %}}
The `contao/managed-edition` uses the `^5.0` notation for the version requirement for most of the core packages. This means that each
package can be installed in at least version `5.0.0`, but not in versions `6.x`. This notation also allows `5.1.x`, `5.2.x` etc. However,
the version requirement of the `contao/manager-bundle` is set to `5.0.*` by default. This is done so that Composer will not automatically
update to a new minor version of Contao, without you specifically allowing it, i.e. by changing the version requirement to `5.1.*` for
example. See also [Composer's documentation](https://getcomposer.org/doc/articles/versions.md) on this topic.
{{% /notice %}}


### Adjust Composer Scripts

If your Contao instance was started with an older version then your `composer.json` might still contain a reference to a `ScriptHandler`
class that does not exist anymore in Contao 5. This section will need to be changed to use `@php vendor/bin/contao-setup` instead:

```json
{
    "scripts": {
        "post-install-cmd": [
            "@php vendor/bin/contao-setup"
        ],
        "post-update-cmd": [
            "@php vendor/bin/contao-setup"
        ]
    }
}
```


### Document Root

Contao 4.13 and 5 use the `public/` folder as its entry point. Contao 4.13 still contains an automatic detection in case you are still
using the `web/` folder instead (which was the standard in previous Contao versions). However, Contao 5 does not have that anymore and thus
you should rename your existing `web/` folder to `public/` before you update and adjust your web server's configuration accordingly.
Alternatively you can also set the folder to be used as the public directory in your `composer.json` 
(see [hosting configuration][HostingConfig]).


### Adjust Folder Structure

Previous Contao versions used the `app/` folder for ressources and other application adjustments. Newer versions use a new structure, but
still had support for the old one - but Contao 5 does not not. The following files and folders will need to be moved, in case they are still
in use:

| Old | New |
|---|---|
| `app/config/` | `config/` |
| `app/Resources/contao/` | `contao/` |
| `app/Resources/public/` | `public/` |
| `app/Resources/translations/` | `translations/` |
| `app/Resources/views/` | `templates/bundles/` |


### Application Adjustments

Contao 4 still had support for adjustments in the `system/config/` folder from Contao 3. This support has been dropped in Contao 5 and thus
any such adjsutments will need to be moved to the correct location now. See the [developer documentation][ConfigTranslations] for more
details.


### Export Internal Stylesheets

Contao 5 drops the [internal CSS editor][ManageStylesheets]. If you are still using such internal stylesheets you will need to 
[export][ExportStylesheets] them before upgrading to Contao 5 and then select them as [external stylesheets][LayoutStylesheets] in your page 
layout again.


### Extensions

After implementing the previously mentioned adjustments you will now be able to execute a full Composer package update in order to upgrade 
to Contao 5. However, Composer might prevent you from doing so if you still require extension that haven't been unlocked for Contao 5 - or 
if other dependencies are not compatible with Contao 5.

In this case you should evaluate whether if newer major versions of these packages exist that might be compatible, or if the respective 
extension is still required for your Contao instance and thus could otherwise be removed.


### Templates

As mentioned previously you will always need to check whether any of your customised templates will need to be adjusted. There is however
one thing in particular to note in Contao 5: all content elements (and also front end modules in the future) have been modernised and use
[Twig-Templates][TwigTemplates] now, along with a new template file structure. If you had a customised `templates/ce_text.html5` template
for example then this adjustment will not have any effect by default in Contao 5 (unless you switch the respective content element back to
its old implementation, which is still possible in Contao 5).


### Run Migrations and Database Updates

In case the Composer package update to Contao 5 was successful you can now update the database. Contao 5 does not have the Install Tool
anymore. Instead the database migration and update must be run from the command line - or via the respective method within the Contao
Manager itself. In order to start the process on the command line you can use the following command:

```shell
vendor/bin/contao-console contao:migrate
```


[ContaoInstallation]: /ja/installation/install-contao/
[ContaoInstallTool]: /ja/installation/contao-installtool/
[HostingConfig]: /ja/installation/system-requirements/#ホスティングの構成
[ContaoManager]: /ja/installation/contao-manager/
[TwigTemplates]: /ja/layout/templates/twig/
[ConfigTranslations]: https://docs.contao.org/dev/getting-started/starting-development/#contao-configuration-translations
[ManageStylesheets]: /ja/layout/theme-manager/manage-stylesheets/
[ExportStylesheets]: /ja/layout/theme-manager/manage-stylesheets/#stylesheets-exportieren
[LayoutStylesheets]: /ja/layout/theme-manager/manage-page-layouts/#stylesheets
