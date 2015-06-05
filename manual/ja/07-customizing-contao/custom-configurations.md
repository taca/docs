## 構成のカスタマイズ

Contaoの構成はシステム構成、データコンテナ構成、言語の構成の3つの部分に分かれた、1つの大きな配列に保持されています。この構成の配列は実行時に構築されて、あるページを生成するのに必要な部分だけを含んでいます。Contaoは多数の冗長な構成ファイルを解析のために時間とメモリを無駄にするといったことはしません。


### システム構成のカスタマイズ

システム構成は、様々なContaoのモジュールの`config.php`というファイルに保管しています。これをカスタマイズしたい場合は`system/config/localconfig.php`というファイルに変更を適用してください、すると次のアップデートで上書きされません。殆どのパラメターターは設定モジュールのバックエンドで設定でき、自動的にローカルの構成ファイルに書き込まれます。このため手作業で編集する必要は殆どないでしょう。

```php
// 機能拡張作成を無効にします。
unset($GLOBALS['BE_MOD']['devtools']['extension']);

### INSTALL SCRIPT START ###
$GLOBALS['TL_CONFIG']['debugMode'] = false;
$GLOBALS['TL_CONFIG']['displayErrors'] = false;
```

変更する内容を`INSTALL SCRIPT START`の行の前に書いているか確認してください。そうしないと設定モジュールで削除されます。そして、 **`config.php`ファイルに設定パラメーターに保存しないでください**。なぜなら、このファイルは更新時に上書きされる可能性があるためです!


### データコンテナ構成のカスタマイズ

Contaoは[データコンテナ配列][1]をテーブルのメタ情報の保持に使用しています。データコンテナの構成は、様々なContaoのモジュールの`dca`というフォルダーに保管されています。独自の変更は`system/config/dcaconfig.php`というファイルに適用してください、すると次の更新で上書きされません。

```php
// membersのテーブルでcompanyを必須の項目にします。
$GLOBALS['TL_DCA']['tl_member']['fields']['company']['eval']['mandatory'] =
true;

// companyの名前を英数文字だけとします。
$GLOBALS['TL_DCA']['tl_member']['fields']['company']['eval']['rgxp'] = 'alnum';

// インクルードするコンテント要素を管理者だけに許可します。
if (!BackendUser::getInstance()->isAdmin)
{
    unset($GLOBALS['TL_CTE']['includes']);
}
```

既にご覧のように、`dcaconfig.php`ファイルはContaoの構成の些細な修正を保存するのに適しています。多くの変更が必要な場合は、変更内容がわらかなくなってしまわないように、独自の機能拡張にまとめることも検討すべきでしょう。


### ラベルと翻訳のカスタマイズ

ラベルと翻訳は、様々なContaoのモジュールの`languages`というフォルダーに保管しています。各言語は、その言語の[ISO-639-1 言語コード][2]で識別します。独自の変更は`system/config/langconfig.php`というファイルに適用してください、すると次の更新で上書きされません。

```php
// ラベルをすべての言語で変更します。
$GLOBALS['TL_LANG']['MSC']['goBack'] = '«';

// 特定の言語だけでラベルを変更します。
if ($GLOBALS['TL_LANGUAGE'] == 'de')
{
    $GLOBALS['TL_LANG']['tl_layout']['column'] = 'Bereich';
}
elseif ($GLOBALS['TL_LANGUAGE'] == 'fr')
{
    $GLOBALS['TL_LANG']['tl_layout']['column'] = 'Section';
}
```

もちろん言語配列の変更をカスタムモジュールにまとめることができ、変更が多岐に渡る場合に推奨される方法です。


[1]: ../06-data-container-arrays/README.md
[2]: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
