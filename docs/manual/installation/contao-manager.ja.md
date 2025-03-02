---
title: 'Contao Managerについて'
description: 'Contao ManagerはContaoのインストールを簡単に管理するグラフィカルインターフェイスを提供するツールです。'
aliases:
    - /ja/installation/contao-manager/
weight: 20
---

Contao Managerの開発は[Contao Association](https://association.contao.org/)がサポートしています。

## Contao Managerの役割

ほとんどのPHPのプロジェクトのように、[Composer](https://getcomposer.org)でContaoはインストールと更新を行います。
Composerはコマンド行から使用できるパッケージ管理で、コマンド行からContaoを完全な管理にも使用できます。Contao ManagerはContaoのインストールの管理をグラフィカルユーザーインターフェイスで提供するツールです。コマンド行のハードルを取り除き、必要なコマンドを1クリックで実行できるようにします。

Contao Managerを使用して、中でも以下の作業を実行できます:

- Contaoをインストール
- Conatoを更新
- 機能拡張を検索
- 機能拡張をインストール
- 機能拡張をアンインストール
- Contaoのキャッシュを消去(システム保守)

システム設定の定義といった、さらに機能も計画しています。

Contao ManagerはContaoの動作には付加的なもので必要なものではありません。けれども、Composerの知識が必要ないので、初心者が機能拡張のインストールと管理を容易にできるようにします。

Contao 4と機能拡張をComposerを使用してコマンド行から直接管理することは引き続き可能です。

## Contao Managerのインストール

### システム要件 {#system-requirements}

システム要件は[Contao](/ja/installation/system-requirements/)と基本的に同じです。Contao Managerは要件を満たしているか自動的に確認します。

- PHPバージョン8.1以降
- PHP拡張の*Intl*と*OpenSSL*
- PHP関数の*proc\_open*と*proc\_close*
- PHPの設定で*allow\_url\_fopen*が有効であるこｔ

{{% notice note %}}
Contao ManagerはPHP 5やPHP 7でもインストールできます。最初のアクセス時にPHPのバージョンを検出してContaoのサーバーから互換性のあるバージョンを自動的にダウンロードします。
この場合、当然ながら最新のバージョンの機能は利用できませんが、それでもContaoのインストールや更新は可能です。
{{% /notice %}}

### ホスティングの構成

Contaoでは、すべての公開したアクセスをするファイルはインストールした場所の`web/`というサブフォルダーに配置します。
ホスティング提供者の管理パネルから、この場所をドキュメントルートに設定して、この機会にデータベースの設定をしてください。

**例:** `example.com`はディレクトリ`/www/example/web`を指す

({{< version-tag "4.12" >}} Symfonyの標準に従って、公開するサブフォルダー`/web`は`/public`と名前が変更になりました。インストール先に`/web`というディレクトリがある場合は、Contaoは自動的に代わりに`/public`を使用します。`/web`から`/public`に変更するときは、composer.jsonでも指定しなければなりません。)

{{% notice info %}}
すべてのContaoのインストールには別々の(サブ)ドメインが必要です。
{{% /notice %}}

### ダウンロードとインストール

Contao Managerは1つのファイルで構成されていて、[contao.orgからダウンロード](https://contao.org/en/download.html)できます。
ダウンロードに成功すると`contao-manager.phar`というファイルができますので、このファイルをWebサーバーの`web` ディレクトリに転送してください。

{{% notice note %}}
`.phar`という拡張子のファイルはすべてのホスティング提供者の環境で実行できるとは限りません。最良の互換性を得るためには、ファイルに拡張子`.php`を追加して(最終的な名前を`contao-manager.phar.php`として)ください。
{{% /notice %}}

{{% notice warning %}}
ほとんどのFTPプログラムでは、拡張子が`.php`のファイルをバイナリモードの代わりにテキストモードで転送し、その結果Contao Managerのファイルは破壊されます。このため、`.php`の拡張子はアップロードした後で追加してください。
{{% /notice %}}

### Contao Managerの開始

次に、ブラウザーを使用して`www.example.com/contao-manager.phar.php`というURLにアクセスしてください。Contao Managerの開始ページを表示を表示します。

![Contao Managerの開始ページ]({{% asset "images/manual/installation/ja/welcomepage-contao-manager.png" %}}?classes=shadow)

### 基本的な構成

Contaoをインストールする前に、Contao Manager自身の構成を行わなければなりません。ユーザー名とパスワードを入力して新しいユーザーを作成します。パスワードは次のContaoのインストールとは無関係です。

Contao Managerは自身のデータベースを必要としません。Contao Managerの構成は`manager.json`というファイルに、ユーザーデータを`users.json`というファイルに、いずれのファイルも`/contao-manager`というディレクトリに保存します。

### サーバー構成

Contao Managerはバックグラウンドのプロセスを正しく動作させるために、PHPの実行ファイルのパスとその他のサーバーの情報を必要とします。パスは通常Contao Managerが自動的に検出します。

![サーバー構成]({{% asset "images/manual/installation/ja/server-configuration.png" %}}?classes=shadow)

#### Composerリゾルバークラウド

[Composerリゾルバークラウド](https://composer-resolver.cloud/)は、サーバーに十分なメモリーがない場合でもComposerの依存関係のインストールを可能とします。依存関係を解決するパッケージ情報は[Contao Association](https://association.contao.org/)のクラウドサービスに[送られる](https://association.contao.org/)ことに注意してください。

基本的な構成を完了した後で、Contaoを[インストール](/ja/installation/install-contao/#installing-contao-with-the-contao-manager)できるようになります。

## Contao Managerについてよくある質問と答え

### どうやってContao Managerを更新できますか?

基本的に、手動による更新は必要ありません。Contao Managerはバックグラウンドで自動的に検査を行って、新しいバージョンが利用できる場合は自動的にそれ自身を更新します。

問題がある場合は、いつでも最新のバージョンの`contao-manager.phar`をダウンロードして、[FTP](#download-and-installation)で手動で[アップロードと置き換える](#download-and-installation)ことができます。

### Contao Managerのログイン情報を忘れたらどうしますか?

パスワードを消去するには、サーバーにFTPで接続しなければなりません。

`contao-manager`というディレクトリに移動し、`users.json`というファイルを削除してください。

すぐに、使用しているドメインに`contao-manager.phar.php`を追加したドメインにアクセスしてContao Managerを呼び出して新しい管理者ユーザーを作成してください。

`users.json`のファイルを削除したにも関わらず、既存のユーザーでログインをしようとする場合は、ブラウザーからドメインのクッキーを削除するか、Contao Managerのページをプライベートモードで開いてください。

### Contao Managerが「ハングアップ」しました。

Contao Managerが応答しなくなった、コンソールの出力ウィンドウが閉じない、といった場合はContao Managerのページの再読み込みしてください。再読み込みしても同じ表示となる場合は`contao-manager`のディレクトリにある`task.json`というファイルを削除してください。

その後、Contao Managerは再び動作するはずです。

### Contao Managerにもう1つユーザーアカウントを追加できますか?

{{< version "Manager 1.9" >}}

はい、ADMIN権限があれば他のユーザーをContao Managerに招待できます。
このためには、メニューの歯車をクリックして、_アカウント_を選択します。
ここから招待のリンクを作成して、以下の権限から1つを新しいアカウントに割り当てられます。

- **読み取り** – インストールしたパッケージを確認し、ログファイルを読めますが、システムの変更はできません。
- **更新** – 既存のパッケージの更新と、保守の作業(例えばキャッシュの消去)が可能です。
- **インストール** – パッケージの更新とインストール、システム設定の変更を行えます。
- **管理者** – Contao Managerのすべての機能を使用できます。

### 既存のインストールしたContaoにContao Managerを追加できますか?

はい、Managed EditionのContaoをインストールして使用している場合は、後からContao Managerをインストールできます。`web`のディレクトリに`contao-manager.phar`のファイルをアップロードして、`.php`の拡張子を追加してください。

基本的なインストールの過程で、Contao Managerは既にContaoをインストールしていることを認識します。

### ».phar«という名前を変更できますか?

はい、変えたいと思うどのような名前も使用できます。けれども、バックエンドからContao Managerにアクセスできなくなってしまいます。この場合、[config.yaml](/ja/system/settings/#config-yaml)を適切に変更できます。その後、Contao Manager("保守" &gt; "アプリケーションキャッシュ" &gt; "実稼働用のキャシュを再構築")か、コンソールを使用してアプリケーションキャッシュを一旦消去する必要があります。

```yaml
# config/config.yaml
contao_manager:
    manager_path: your-name.phar.php
```

