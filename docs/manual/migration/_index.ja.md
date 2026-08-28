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
`contao/managed-edition`のほとんどのコアのパッケージではバージョンの要件に`^5.0`という記法を使用しています。
これは各パッケージは少なくともバージョン`5.0.0`をインストールしますが、`6.x`はしないことを意味します。
この記法では`5.1.x`、`5.2.x`などのインストールも許可します。
しかし、`contao/manager-bundle`のバージョンの要件は初期設定で`5.0.*`と設定されています。
これは具体的に許可、例えば要件を`5.1.*`に変更するといったことをしない限り、ComposerがContaoの新しいマイナーバージョンに自動的に更新しないようにするためです。
これについては[Composerのドキュメント](https://getcomposer.org/doc/articles/versions.md)も参照してください。
{{% /notice %}}


### Composerスクリプトの調整

インストールしているContaoが古いバージョンで起動する場合、もうContao 5には存在しない`ScriptHandler`クラスへの参照を`composer.json`が未だに含んでいる可能性があります。
その部分は代わりに`@php vendor/bin/contao-setup`を使用するように変更しなければなりません:

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


### ドキュメントルート

Contao 4.13と5はその入り口として`public/`フォルダーを使用しています。
Contao 4.13は(以前のContaoのバージョンの標準だった)`web/`フォルダーを代わりに使用している場合を自動的に検出していました。
しかし、Contao 5ではもう自動的な検出を行わないので、Webサーバーの設定の更新と調整を行う前に既存の`web/`フォルダーを`public/`に名前を変更しなければなりません。
あるいは、公開ディレクトリとして使用するフォルダーを`composer.json`で設定すること模できます。([ホスティングの構成][HostingConfig]を参照してください。)


### フォルダーの構成を調整

以前のContaoのバージョンは`app/`フォルダーをリソースと他のアプリケーションの調整に使用していました。
新しいバージョンは新規の構成を使用し、古い構成もサポートしていましたが、Contao 5は古い構成をサポートしていません。
万が一、まだ使用している場合は、以下のファイルとフォルダーを移動しなければなりません:

| 旧 | 新 |
|---|---|
| `app/config/` | `config/` |
| `app/Resources/contao/` | `contao/` |
| `app/Resources/public/` | `public/` |
| `app/Resources/translations/` | `translations/` |
| `app/Resources/views/` | `templates/bundles/` |


### アプリケーションの調整

Contao 4はContao 3からの`system/config/`フォルダーでの調整をまだサポートしていました。
このサポートはContao 5で削除されたので、そのような調整は正しい場所に移動しなければならなくなりました。
詳細については[開発者のドキュメント][ConfigTranslations]を参照してください。

#### `contao/config.yaml`

`config.yaml`の以下の構成はContao 5で削除されたので、取り除かなければなりません:

| 項目                  | 置き換え                              |
|-----------------------|---------------------------------------|
| contao.prepend_locale | Webサイトの起点となる範囲内で調整可能 |
| contao.url_suffix     | Webサイトの起点となる範囲内で調整可能 |
| contao.legacy_routing | -                                     |
| contao.encryption_key | -                                     |


### 内部のスタイルシートの取り出し

Contao 5は[内部のCSSエディター][ManageStylesheets]を廃止しました。
まだ、内部のスタイルシートを使用している場合はContao 5にアップグレードする前に[取り出し][ExportStylesheets]て、ページレイアウトで[外部スタイルシート][LayoutStylesheets]として改めて選択してください。


### 機能拡張

以上に書きました調整を行った後、これでContao 5にアップグレードするためにComposerの全パッケージの更新を実行できるようになります。
しかし、Contao 5に対応していない機能拡張をインストールしていたり、他にContao 5と互換性のない依存関係があったり、といった場合にComposerは更新を阻む場合があります。

この場合、これらに互換性のある新しいバージョンのパッケージがあるかどうかを確認したり、インストールしているContaoにその機能拡張が引き続き必要かどうかを確認して不要であれば削除するといったことが必要となります。


### テンプレート

以前に書きましたように、カスタマイズしたテンプレートに調整が必要かどうか常に確認する必要があります。
しかし、Contao 5では特に留意が必要な点があります: すべてのコンテント要素(そして将来はフロントエンドモジュールも)近代化されて、新しいテンプレートファイルの構造とともに[Twigテンプレート][TwigTemplates]を使用するようになりました。
例えば、`templates/ce_text.html5`といったテンプレートをカスタマイズしていた場合、これによる調整はContao 5の初期設定では何の効果もありません。(それぞれのコンテント要素を古い実装に切り替えれば別ですが、これはContao 5でも可能です。)


### 移行の実行とデータベースの更新

Contao 5へのComposerパッケージの更新を終えましたら、データベースの更新を行えます。
Contao 5にはインストールツールはもうありません。
代わりに、データベースの移行と更新をコマンド行から実行するか、Contao Managerの機能で実行します。
コマンド行で処理を開始するには、以下のコマンドを実行してください:

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
