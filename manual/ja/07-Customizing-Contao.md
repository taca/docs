# Contaoのカスタマイズ

どのようなアプリケーションでもカスタマイズは、その重要な特徴の1つで、コンテンツ管理システムでは尚更です。Contaoは多数のオプションを提供していて、構成の調整、項目とラベルのカスタマイズ、独自のコードの断片の追加や新しい機能拡張をさらに作成をするといったことができます。Contaoのコアのファイルに殆ど変更しないで、コアの動作の殆どを制御できますので、毎回の更新の後で行った変更を再適用する必要はありません。


## 構成のカスタマイズ

Contaoの構成はシステム構成、データコンテナ構成、言語の構成の3つの部分に分かれた、1つの大きな配列に保持されています。この構成の配列は実行時に構築されて、あるページを生成するのに必要な部分だけを含んでいます。Contaoは多数の冗長な構成ファイルを解析のために時間とメモリを無駄にするといったことはしません。


### システム構成のカスタマイズ

システム構成は、様々なContaoのモジュールの`config.php`というファイルに保管しています。これをカスタマイズしたい場合は`system/config/localconfig.php`というファイルに変更を適用してください、すると次のアップデートで上書きされません。殆どのパラメターターは設定モジュールのバックエンドで設定でき、自動的にローカルの構成ファイルに書き込まれます。このため手作業で編集する必要は殆どないでしょう。

``` {.php}
// タスクセンターを無効にします。
unset($GLOBALS['BE_MOD']['profile']['tasks']);

### INSTALL TOOL START ###
$GLOBALS['TL_CONFIG']['debugMode'] = false;
$GLOBALS['TL_CONFIG']['displayErrors'] = false;
```

変更する内容を`INSTALL TOOL START`の行の前に書いているか確認してください。そうしないと設定モジュールで削除されます。そして、 **`config.php`ファイルに設定パラメーターに保存しないでください**、なぜなら更新時に上書きされる可能性があるためです!


### データコンテナ構成のカスタマイズ

Contaoは[データコンテナ配列][1]をテーブルのメタ情報の保持に使用しています。データコンテナの構成は、様々なContaoのモジュールの`dca`というフォルダーに保管されています。独自の変更は`system/config/dcaconfig.php`というファイルに適用してください、すると次の更新で上書きされません。


``` {.php}
// membersのテーブルでcompanyを必須の項目にします。
$GLOBALS['TL_DCA']['tl_member']['fields']['company']['eval']['mandatory'] =
true;

// companyの名前を英数文字だけとします。
$GLOBALS['TL_DCA']['tl_member']['fields']['company']['eval']['rgxp'] = 'alnum';

// インクルードするコンテンツ要素を管理者だけに許可します。
if (!$this->User->isAdmin)
{
    unset($GLOBALS['TL_CTE']['includes']);
}
```

既にご覧のように、`dcaconfig.php`ファイルはContaoの構成の些細な修正を保存するのに適しています。多くの変更が必要な場合は、変更内容がわらかなくなってしまわないように、独自の機能拡張にまとめることも検討すべきでしょう。


### ラベルと翻訳のカスタマイズ

ラベルと翻訳は、様々なContaoのモジュールの`languages`というフォルダーに保管しています。各言語は、その言語の[ISO-639-1 言語コード][2]で識別します。独自の変更は`system/config/langconfig.php`というファイルに適用してください、すると次の更新で上書きされません。


