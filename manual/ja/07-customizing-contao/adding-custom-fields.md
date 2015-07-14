## 独自の項目の追加

ここではメンバーのテーブルに顧客番号を追加することとします。Contaoのテーブルに独自の項目を追加するには複数のファイルの変更が必要となります。このため、`system/modules`というディレクトリにカスタムモジュールを作成することを推奨します。モジュールはアルファベット順に読み込まれることを忘れないでください。このため`news`拡張の設定を上書きしたい場合は、機能拡張を`custom`という名前にしてはなりません。


### DCAの拡張

`dca/tl_member.php`というファイルを新しいモジュールのフォルダーに作成して、新しい項目のメタデータを追加して、Contaoに処理する方法を指定します。

Contao 3からはDCAの`sql`で、直接対応する項目とデータベースの構成を指定できるようになりました。SQLの詳細は直接データベースに送りませんが、Contaoの仕様と実際のデータベースのテーブルの違いを計算するために使用します。

```php
// パレットを修正
$GLOBALS['TL_DCA']['tl_member']['palettes']['default'] = str_replace
(
    'company',
    'customer_number,company',
    $GLOBALS['TL_DCA']['tl_member']['palettes']['default']
);

// 項目のメタデータを追加
$GLOBALS['TL_DCA']['tl_member']['fields']['customer_number'] = array
(
    'label'     => &amp;$GLOBALS['TL_LANG']['tl_member']['customer_number'],
    'exclude'   => true,
    'inputType' => 'text',
    'eval'      => array('mandatory'=>true, 'rgxp'=>'digit', 'maxlength'=>8),
    'sql'       => "varchar(8) NOT NULL default ''"
);
```

上記のコードの理解が難しい場合は[データコンテナ配列][1]の章を読むとよいでしょう。

DCAの項目の追加や修正をした後、データベースのテーブルを更新するために[Contaoインストールツール][3]にアクセスする必要があります。


### 翻訳の追加

`languages/en/tl_member.php`というファイルを新しいモジュールのフォルダーに作成して、新しい項目の英語のラベルを追加します:

```php
$GLOBALS['TL_LANG']['tl_member']['customer_number'] = array
(
    'Customer number',
    'Please enter the 8-digit customer number.'
);
```

これで"member"のモジュールに8桁の顧客番号を入力できるようになります。フォームで項目を空のままにしたり、数字以外の文字を含んでいると、Contaoは値を保存せずに代わりにエラーメッセージを表示します。


[1]: ../06-data-container-arrays/README.md
[2]: ../01-installation/installing-contao.md#the-contao-install-tool
