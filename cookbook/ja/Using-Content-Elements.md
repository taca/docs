# 独自の機能拡張でコンテンツ要素を使用

Contao 3.0以降ではコアのニュースやカレンダー拡張のように、独自の機能格調でコンテンツ要素を使用できます。

これによってアーティクルの中での柔軟性全体を、あなたのアプリケーションの他の部分に提供できます。

このクックブックの項目のため、ニュースモジュールを参考として採り上げます。

以下の3つの段階が、行う必要があるすべてす:

1. `tl_content`を現在のDCAの子のテーブルとして定義します。

    ``` {.php}
    // system/modules/news/dca/tl_news.php
    
    /**
     * Table tl_news
     */
    $GLOBALS['TL_DCA']['tl_news'] = array
    (
        // Config
        'config' => array
        (
            [...]
            'ctable'                      => array('tl_content'),
    ```

2. `tl_content`のDCAで親のテーブルを動的に設定します。

    ``` {.php}
    // system/modules/news/dca/tl_content.php
    
    /**
     * Dynamically add parent table
     */
    if (\Input::get('do') == 'news')
    {
        $GLOBALS['TL_DCA']['tl_content']['config']['ptable'] = 'tl_news';
    }
    ```

3. 編集のリンクを`tl_content`テーブルに振り向けます。

    この代わりに、

    ``` {.php}
    // system/modules/news/dca/tl_news.php
    'edit' => array
    (
        'label'               => &$GLOBALS['TL_LANG']['tl_news']['edit'],
        'href'                => 'act=edit',
        'icon'                => 'edit.gif'
    ),
    ```

    これからは以下を使用しなければなりません。

    ``` {.php}
    // system/modules/news/dca/tl_news.php
    'edit' => array
    (
        'label'               => &$GLOBALS['TL_LANG']['tl_news']['edit'],
        'href'                => 'table=tl_content',
        'icon'                => 'edit.gif'
    ),
    ```

以上です。これで独自のDCAの中でコンテンツ要素を使用できます。


## フロントエンドモジュールでコンテンツ要素の取り出し

参考までに、Contaoは`ContentModel`の中にヘルパーメソッドを用意していて、関係するコンテンツ要素を簡単に取り出せます:

``` {.php}
$strContent = '';

$objElements = \ContentModel::findPublishedByPidAndTable($objNews->id, 'tl_news');

if ($objElements !== null)
{
    while ($objElements->next())
    {
        // Controller::getContentElement()
        $strContent .= $this->getContentElement($objElements->id);
    }
}

// ここですべての生成したコンテンツ要素の文字列を含んでいます。
echo $strContent;
```