``` {.php}
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

もちろん言語配列の変更をカスタムモジュールにまとめることができ、変更が多岐に渡る場合に推奨する方法です


## 独自の項目の追加

ここではメンバーテーブルに顧客番号を追加することとします。Contaoのテーブルに独自の項目を追加するには複数のファイルの変更が必要となります。このため、`system/modules`というディレクトリにカスタムモジュールを作成することを推奨します。モジュールはアルファベット順に読み込まれることを忘れないでください。このため`news`拡張の設定を上書きしたい場合は、機能拡張を`custom`という名前にしてはなりません。


### データベースの拡張

データベースの構成は、様々なContaoのモジュールの`config/database.sql`というファイルに保管されています。SQLファイルをデータベースに送ることはありませんが、Contaoの仕様と実際のデータベースのテーブルの間の違いを算出するのに使用します。したがって、他のモジュールで定義されている項目を`database.sql`ファイルで改変できます。新しい項目を作成するには以下のコードを追加します:

``` {.sql}
CREATE TABLE `tl_member`(
  `customer_number` varchar(8) NOT NULL default ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
```


データベースのテーブルを更新するには、[Contaoインストールツール][3]を使用してください。


### DCAの拡張

`dca/tl_member.php`というファイルを新しいモジュールのフォルダーに作成して、新しい項目のメタデータを追加して、Contaoに処理する方法を指定します。

``` {.php}
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
    'eval'      => array('mandatory'=>true, 'rgxp'=>'digit', 'maxlength'=>8)
);
```

上記のコードの理解が難しい場合は[データコンテナ配列][1]の章を読むとよいでしょう。


### 翻訳の追加

`languages/en/tl_member.php`というファイルを新しいモジュールのフォルダーに作成して、新しい項目の英語のラベルを追加します:

``` {.php}
$GLOBALS['TL_LANG']['tl_member']['customer_number'] = array
(
    'Customer number',
    'Please enter the 8-digit customer number.'
);
```

これで"member"のモジュールに8桁の顧客番号を入力できるようになります。フォームで項目を空のままにしたり、数字以外の文字を含んでいると、Contaoは値を保存しないで代わりにエラーメッセージを表示します。


## TinyMCEのカスタマイズ

このページではリッチテキストエディターのカスタマイズして、Contaoの次の更新で上書きされないように変更を保存する方法を説明しています。Contaoは初期状態ではTinyMCEのプラグインをすべては取り込んでいないことに注意してください。このためContaoの配布に含まれていない、あるプラグインを使用したい場合は[TinyMCEのプロジェクトのウェブサイト][4]からダウンロードして`plugins/tinyMCE/plugins`というフォルダーに移してください。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/rich-text-editor.jpg)

上の画像はリッチテキストエディターの構成ファイル`system/config/tinyMCE.php`の初期状態の内容です。構成をカスタマイズするファイルを作成するには、単純にこれをコピーして名前を変更、例えば`tinyCustom.php`とします。次に、この新しいファイルを変更して保存します。最後の段階として、`system/config/dcaconfig.php`というファイルで[[データコンテナ構成][5]を調整して、Contaoにカスタマイズしたファイルを適用する項目を指定します。

``` {.php}
// テキストのコンテンツ要素に独自のリッチテキストエディタの構成を使用します。
Use the custom RTE configuration for text elements
$GLOBALS['TL_DCA']['tl_content']['fields']['text']['eval']['rte'] =
'tinyCustom';
```


## クラスメソッドのオーバーライド

ここではナビゲーションモジュールの動作を変更して、下位のページがなくてモジュールをまったく表示しない場合でも、常にモジュールを表示するようにしてみます。下位のページがない場合は、そのことをユーザーに通知する表示をします。もちろん、元のナビゲーションのクラスの殆どはそのままにするようにして、将来のアップデートで保守を不要にします。モジュールとコンテンツ要素のクラスはContaoのシステム構成で動的に割り当てられ、独自のバージョンと簡単に置き換えることができるようになっています。


### 独自のクラスの作成

既定のナビゲーションクラスの動作は、今回の目的にたいへんよく似ていますが、`generate()`メソッドが下位のページが存在しない場合にモジュールを表示しないところが違います。従って、この特定のメソッドだけ変更が必要なので、元のクラスをオーバーライドするのが最良の方法です。これを実現するには、新しく`xcustom/ModuleMyNavigation.php`というファイルを作成して、独自のクラス`ModuleMyNavigation`を定義します:

``` {.php}
// xcustom/ModuleMyNavigation.php
class ModuleMyNavigation extends ModuleNavigation
{
    public function generate()
    {
        // オリジナルのメソッドを実効
        $buffer = parent::generate();

        if (empty($buffer))
        {
            $buffer = 'There are no subpages';
        }

        return $buffer;
    }
}
```


### 独自のクラスを登録

モジュールとコンテンツ要素のクラスはContaoのシステム構成で動的に割り当てられ、独自のバージョンと簡単に置き換えられるようになっています。モジュールのクラスは広域な配列`FE_MOD`が保持しています。

``` {.php}
// xcustom/config/config.php
$GLOBALS['FE_MOD']['navigationMenu']['navigation'] = 'ModuleMyNavigation';
```

動的な構成のおかげで、次のリクエストからContaoは自動的に新しいクラスを読み込み、ナビゲーションモジュールは何も表示しない代わりに "There are no subpages"という通知を表示します。この変更はContaoの更新に対応していて、保守を必要としません。


## Contaoのフック

フックはデータコンテナ配列の[コールバック関数][6]に似た動作をします。特定のイベントに1つ異常の関数を登録でき、イベントが起きると登録した関数を実行します。フックによってコアに独自の機能を追加できます。


### activateAccount

"activateAccount"フックは新しいフロントエンドのアカウントを有効したときに動作します。フック関数はユーザーオブジェクトを引数にし、戻り値は不要です。バージョン2.4.3から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['activateAccount'][] = array('MyClass',
'myActivateAccount');

// MyClass.php
public function myActivateAccount(Database_Result $objUser)
{
    // 何か実行
}
```


