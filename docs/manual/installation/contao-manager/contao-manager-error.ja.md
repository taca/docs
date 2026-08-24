---
title: 'Contao Managerのエラー'
description: ''
url: "installation/contao-manager-error"
aliases:
    - /ja/installation/contao-manager-error/
---

## Contao Managerにアクセスできません

1つのファイルであるContao Managerを[contao.org](https://contao.org/de/download.html)からダウンロードして、Webサーバーの`public`ディレクトリに、`contao-manager.phar.php`というファイルを転送しました。

ダウンロードした`contao-manager.phar.php`というファイルはPHPスクリプトで、必要なファイルをバックグラウンドでダウンロードして自身を書き換えます。

しかし、`www.example.com/contao-manager.phar.php`というURLにアクセスしても、Contaoの開始ページを表示しません。

この場合、[`.phar`ファイル](https://download.contao.org/contao-manager.phar)を直接アップロードしてみてください。


{{% notice note %}}
すべてのホスティング提供者で`.phar`ファイルは実効できるとは限りません。最大限の互換性のためには、ファイルの拡張子として`.php`を追加(最終的なファイル名: `contao-manager.phar.php`)してください。
{{% /notice %}}

{{% notice warning %}}
ほとんどのFTPプログラムは`.php`ファイルをバイナリモードではなくテキストモードで転送し、この結果Contao Managerのファイルを破壊します。
そのため、ファイルの拡張子`.php`をアップロードした後で追加してください。
{{% /notice %}}