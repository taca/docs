---
title: "Contaoのインストール - クイックスタート"
description: "Contao ManagerでContaoインストールする最初の一歩です。"
aliases:
- /ja/installation/quickstart/
weight: 15
---

ここでは最新のバージョンまたは[長期サポート版](https://docs.contao.org/manual/en/installation/update-contao/#long-term-support-versions)をContao Managerでインストールしたい場合を前提としています。これはもっとも簡単で初心者に推奨できる方法です。1クリックのインストールを提供しているホスティングの提供者もあります。しかし、最大の使い勝手の良さのためには、Contao Managerまたはコンソールを使用することを推奨します。

## ホスティングの構成

ホスティングサービスの提供者が用意している管理パネルでホスティング(Webサーバー)を構成します。

### ルートディレクトリ (ドキュメントルート)

通常プロバイダーはWebサイトを保存するフォルダー、これは`/www`、`/public_html`、`/httpdocs`といったフォルダーを提供します。そこにContaoをインストールできます。このパスに最初にサブフォルダー、例えば`example.com`のページには`example`を作成して、これをインストール先やプロジェクトのフォルダーとすると便利なことが判明しました。

Contaoでは、公開してアクセス可能なすべてのファイルは`/public`というサブフォルダーに配置します。`public`というフォルダーを作成して、このサブフォルダーをルートディレクトリ(ドキュメントルート)に、ホスティングサービスの提供者が用意している管理パネルで設定してください。

**例:** `example.com`は`/www/example/public`を指すようにします。

### データベース

Contaoは[MySQL](../../installation/system-requirements/#mysql-minimum-requirements)データベースをその動作に必要とし、データベースは完全に正しい方法で作成しなければなりません。
データベースの認証情報は後で必要となります。


## Contao Managerのインストール

[Contao Manager](../../installation/contao-manager/)は[contao.org](https://contao.org/en/download)からダウンロードできる単一のファイルで構成されています。
ダウンロードに成功すると、`contao-manager.phar`というファイルを取得できます。
このファイルをWebサーバーの`public`ディレクトリに転送してください。

{{% notice note %}}
すべてのホスティング提供者で`.phar`ファイルを実行できるとは限りません。
最良の互換性のためには<b>アップロードした後で</b>`.php`という拡張子を追加してください。(つまり、<b>サーバー上の</b>ファイルを`contao-manager.phar.php`と名前を変更します。)
{{% /notice %}}

## Contao Managerの呼び出し

では、`www.example.com/contao-manager.phar.php`というURLの`www.example.com`を使用されているドメインに置き換えてブラウザーでアクセスしましょう。
Contao Managerの「ようこそ!」画面が表示されるはずです。

![Contao Managerにようこそ]({{% asset "images/manual/installation/en/welcomepage-contao-manager.png" %}}?classes=shadow)

### 基本的な構成

Contaoをインストールする前に、Contao Manager自身を構成しなければなりません。
そのためにはユーザー名とパスワードを指定して、新しいユーザーを作成してください。
ユーザー名とパスワードはインストールする、Contaoのものとは無関係です!


### サーバーの構成

Contao Managerはバックグラウンドの処理を正しく行うために、PHPのバイナリのパスとその他のサーバーの情報を必要とします。
通常、これは自動的に検出します。

![サーバー構成]({{% asset "images/manual/installation/en/server-configuration.png" %}}?classes=shadow)


### Composerリゾルバークラウド

[Composerリゾルバークラウド](https://composer-resolver.cloud/)によって、例えサーバーに十分なメモリーがなくてもComposerの依存関係をインストールできます。
なお、パッケージの情報は依存奸計の怪傑のために、[Contao Association](https://association.contao.org/)のクラウドサービスに送られることに注意してください。


### Contao ManagerでContaoをインストール

基本的な構成をした後、Contaoをインストールできます。
このためには、期待するバージョンと最初の構成を選択して、「インストール」のボタンをクリックします。

選択肢として、Contaoの"[サンプルのウェブサイト](https://demo.contao.org/)"もインストールできます。

![Contao ManagerでContaoをインストール]({{% asset "images/manual/installation/en/contao-manager-setup.png" %}}?classes=shadow)

インストールはここから数分間かかることでしょう。
インストールの処理の詳細は次のアイコン![コンソール出力の表示/非表示]({{% asset "icons/konsolenausgabe.png" %}}?classes=icon)をクリックすることで表示できます。


![Contaoをインストール中]({{% asset "images/manual/installation/en/contao-manager-background-task.png" %}}?classes=shadow)


### データベースのテーブルの更新

すべてのパッケージをContao Managerがインストールできたら、次にデータベースを更新しなければなりません。
このためには[Contaoインストールツール]({{% relref "/installation/contao-installtool" %}})を使用します(Contao 4.13 LTS)。
Contao 5以降では、もうインストールツールは必要なく、データベースは[Contao Manager]({{% relref "installation/contao-manager" %}})で直接更新できます。


## 管理者アカウントの作成

最後に、後でContaoのバックエンドにログインできる管理者のユーザーを作成しなければなりません。

![管理者アカウントの作成]({{% asset "images/manual/installation/en/installtool-create-admin-account.png" %}}?classes=shadow)

**ユーザー名:** 管理者のユーザー名を入力します。

**名前:** 管理者の姓名を入力します。

**電子メールアドレス:** 管理者の電子メールアドレスを入力します。

**パスワード:** 管理者のパスワードと、その確認を入力します。

管理者ユーザーのアカウントを作成すると、Contaoのインストールは完了です。
右下のボタンのリンクからバックエンドに進めます。
そこで[最初のスタートページ](../../guides/add-first-index-page/)を作成できます。