### activateRecipient

"activateRecipient"フックはニュースレターの新しい宛先を追加したときに動作します。フック関数は電子メールアドレス、宛先のID、チャンネルのIDを引数にし、戻り値は不要です。バージョン2.8.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['activateRecipient'][] = array('MyClass',
'myActivateRecipient');

// MyClass.php
public function myActivateRecipient($strEmail, $arrRecipients, $arrChannels)
{
    // 何か実行
}
```


### addComment

"addComment"フックはコメントを追加したときに動作します。 フック関数はレコードのIDとデータ配列を引数にし、戻り値は不要です。バージョン2.8.2から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['addComment'][] = array('MyClass', 'myAddComment');

// MyClass.php
public function myAddComment($intId, $arrSet)
{
    // 何か実行
}
```


### addCustomRegexp

"addCustomRegexp"フックは未知の正規表現があった場合に動作します。フック関数は正規表現の名前、現在の値、ウィジェットオブジェクトを引数にし、論理値を戻り値とします。バージョン2.6.2から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['addCustomRegexp'][] = array('MyClass',
'myAddCustomRegexp');

// MyClass.php
public function myAddCustomRegexp($strRegexp, $varValue, Widget $objWidget)
{
    if ($strRegexp == 'postal')
    {
        if (!preg_match('/^0-9{4,6}$/', $varValue))
        {
            $objWidget->addError('Field ' . $objWidget->label . ' should be a postal code.');
        }

        return true;
    }

    return false;
}
```


### addLogEntry

"addLogEntry"フックは新しいログの項目を追加したときに動作します。フック関数はメッセージ、(訳注: ログの元となった)関数、アクションを引数にし、戻り値は不要です。バージョン2.8.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['addLogEntry'][] = array('MyClass', 'myAddLogEntry');

// MyClass.php
public function myAddLogEntry($strText, $strFunction, $strAction)
{
    // Do something
}
```


### checkCredentials

"checkCredentials"フックは間違ったパスワードでログインに失敗したときに動作します。フック関数はユーザー名、パスワードに加えてユーザーオブジェクトを引数にし、論理値を戻り値とします。バージョン2.6.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['checkCredentials'][] = array('MyClass',
'myCheckCredentials');

