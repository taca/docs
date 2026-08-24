---
title: 'Contao Managerについて'
description: 'Contao ManagerはContaoのインストールを簡単にグラフィカル・ユーザー・インターフェイスで管理できるつーるです。'
aliases:
    - /ja/installation/contao-manager/
weight: 20
---

Contao Managerの開発は[Contao Association](https://association.contao.org/)がサポートしています。

## Contao Managerの役割

ほとんどのPHPのプロジェクトのように、[Composer](https://getcomposer.org)を使用してContaoのインストールと更新を行います。
Composerはコマンド行から使用できるパッケージ管理で、コマンド行からContaoも完全に管理できます。
Contao Managerはグラフィカル・ユーザー・インターフェイスでContaoのインストールの管理を提供します。
コマンド行のハードルを乗り越えて、必要なコマンドをたった1度のクリックで実行できるようにします。

Contao Managerを使用すると、とりわけ以下の作業を実行できます:

- Contaoをインストール
- Contaoを更新
- 機能拡張を検索
- 機能拡張をインストール
- 機能拡張をアンインストール
- ContaoのCacheを消去 (システム保守)

将来的にはシステム設定の定義といった、その他の機能も計画しています。

Contaoを動作させるのにContao Managerは必須ではありません。
しかし、Composerの知識を必要としないので、初心者に機能拡張のインストールと管理をContao Maangerは簡単にします。

引き続きコマンド行からComposerを使用して、Contao 4と機能拡張のインストールの管理を行えます。

## Contao Managerのインストール

### システム要件

システム要件は基本的には[Contao](/ja/installation/system-requirements/)と同じです。
Contao Managerはシステム要件を満たしているかどうかを自動的に確認します。

最新のバージョンでは以下が必要です:

- PHPバージョン8.1以降
- PHPの拡張*Intl*と*OpenSSL*
- PHPの関数*proc\_open*と*proc\_close*
- PHPの設定で*allow\_url\_fopen*を有効なことが必須

{{% notice note %}}
Contao ManagerはPHP 5やPHP 7にもインストールできます。
最初にアクセスした時点でPHPのバージョンを検出すると、Contaoのサーバーから互換性のあるバージョンを自動的にダウンロードします。
この場合、最新のバージョンの機能は言うまでもなく利用できませんが、Contaoのインストールや更新は引き続き加納です。
{{% /notice %}}

### ホスティングの構成

Contaoでは、すべてに公開してアクセス可能なファイルはContaoをインストールしているフォルダーの直下の`/public`というフォルダーに配置します。
`public`というフォルダーを作成して、ホスティング提供者の管理パネルからContaoのドキュメントルートに設定してください。

**例:** `example.com`はディレクトリ`/www/example/public`を指しています。

{{% notice info %}}
それぞれのContaoのインストールには別々の(サブ)ドメインが必要です。
{{% /notice %}}

### ダウンロードとインストール

Contao Managerは[contao.orgからダウンロード](https://contao.org/en/download.html)できるファイル1つの構成となっています。
ダウンロードに成功すると`contao-manager.phar.php`というファイルを取得できます。
このファイルをWebサーバーの`public`ディレクトリに転送してください。

### Contao Managerの開始

次に、ブラウザーでURL: `www.example.com/contao-manager.phar.php`にアクセスします。
Contao Managerの開始ページを表示するはずです。

![Contao Managerの開始ページ]({{% asset "images/manual/installation/ja/welcomepage-contao-manager.png" %}}?classes=shadow)

### 基本的な構成

Contaoをインストールする前に、Contao Manager自体を構成しなければなりません。
ユーザー名とパスワードを入力して新しいユーザーを作成してください。
パスワードは後に続くContaoのインストールとは無関係です。

Contao Managerは独自のデータベースを必要としません。`/contao-manager`というディレクトリに、Contao Managerの構成は`manager.json`に、ユーザーの情報は`users.json`というファイルにContao Managerは保存します。

### サーバーの構成

Contao Managerはバックグラウンドでプロセスを正しく実行するために、PHPの実行ファイルのパスと他のサーバーの情報を必要とします。
Contao Managerはパスを通常は自動的に検出します。

![サーバーの構成]({{% asset "images/manual/installation/ja/server-configuration.png" %}}?classes=shadow)

#### Composerリゾルバークラウド

サーバーに十分なメモリーがない場合でも[Composerリゾルバークラウド](https://composer-resolver.cloud/)はComposerの依存関係のインストールを可能にします。
パッケージ情報の依存関係を解決する情報は[Contao Association](https://association.contao.org/)のクラウドサービスに[送信](https://association.contao.org/)されることに注意してください。

基本的な構成を行うと、Contaoを[インストール](/ja/installation/install-contao/#installing-contao-with-the-contao-manager)できるようになります。

## Contao Managerのよくある質問と答え

### どのようにContao Managerを更新できますか?

基本的に、手作業による更新は必要ありません。Contao Managerはバックグラウンドで自動的に確認して、新しいバージョンを利用できる場合は自身を更新します。

問題のある場合は、いつでも最新のバージョンの`contao-manager.phar`をダウンロードして、[FTP](#download-and-installation)を経由して手動で[アップロードと置き換え](#download-and-installation)を行えます。

### Contao Managerのログイン情報を忘れたらどうすればよいですか?

パスワードを消去するには、サーバーにFTPで接続しなければなりません。

`contao-manager`というディレクトリに移動し、`users.json`というファイルを削除してください。

すぐに、使用しているドメインに`contao-manager.phar.php`を追加したドメインにアクセスしてContao Managerを呼び出して新しい管理者ユーザーを作成してください。

`users.json`のファイルを削除したにも関わらず、既存のユーザーでログインをしようとする場合は、ブラウザーからドメインのクッキーを削除するか、Contao Managerのページをプライベートモードで開いてください。

### Contao Managerが「ハングアップ」しました。

Contao Managerが応答しなくなったり、コンソールの出力ウィンドウが閉じなくなったり、といった場合はContao Managerのページの再読み込みしてください。再読み込みしても同じ表示となる場合は`contao-manager`のディレクトリにある`task.json`というファイルを削除してください。

その後、Contao Managerは再び動作するはずです。

### Contao Managerにもう別のユーザーアカウントを追加できますか?

{{< version "Manager 1.9" >}}

はい、ADMIN権限があれば他のユーザーをContao Managerに招待できます。
このためには、メニューの歯車をクリックして、_アカウント_を選択します。
ここから招待のリンクを作成して、以下の権限から1つを新しいアカウントに割り当てられます。

- **読み取り** – インストールしたパッケージを確認し、ログファイルを読めますが、システムの変更はできません。
- **更新** – 既存のパッケージの更新と、保守の作業(例えばキャッシュの消去)が可能です。
- **インストール** – パッケージの更新とインストール、システム設定の変更を行えます。
- **管理者** – Contao Managerのすべての機能を使用できます。


### 既存のインストールしたContaoにContao Managerを追加できますか?

はい、Managed EditionのContaoをインストールして使用している場合は、後からContao Managerをインストールできます。`public`のディレクトリに`contao-manager.phar`のファイルをアップロードして、`.php`の拡張子を追加してください。

Contao Managerの基本的なインストールの過程で、Contaoを既にインストールしていることを認識します。

### ».phar«という名前を変更できますか?

はい、変えたいと思うどのような名前も使用できます。けれども、バックエンドからContao Managerにアクセスできなくなってしまいます。
この場合、[config.yaml](/ja/system/settings/#config-yaml)を適切に変更します。
その後、Contao Manager("保守" &gt; "アプリケーションキャッシュ" &gt; "実稼働用のキャシュを再構築")か、コンソールを使用してアプリケーションキャッシュを一旦消去する必要があります。

```yaml
# config/config.yaml
contao_manager:
    manager_path: your-name.phar.php
```