// MyClass.php
public function myCheckCredentials($strUsername, $strPassword, User $objUser)
{
    // 広域なデータベースに対して確認
    if ($this->checkGlobalDbFor($strUsername, $strPassword))
    {
        return true;
    }

    return false;
}
```


### closeAccount

"closeAccount"フックはユーザーがアカウントを廃止したときに動作します。フック関数はユーザーのID、操作モード、モジュールを引数にし、戻り値は不要です。バージョン2.8.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['closeAccount'][] = array('MyClass', 'myCloseAccount');

// MyClass.php
public function myCloseAccount($intId, $strMode, $objModule)
{
    if ($strMode == 'close_delete')
    {
        // 何か実行
    }
}
```


### compileDefinition

"compileDefinition"フックはスタイルシートの書式定義を書き込んだときに動作します。フック関数は構成配列を引数にし、文字列を戻り値とします。バージョン2.9.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['compileDefinition'][] = array('MyClass',
'myCompileDefinition');

// MyClass.php
public function myCompileDefinition($arrRow)
{
    if (isset($arrRow['border-radius']))
    {
        return "\nborder-radius:" . $arrRow['border-radius'] . ";";
    }

    return '';
}
```


### createDefinition

"createDefinition"フックはスタイルシートの書式定義をインポートしたときに動作します。フック関数はキー、値、元の書式定義、データ配列を引数にし、配列またはfalseを戻り値とします。バージョン2.9.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['createDefinition'][] = array('MyClass',
'myCreateDefinition');

// MyClass.php
public function myCreateDefinition($strKey, $strValue, $strDefinition, $arrSet)
{
    if ($strKey == 'border-radius')
    {
        return array('border-radius'=>$strValue);
    }

    return false;
}
```


### createNewUser

"createNewUser"フックはウェブサイトに新しいフロントエンドのユーザーを登録したときに動作します。フック関数は新しいユーザーのIDとデータ配列を引数とし、戻り値は不要です。バージョン2.2.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['createNewUser'][] = array('MyClass', 'myCreateNewUser');

// MyClass.php
public function myCreateNewUser($intId, $arrData)
{
    // レコードを修正
}
```


### executePreActions

"executePreActions"フックはDCAオブジェクトを必要としないAjaxのリクエストで動作します。フック関数はアクションの名前を引数とし、戻り値は不要です。バージョン2.6.1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['executePreActions'][] = array('MyClass', 'myExecutePreActions');

// MyClass.php
public function myExecutePreActions($strAction)
{
    if ($strAction == 'update')
    {
        // 何か実行
    }
}
```


### executePostActions

"executePostActions"フックはDCAオブジェクトが必要なAjaxのリクエストで動作します。フック関数はアクションの名前とデータコンテナオブジェクトを引数とし、戻り値は不要です。バージョン2.6.1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['executePostActions'][] = array('MyClass', 'myExecutePostActions');

// MyClass.php
public function myExecutePostActions($strAction, DataContainer $dc)
{
    if ($strAction == 'update')
    {
        // Do something
    }
}
```


### generateFrontendUrl

"generateFrontendUrl"フックはフロントエンドのURLを再作成したときに動作します。フック関数はページオブジェクト、パラメーター引数、デフォルトのURLを引数とし、文字列を戻り値とします。バージョン2.5.8から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['generateFrontendUrl'][] = array('MyClass', 'myGenerateFrontendUrl');

// MyClass.php
public function myGenerateFrontendUrl($arrRow, $strParams, $strUrl)
{
    return str_replace('.html', '.xml', $strUrl);
}
```


### generatePage

"generatePage"フックはメインのレイアウト(fe_page)を処理する前に動作します。フック関数はページオブジェクト、レイアウトオブジェクト、自身への参照を引数とし、戻り値は不要です。バージョン2.8.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['generatePage'][] = array('MyClass', 'myGeneratePage');

// MyClass.php
public function myGeneratePage(Database_Result $objPage, Database_Result $objLayout, PageRegular $objPageRegular)
{
    // 何か実行
}
```


### getAllEvents

"getAllEvents"フックでカレンダーとイベントモジュールの結果のセットを変更できます。フック関数は現在の結果のセット、親の項目のID、開始と終了の時刻を引数とし、結果のセット(配列)を戻り値とします。バージョン2.6.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['getAllEvents'][] = array('MyClass', 'myGetAllEvents');

// MyClass.php
public function myGetAllEvents($arrEvents, $arrCalendars, $intStart, $intEnd, Module $objModule)
{
    ksort($arrEvents);
    return $arrEvents;
}
```


### getContentElement

"getContentElement"フックはコンテンツ要素をレンダリングするときに動作します。フック関数はデータベースオブジェクトとバッファー文字列を引数とし、バッファー文字列を戻り値とします。バージョン2.9.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['getContentElement'][] = array('MyClass', 'myGetContentElement');

// MyClass.php
public function myGetContentElement(Database_Result $objElement, $strBuffer)
{
    return $strBuffer;
}
```


### getImage

"getImage"フックはサムネイルを生成したときに動作し、独自の処理を追加できます。フック関数はパス、幅と高さ、モード、キャッシュの名前、ファイルオブジェクトを引数とし、パスを戻り値とします。バージョン2.8から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['getImage'][] = array('MyClass', 'myGetImage');

// MyClass.php
public function myGetImage($image, $width, $height, $mode, $strCacheName, $objFile)
{
    return MyImage::generateThumbnail($image, $widht, $height, $mode);
}
```


### getPageIdFromUrl

"getPageIdFromUrl"フックはURLの断片を評価したときに動作します。フック関数はURLの断片を引数とし、URLの断片の配列を戻り値とします。バージョン2.5.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['getPageIdFromUrl'][] = array('MyClass', 'myGetPageIdFromUrl');

// MyClass.php
public function myGetPageIdFromUrl($arrFragments)
{
    return array_unique($arrFragments);
}
```


### getSearchablePages

"getSearchablePages"フックは検索インデックスを再構築したときに動作します。フック関数はページの配列とルートページを引数とし、完全なURL(!)の配列を戻り値とします。バージョン2.2.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['getSearchablePages'][] = array('MyClass', 'myGetSearchablePages');

// MyClass.php
public function myGetSearchablePages($arrPages, $intRoot)
{
    return array_merge($arrPages, array('Additional pages'));
}
```


### importUser

"importUser"フックはデータベースにユーザー名を見つからなかったときに動作します。フック関数はユーザー名、パスワード、テーブル名を引数とし、論理値を戻り値とします。バージョン2.7.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['importUser'][] = array('MyClass', 'myImportUser');

// MyClass.php
public function myImportUser($strUsername, $strPassword, $strTable)
{
    if ($strTable == 'tl_member')
    {
        // ユーザーをLDAPサーバーから取り込み
        if ($this->importUserFromLdap($strUsername, $strPassword))
        {
            return true;
        }
    }

    return false;
}
```


### listComments

"listComments"フックはコメントをバックエンドに一覧されるときに動作します。フック関数は現在のレコードを引数とし、文字列を戻り値とします。バージョン2.8.RC2から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['listComments'][] = array('MyClass', 'myListComments');

// MyClass.php
public function myListComments($arrRow)
{
    return '<a href="contao/main.php?do= … ">' . $arrRow['title'] . '</a>';
}
```


### loadFormField

"loadFormField"フックはフォームの項目を読み込んだときに動作します。フック関数はウィジェットのオブジェクト、フォームのID、フォームのデータを引数とし、ウィジェットのオブジェクトを戻り値とします。バージョン2.5.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['loadFormField'][] = array('MyClass', 'myLoadFormField');

// MyClass.php
public function myLoadFormField(Widget $objWidget, $strForm, $arrForm)
{
    $objWidget->class = 'myclass';
    return $objWidget;
}
```


### loadDataContainer

"loadDataContainer"フックはDCAファイルを読み込んだときに動作します。フック関数はファイル名を引数とし、戻り値は不要です。バージョン2.8.2から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['loadDataContainer'][] = array('MyClass', 'myLoadDataContainer');

// MyClass.php
public function myLoadDataContainer($strName)
{
    // 何か実行
}
```


### loadLanguageFile

"loadLanguageFile"フックは言語ファイルを読み込んだときに動作します。フック関数はファイル名と言語を引数とし、戻り値は不要です。バージョン2.8.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['loadLanguageFile'][] = array('MyClass', 'myLoadLanguageFile');

// MyClass.php
public function myLoadLanguageFile($strName, $strLanguage)
{
    // 何か実行
}
```


### outputBackendTemplate

"outputBackendTemplate"フックはバックエンドのテンプレートを画面に表示するときに動作します。フック関数はテンプレートの内容とテンプレート名を引数とし、テンプレートのコンテンツを戻り値とします。バージョン2.6.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['outputBackendTemplate'][] = array('MyClass', 'myOutputBackendTemplate');

// MyClass.php
public function myOutputBackendTemplate($strContent, $strTemplate)
{
    if ($strTemplate == 'be_main')
    {
        // 出力を修正
    }

    return $strContent;
}
```


### outputFrontendTemplate

"outputFrontendTemplate"フックはフロントエンドのテンプレートを画面に表示するときに動作します。フック関数はテンプレートの内容とテンプレート名を引数とし、テンプレートのコンテンツを戻り値とします。バージョン2.6.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['outputFrontendTemplate'][] = array('MyClass', 'myOutputFrontendTemplate');

// MyClass.php
public function myOutputFrontendTemplate($strContent, $strTemplate)
{
    if ($strTemplate == 'fe_page')
    {
        // 出力を修正
    }

    return $strContent;
}
```


### parseBackendTemplate

"parseBackendTemplate"フックはバックエンドのテンプレートを解析したときに動作します。フック関数はテンプレートの内容とテンプレート名を引数とし、テンプレートのコンテンツを戻り値とします。バージョン2.6.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['parseBackendTemplate'][] = array('MyClass', 'myParseBackendTemplate');

// MyClass.php
public function myParseBackendTemplate($strContent, $strTemplate)
{
    if ($strTemplate == 'be_main')
    {
        // 出力を修正
    }

    return $strContent;
}
```


### parseFrontendTemplate

"parseFrontendTemplate"フックはフロントエンドのテンプレートを解析したときに動作します。フック関数はテンプレートの内容とテンプレート名を引数とし、テンプレートのコンテンツを戻り値とします。バージョン2.6.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['parseFrontendTemplate'][] = array('MyClass', 'myParseFrontendTemplate');

// MyClass.php
public function myParseFrontendTemplate($strContent, $strTemplate)
{
    if ($strTemplate == 'ce_text')
    {
        // 出力を修正
    }

    return $strContent;
}
```


### postDownload

"postDownload"フックはダウンロードや複数ダウンロードといったコンテンツ要素で、ファイルがダウンロードした後で動作します。フック関数はファイル名を引数とし、戻り値は不要です。バージョン2.4.6から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['postDownload'][] = array('MyClass', 'myPostDownload');

// MyClass.php
public function myPostDownload($strFile)
{
    // 何か実行
}
```


### postLogin

"postLogin"フックはユーザーがフロントエンドにログインした後で動作します。フック関数はユーザーオブジェクトを引数とし、戻り値は不要です。バージョン2.4.3から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['postLogin'][] = array('MyClass', 'myPostLogin');

// MyClass.php
public function myPostLogin(User $objUser)
{
    // 何か実行
}
```


### postLogout

"postLogout"フックはユーザーがフロントエンドからログアウトした後で動作します。フック関数はユーザーオブジェクトを引数とし、戻り値は不要です。バージョン2.4.3から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['postLogout'][] = array('MyClass', 'myPostLogout');

// MyClass.php
public function myPostLogout(User $objUser)
{
    // 何か実行
}
```


### postUpload

"postUpload"フックはユーザーがバックエンドで1つ以上のファイルをアップロードした後で動作します。フック関数はファイル名の配列を引数とし、戻り値は不要です。バージョン2.6.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['postUpload'][] = array('MyClass', 'myPostUpload');

// MyClass.php
public function myPostUpload($arrFiles)
{
    // 何か実行
}
```


### printArticleAsPdf

"printArticleAsPdf"フックはアーティクルをPDFとしてエクスポートするときに動作します。フック関数はアーティクルのテキストとアーティクルのオブジェクトを引数とし、戻り値は不要です。バージョン2.8.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['printArticleAsPdf'][] = array('MyClass', 'myPrintArticleAsPdf');

// MyClass.php
public function myPrintArticleAsPdf($strArticle, Database_Result $objArticle)
{
    // 何か実行
    exit;
}
```


### processFormData

"processFormData"フックはフォームが提出された後で動作します。フック関数はデータ配列、データコンテナ配列、ファイル配列を引数とし、戻り値は不要です。バージョン2.4.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['processFormData'][] = array('MyClass', 'myProcessFormData');

// MyClass.php
public function myProcessFormData($arrPost, $arrForm, $arrFiles)
{
    // 何か実行
}
```


### removeOldFeeds

"removeOldFeeds"フックは古いXMLファイルをContaoのディレクトリから削除するときに動作します。フック関数に引数はなく、保存するファイル名の配列を戻り値とします。バージョン2.5.8から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['removeOldFeeds'][] = array('MyClass', 'myRemoveOldFeeds');

// MyClass.php
public function myRemoveOldFeeds()
{
    return array('custom.xml');
}
```


### removeRecipient

"removeRecipient"フックはニュースレターの宛先を削除するときに動作します。フック関数は電子メールアドレス、チャンネルのIDを引数とし、戻りは不要です。バージョン2.8.RC1から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['removeRecipient'][] = array('MyClass', 'myRemoveRecipient');

// MyClass.php
public function myRemoveRecipient($strEmail, $arrChannels)
{
    // 何か実行
}
```


### replaceInsertTags

"replaceInsertTags"フックは未知の挿入タグがあった場合に動作します。フック関数は挿入タグを引数とし、置き換えた値かfalseを戻り値とします。バージョン2.6.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['replaceInsertTags'][] = array('MyClass', 'myReplaceInsertTags');

// MyClass.php
public function myReplaceInsertTags($strTag)
{
    if ($strTag == 'mytag')
    {
        return 'mytag replacement';
    }

    return false;
}
```


### reviseTable

"reviseTable"フックはContaoがテーブルから親のいないレコードを削除するときに動作します。フック関数は現在のテーブル、新しいレコードのID、親のテーブルの名前、すべての子のテーブルを引数とし、論理値を戻り値とします(trueを返すと現在のページを再読み込みすることになります)。バージョン2.6.4から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['reviseTable'][] = array('MyClass', 'myReviseTable');

// MyClass.php
public function myReviseTable($table, $new_records, $parent_table, $child_tables)
{
    // 何か実行
}
```


### setNewPassword

"setNewPassword"フックは新しいパスワードを設定した後で動作します。フック関数はユーザーオブジェクトと暗号化したパスワードを引数とし、戻り値は不要です。バージョン2.2.3から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['setNewPassword'][] = array('MyClass', 'mySetNewPassword');

// MyClass.php
public function mySetNewPassword($objUser, $strPassword)
{
    // 何か実行
}
```


### validateFormField

"validateFormField"フックはフォームの項目が提出されたときに動作します。フック関数はウィジェットのオブジェクト、フォームのIDを引数とし、ウィジェットのオブジェクトを戻り値とします。バージョン2.5.0から利用可能です。

``` {.php}
// config.php
$GLOBALS['TL_HOOKS']['validateFormField'][] = array('MyClass', 'myValidateFormField');

// MyClass.php
public function myValidateFormField(Widget $objWidget, $intId)
{
    if ($objWidget instanceof FormPassword)
    {
        // 何か実行
    }

    return $objWidget;
}
```


[1]: 06-Data-Container-Arrays.md
[2]: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
[3]: 01-Installation.md#the-contao-install-tool
[4]: http://tinymce.moxiecode.com
[5]: 07-Customizing-Contao.md#customizing-the-data-container-configuration
[6]: 06-Data-Container-Arrays.md#callbacks
