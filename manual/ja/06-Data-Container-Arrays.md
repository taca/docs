# データコンテナ配列

データコンテナ配列(DCA)はテーブルのメタデータの格納に使用します。それぞれのDCAは特定のテーブルについて、その設定、他のテーブルとの関係、その項目を記述します。Contaoのコアのエンジンは、このメタデータでレコードを一覧する方法、バックエンドのフォームの表示方法、データを保存する方法を決定します。すべての有効なモジュールのDCAファイルは順々に("backend"と"frontend"から始めて、その後にアルファベットの順番で)読み込んでいくので、それぞれのモジュールは既存の構成を上書きできます。`system/config/dcaconfig.php`のファイルは最後に読み込まれます。


## リファレンス

データコンテナ配列は6つのセクションから構成されています。最初のセクションは他のテーブルとの関係のような一般的なテーブルの構成を保持しています。 第2と第3のセクションはレコードを一覧表示する方法とユーザーに実行を許可する操作を定義しています。第4のセクションは「パレット」と呼ばれるフォームの入力項目の異なるグループを定義し、最後の2つのセクションは入力項目の詳細を記述しています。


### テーブルの構成

テーブルの構成はテーブル自身、すなわちデータを保持するのに使用するデータコンテナの種類や他のテーブルとの関係を記述します。また、バージョン管理を有効にしたり、データを編集や削除を行ったときに子のレコードに起こすことを定義できます。

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>label</td>
  <td><code>&amp;$GLOBALS['TL_LANG']</code> (<code>string</code>)</td>
  <td>labelはページやファイルツリーで使用し、一般に言語配列の参照を含んでいます。</td>
</tr>
<tr>
  <td>ptable</td>
  <td>親のテーブル (<code>string</code>)</td>
  <td>親のテーブルに関連した名前です。(table.pid = ptable.id).</td>
</tr>
<tr>
  <td>ctable</td>
  <td>子のテーブル (<code>array</code>)</td>
  <td>子のテーブルに関連した名前です。(table.id = ctable.pid).</td>
</tr>
<tr>
  <td>dataContainer</td>
  <td>データコンテナ (<code>string</code>)</td>
  <td>Table (データベースのテーブル)、File (ローカルの設定ファイル)、Folder (ファイルマネージャー)のいずれかです。</td>
</tr>
<tr>
  <td>closed</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、テーブルにさらにレコードを追加できません。</td>
</tr>
<tr>
  <td>notEditable</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、このテーブルは編集できません。</td>
</tr>
<tr>
  <td>switchToEdit</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>新しいレコードを追加するときに「保存して編集」のボタンを有効にします。(並べ替えモード4だけ)</td>
</tr>
<tr>
  <td>enableVersioning</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、Contaoは新しいバージョンを作成するときに古いバージョンを保存します。</td>
</tr>
<tr>
  <td>doNotCopyRecords</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、Contaoは親のテーブルのレコードを複製するとき、このテーブルのレコードを複製しません。</td>
</tr>
<tr>
  <td>doNotDeleteRecords</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、Contaoは親のテーブルのレコードを削除するとき、このテーブルのレコードを削除しません。</td>
</tr>
<tr>
  <td>onload_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>データコンテナを初期化したときに、データコンテナオブジェクトを引数にしてカスタム関数を呼び出します。</td>
</tr>
<tr>
  <td>onsubmit_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>レコードを更新した後で、データコンテナオブジェクトを引数にしてカスタム関数を呼び出します。</td>
</tr>
<tr>
  <td>ondelete_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>レコードを削除したときに、データコンテナオブジェクトを引数にしてカスタム関数を呼び出します。</td>
</tr>
<tr>
  <td>oncut_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>レコードを複製したときに、挿入するIDとデータコンテナオブジェクトを引数に
てカスタム関数を呼び出します。バージョン2.8.2で追加しました。</td>
</tr>
<tr>
  <td>onversion_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>レコードの新しいバージョンを作成したときに、テーブル、挿入するID、DataContainerオブジェクトを引数にカスタム関数を呼び出します。</td>
</tr>
<tr>
  <td>onrestore_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>レコードのバージョンを復元したときに、挿入するID、テーブル、データ配列、バージョンを引数にカスタム関数を呼び出します。</td>
</tr>
<tr>
  <td>oncopy_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>レコードを複製したときに、挿入したIDとデータコンテナオブジェクトを引数にしてカスタム関数を呼び出します。バージョン2.8.2で追加しました。</td>
</tr>
<tr>
  <td>sql</td>
  <td>テーブル構成 (<code>array</code>)</td>
  <td>テーブルの構成を記述します。例:
  <code>'keys' => array
  		(
				'id' => 'primary',
				'pid' => 'index'
			)</code></td>
</tr>
</table>


### レコードの一覧

listの配列はレコードを一覧表示する方法を定義します。Contaoのコアのエンジンは3つの異なる[ビュー][1]: リストビュー、ペアレントビュー、ツリービューをサポートしています。フィルダーやデフォルトの並べ替え順序といった、様々な並べ替えのオプションの設定や、カスタムラベルの追加ができます。


#### 並べ替え(sorting)

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>mode</td>
  <td>並べ替えのモード (<code>integer</code>)</td>
  <td><b>0</b> レコードを並べ替えない<br>
      <b>1</b> レコードを固定した項目で並べ替え<br>
      <b>2</b> レコードを切り替えできる項目で並べ替え<br>
      <b>3</b> レコードを親のテーブルで並べ替え<br>
      <b>4</b> 親のレコードの子のレコードを表示
      (スタイルシートモジュールを参照)<br>
      <b>5</b> レコードをツリー表示 (サイト構造を参照)<br>
      <b>6</b> 子のレコードをツリー構造の中に表示
      (アーティクルモジュールを参照)</td>
</tr>
<tr>
  <td>flag</td>
  <td>並べ替えのフラッグ (<code>integer</code>)</td>
  <td><b>1</b> 最初の1文字で昇順に並べ替え<br>
      <b>2</b> 最初の1文字で降順に並べ替え<br>
      <b>3</b> 最初の2文字で渉儒に並べ替え<br>
      <b>4</b> 最初の2文字で降順に並べ替え<br>
      <b>5</b> 日で昇順に並べ替え<br>
      <b>6</b> 日で降順に並べ替え<br>
      <b>7</b> 月で昇順に並べ替え<br>
      <b>8</b> 月で降順に並べ替え<br>
      <b>9</b> 年で昇順に並べ替え<br>
      <b>10</b> 年で降順に並べ替え<br>
      <b>11</b> 昇順に並べ替え<br>
      <b>12</b> 降順に並べ替え</td>
</tr>
<tr>
  <td>panelLayout</td>
  <td>パネルの配置 (<code>string</code>)</td>
  <td><b>search</b> レコードを検索するメニューを表示<br>
      <b>sort</b> レコードを並べ替えるメニューを表示<br>
      <b>filter</b> レコードをフィルターするメニューを表示<br>
      <b>limit</b> レコードのメニューを限定して表示します。<br>
      <br>オプションはsort,filter;search,limitのように、コンマ(= スペース)とセミコロン(= 改行)で区切ります。</td>
</tr>
<tr>
  <td>fields</td>
  <td>並べ替えの初期値 (<code>array</code>)</td>
  <td>テーブルの並べ替えに使用する1つ以上の項目です。</td>
</tr>
<tr>
  <td>headerFields</td>
  <td>ヘッダーの項目 (<code>array</code>)</td>
  <td>ヘッダーの要素に表示する1つ以上の項目です。
  (並べ替えモード4だけ)</td>
</tr>
<tr>
  <td>icon</td>
  <td>ツリーのアイコン (<code>string</code>)</td>
  <td>ツリーの最上部に表示するアイコンのパスです。(並べ替えモード5と6だけ)</td>
</tr>
<tr>
  <td>root</td>
  <td>rootのノード (<code>array</code>)</td>
  <td>rootのレコード(ページマウント)のIDです。この値は通常、rootのノード自身が管理します。</td>
</tr>
<tr>
  <td>filter</td>
  <td>問い合わせフィルター (<code>array</code>)</td>
  <td>独自のフィルターを追加できます。例: <code>array('status=?', 'active')</code></td>
</tr>
<tr>
  <td>disableGrouping</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>リストビューとペアレントビューで、グループのヘッダーを無効にできます。</td>
</tr>
<tr>
  <td>paste_button_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>通常の貼り付けボタンを表示する代わりに、この関数を呼び出します。
  <code>array('Class', 'Method')</code>として指定してください。</td>
</tr>
<tr>
  <td>child_record_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>子の要素を表示するため、この関数を呼び出します(並べ替えモード4だけ)。
  <code>array('Class', 'Method')</code>として指定してください。</td>
</tr>
<tr>
  <td>child_record_class</td>
  <td>CSSのクラス (<code>string</code>)</td>
  <td>ペアレントビューの要素にCSSのクラスを追加できます。</td>
</tr>
</table>


#### ラベル(label)

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>fields</td>
  <td>項目 (<code>array</code>)</td>
  <td>リストに表示する1つ以上の項目です。</td>
</tr>
<tr>
  <td>format</td>
  <td>書式文字列 (<code>string</code>)</td>
  <td>項目の書式整形に使用するHTMLの文字列です。
  (例: <code><strong>%s</strong></code>)</td>
</tr>
<tr>
  <td>maxCharacters</td>
  <td>文字数 (<code>integer</code>)</td>
  <td>ラベルの最大の文字数です。</td>
</tr>
<tr>
  <td>group_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>通常のグループのヘッダーの代わりに呼び出す独自の関数です。</td>
</tr>
<tr>
  <td>label_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>通常のラベルの関数の代わりに呼び出す独自の関数です。</td>
</tr>
</table>


### 操作

操作の配列は2つのセクションに分かれています。全体的な操作は(複数を変更のような)一度にすべてのレコードに関係し、通常の操作は(レコードの変更や削除といった)特定のレコードだけに関係します。


#### 全体的な操作(global_operations)

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>label</td>
  <td><code>&amp;$GLOBALS['TL_LANG']</code> (<code>string</code>)</td>
  <td>ボタンのラベルです。一般的にグローバルな言語配列の参照です。</td>
</tr>
<tr>
  <td>href</td>
  <td>URLの断片 (<code>string</code>)</td>
  <td>URLの断片はボタンがクリックされたときに追加するURIの文字列です。
  (例: <code>act=editAll</code>)</td>
</tr>
<tr>
  <td>class</td>
  <td>CSSのクラス (<code>string</code>)</td>
  <td>ボタンのCSSのクラス属性です。</td>
</tr>
<tr>
  <td>attributes</td>
  <td>追加の属性 (<code>string</code>)</td>
  <td>イベントハンドラーやスタイルの定義といった、追加の属性です。</td>
</tr>
<tr>
  <td>button_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>通常のボタンの関数を使用する代わりに呼び出す独自の関数です。
  <code>array('Class', 'Method')</code>として指定してください。</td>
</tr>
</table>


#### 通常の操作(operations)

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>label</td>
  <td><code>&amp;$GLOBALS['TL_LANG']</code> (<code>string</code>)</td>
  <td>ボタンのラベルです。一般的にグローバルな言語配列の参照です。</td>
</tr>
<tr>
  <td>href</td>
  <td>URLの断片 (<code>string</code>)</td>
  <td>URLの断片はボタンがクリックされたときに追加するURIの文字列です。
  (例: <code>act=edit</code>)</td>
</tr>
<tr>
  <td>icon</td>
  <td>アイコン (<code>string</code>)</td>
  <td>アイコンのパスとファイル名です。</td>
</tr>
<tr>
  <td>attributes</td>
  <td>追加の属性 (<code>string</code>)</td>
  <td>イベントハンドラーやスタイルの定義といった、追加の属性です。</td>
</tr>
<tr>
  <td>button_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>通常のボタンの関数を使用する代わりに呼び出す独自の関数です。
  <code>array('Class', 'Method')</code>として指定してください。</td>
</tr>
</table>


### 項目

fieldsの配列は表のカラムを定義します。これらの設定によって、Contaoのコアのエンジンは読み込むフォームの項目の種類、特定の項目がユーザーにアクセスを許可しているか、項目を並べ替えやフィルターの条件に使用できるかどうかを決定します。

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>label</td>
  <td><code>&amp;$GLOBALS['TL_LANG']</code> (<code>string</code>)</td>
  <td>フォームの項目のラベルです。一般的にグローバルな言語配列の参照です。</td>
</tr>
<tr>
  <td>default</td>
  <td>初期値 (<code>mixed</code>)</td>
  <td>新しいレコードを作成する時に初期値として設定する値です。</td>
</tr>
<tr>
  <td>exclude</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目を非管理者からは除外します。ユーザーグループのモジュール(の許可する項目)で有効にできます。</td>
</tr>
<tr>
  <td>search</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目を検索のメニューに含めます。(並べ替えのレコード → "panelLayout"を参照)</td>
</tr>
<tr>
  <td>sorting</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目を並べ替えのメニューに含めます。(並べ替えのレコード → "panelLayout"を参照)</td>
</tr>
<tr>
  <td>filter</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目をフィルターのメニューに含めます。(並べ替えのレコード → "panelLayout"を参照)</td>
</tr>
<tr>
  <td>flag</td>
  <td>並べ替えのモード (<code>integer</code>)</td>
  <td><b>1</b> 最初の1文字で昇順に並べ替え<br>
      <b>2</b> 最初の1文字で降順に並べ替え<br>
      <b>3</b> 最初のX文字で昇順に並べ替え(lengthを参照)<br>
      <b>4</b> 最初のX文字で降順に並べ替え(lengthを参照)<br>
      <b>5</b> 日で昇順に並べ替え<br>
      <b>6</b> 日で降順に並べ替え<br>
      <b>7</b> 月で昇順に並べ替え<br>
      <b>8</b> 月で降順に並べ替え<br>
      <b>9</b> 年で昇順に並べ替え<br>
      <b>10</b> 年で降順に並べ替え<br>
      <b>11</b> 昇順に並べ替え<br>
      <b>12</b> 降順に並べ替え</td>
</tr>
<tr>
  <td>length</td>
  <td>並べ替えの長さ (<code>integer</code>)</td>
  <td>並べ替えのグループの作成に使用する文字の数を(flagの3と4で)指定します。</td>
</tr>
<tr>
  <td>inputType</td>
  <td>項目の種類 (<code>string</code>)</td>
  <td><b>text</b> テキスト入力<br>
      <b>password</b> パスワード入力<br>
      <b>textarea</b> テキストエリア<br>
      <b>select</b> ドロップダウンメニュー<br>
      <b>checkbox</b> チェックボックス<br>
      <b>radio</b> ラジオボタン<br>
      <b>radioTable</b> 画像とラジオボタンのある表<br>
      <b>inputUnit</b> 小さな単位のドロップダウンメニューのあるテキスト入力<br>
      <b>trbl</b> 小さな単位のドロップダウンメニューのある4つのテキスト入力<br>
      <b>chmod</b> CHMODの表<br>
      <b>pageTree</b> ページツリー<br>
      <b>fileTree</b> ファイルツリー<br>
      <b>tableWizard</b> テーブルウィザード<br>
      <b>listWizard</b> 箇条書きウィザード<br>
      <b>optionWizard</b> オプションウィザード<br>
      <b>moduleWizard</b> モジュールウィザード<br>
      <b>checkboxWizard</b> チェックボックスウィザード</td>
</tr>
<tr>
  <td>options</td>
  <td>オプション (<code>array</code>)</td>
  <td>ドロップダウンメニューやラジオボタンメニューのオプションです。</td>
</tr>
<tr>
  <td>options_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>オプションの配列を返すコールバック関数です。
  <code>array('Class', 'Method')</code>として指定してください。</td>
</tr>
<tr>
  <td>foreignKey</td>
  <td>テーブル.項目 (<code>string</code>)</td>
  <td>オプションをデータベースのテーブルから得ます。IDをキー、値として指定した項目を返します。</td>
</tr>
<tr>
  <td>reference</td>
  <td><code>&amp;$GLOBALS['TL_LANG']</code> (<code>string</code>)</td>
  <td>オプションのラベルを保持する配列です。一般にグローバルな言語配列の参照です。</td>
</tr>
<tr>
  <td>explanation</td>
  <td><code>&amp;$GLOBALS['TL_LANG']</code> (<code>string</code>)</td>
  <td>説明を保持する配列です。一般にグローバルな言語配列の参照です。</td>
</tr>
<tr>
  <td>input_field_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>通常の項目の入力を処理を使用する代わりに呼び出す独自の関数で、データコンテナのオブジェクトをlabelを引数にします。</td>
</tr>
<tr>
  <td>eval</td>
  <td>項目の構成 (<code>array</code>)</td>
  <td>様々な構成のオプションです。次の項を参照してください。</td>
</tr>
<tr>
  <td>wizard</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>独自の関数を呼び出して、その戻り値を項目の入力に追加します。
  <code>array('Class', 'Method')</code>として指定してください。</td>
</tr>
<tr>
  <td>load_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>項目を読み込んだときに、これらの関数を呼び出します。<code>array('Class', 'Method')</code>として、それぞれのコールバック関数を指定してください。項目の値とデータコンテナを引数とし、項目の値を戻り値とします。</td>
</tr>
<tr>
  <td>save_callback</td>
  <td>コールバック関数 (<code>array</code>)</td>
  <td>項目を保存したときに、これらの関数を呼び出します。<code>array('Class', 'Method')</code>として、それぞれのコールバック関数を指定してください。項目の値とデータコンテナを引数とし、項目の値を戻り値とします。エラーメッセージを表示するには例外を投げます。</td>
</tr>
</table>


### 評価

評価の配列は特定の項目の詳細を構成します。例えば、必須の項目の作成、日付選択の追加、テキストエリアの行と列の指定ができます。また、項目の外観を修正したり、データの暗号化を有効にするとこともできます。各項目は正規表現で検証できます。

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>helpwizard</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、ヘルプウィザードのアイコンを項目のラベルの次に表示します。</td>
</tr>
<tr>
  <td>mandatory</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目の入力を必須とします。</td>
</tr>
<tr>
  <td>maxlength</td>
  <td>最大の長さ (<code>integer</code>)</td>
  <td>この項目に可能な最大の文字数です。</td>
</tr>
<tr>
  <td>minlength</td>
  <td>最小の長さ (<code>integer</code>)</td>
  <td>入力しなければならない最小の文字数です。</td>
</tr>
<tr>
  <td>fallback</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目はテーブルに対して一度だけ割り当てできます。</td>
</tr>
<tr>
  <td>rgxp</td>
  <td>正規表現 (<code>string</code>)</td>
  <td>
    <table>
        <tr>
          <td><b>alias</b></td>
          <td>有効なエイリアスを必要にします。</td>
        </tr>
        <tr>
          <td><b>alnum</b></td>
          <td>英数字だけを許可します。(ピリオド [.]、マイナス [-]、下線 [_]、スペース [ ]を含みます。)</td>
        </tr>
        <tr>
          <td><b>alpha</b></td>
          <td>英字だけを許可します。(ピリオド [.]、マイナス [-]、スペース [ ]を含みます。)</td>
        </tr>
        <tr>
          <td><b>date</b></td>
          <td>有効な日付を必要にします。</td>
        </tr>
        <tr>
          <td><b>datim</b></td>
          <td>有効な日付と時刻を必要にします。</td>
        </tr>
        <tr>
          <td><b>digit</b></td>
          <td>数字だけを許可します。(ピリオド [.]、マイナス [-]を含みます。)</td>
        </tr>
        <tr>
          <td><b>email</b></td>
          <td>有効な電子メールアドレスを必要にします。</td>
        </tr>
        <tr>
          <td><b>emails</b></td>
          <td>有効な電子メールアドレスのリストを必要にします。</td>
        </tr>
        <tr>
          <td><b>extnd</b></td>
          <td><code>#&amp;()/&lt;=&gt;</code>の文字を禁止します。</td>
        </tr>
        <tr>
          <td><b>folderalias</b></td>
          <td>有効なフォルダーのURLのエイリアスを必要にします。</td>
        </tr>
        <tr>
          <td><b>friendly</b></td>
          <td>電子メールアドレスの有効な "氏名" の形式を必要にします。</td>
        </tr>
        <tr>
          <td><b>language</b></td>
          <td>有効な言語コードを必要にします。</td>
        </tr>
        <tr>
          <td><b>locale</b></td>
          <td>有効なロケールを必要にします。(例 "de-CH")</td>
        </tr>
        <tr>
          <td><b>phone</b></td>
          <td>有効な電話番号を必要にします。(数字、スペース [ ]、プラス[+]、マイナス [-]、括弧 [()]、スラッシュ [/]を含みます。)</td>
        </tr>
        <tr>
          <td><b>prcnt</b></td>
          <td>0から100の間の数値を許可します。</td>
        </tr>
        <tr>
          <td><b>url</b></td>
          <td>有効なURLを必要にします。</td>
        </tr>
        <tr>
          <td><b>time</b></td>
          <td>有効な時刻を必要にします。</td>
        </tr>
    </table>
  </td>
</tr>
<tr>
  <td>cols</td>
  <td>列 (<code>integer</code>)</td>
  <td>列の数です。(テキストエリアだけ)</td>
</tr>
<tr>
  <td>rows</td>
  <td>行 (<code>integer</code>)</td>
  <td>行の数です。(テキストエリアだけ)</td>
</tr>
<tr>
  <td>multiple</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>入力項目を複数値にします。テキスト入力、選択メニュー、ラジオボタン、チェックボックスに適用できます。チェックボックスウィザードには必要です。</td>
</tr>
<tr>
  <td>size</td>
  <td>サイズ (<code>integer</code>)</td>
  <td>複数の選択が可能な選択メニューや入力項目の数の大きさです。</td>
</tr>
<tr>
  <td>style</td>
  <td>スタイル属性 (<code>string</code>)</td>
  <td>スタイル属性です。(例: <code>border:2px</code>)</td>
</tr>
<tr>
  <td>rte</td>
  <td>リッチテキストエディターのファイル (<code>string</code>)</td>
  <td><b>tinyMCE</b> <code>config/tinyMCE.php</code>を使用です。<br>
      <b>tinyFlash</b> <code>config/tinyFlash.php</code>を使用です。<br>
      独自の構成ファイルも追加できます。</td>
</tr>
<tr>
  <td>submitOnChange</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、項目の値を変更したときにフォームを提出します。</td>
</tr>
<tr>
  <td>nospace</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、空白文字の使用を禁止します。</td>
</tr>
<tr>
  <td>allowHtml</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目はHTMLの入力を受け入れます。</td>
</tr>
<tr>
  <td>preserveTags</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、どのHTMLのタグも削除しません。</td>
</tr>
<tr>
  <td>decodeEntities</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、HTMLのエンティティを常にデコードします。allowHtmlがtrueの場合も、HTLのエンティティを常にデコードすることに注意してください。</td>
</tr>
<tr>
  <td>doNotSaveEmpty</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、項目が空の場合はは保存しません。</td>
</tr>
<tr>
  <td>alwaysSave</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、値が変更されていない場合でも項目を常に保存します。これはload_callbackと併せて使用すると役立つでしょう。</td>
</tr>
<tr>
  <td>spaceToUnderscore</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、すべての空白文字をアンダースコアに置き換えます。</td>
</tr>
<tr>
  <td>unique</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、値が既に存在すると項目の値を保存できません。</td>
</tr>
<tr>
  <td>encrypt</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、項目の値を暗号化して保存します。</td>
</tr>
<tr>
  <td>trailingSlash</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、項目の値の末尾にスラッシュを追加します。falseの場合、項目の値の末尾にあるスラッシュを削除します。</td>
</tr>
<tr>
  <td>files</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、ファイルとフォルダーを表示します。falseの場合、フォルダーだけを表示します。ファイルツリーにだけ適用できます。</td>
</tr>
<tr>
  <td>filesOnly</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>フォルダーの隣のラジオボタンやチェックボックスを削除します。ファイルツリーにだけ適用できます。</td>
</tr>
<tr>
  <td>extensions</td>
  <td>ファイルの拡張子 (<code>string</code>)</td>
  <td>ファイルツリーを特定の(コンマで区切ったリストの)種類のファイルに制限します。ファイルツリーにだけ適用できます。</td>
</tr>
<tr>
  <td>path</td>
  <td>パス (<code>string</code>)</td>
  <td>ファイルツリーに独自の独自のルートディレクトリを指定します。ファイルツリーにだけ適用できます。</td>
</tr>
<tr>
  <td>fieldType</td>
  <td>入力項目の種類 (<code>string</code>)</td>
  <td><b>checkbox</b> 複数の選択が可能<br>
      <b>radio</b> 1つだけ選択可能<br>
      ファイルツリーにだけ適用できます。
  </td>
</tr>
<tr>
  <td>includeBlankOption</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、オプションの配列に空白(非選択)の選択肢を追加します。ドロップダウンメニューだけに適用できます。</td>
</tr>
<tr>
  <td>blankOptionLabel</td>
  <td>ラベル (<code>string</code>)</td>
  <td>空白の選択肢のラベルです。(既定値は<code>-</code>)</td>
</tr>
<tr>
  <td>chosen</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td><a href="http://harvesthq.github.io/chosen/" target="_blank">Chosen</a>で改善した固有の選択メニューにします。</td>
</tr>
<tr>
  <td>findInSet</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>ラベルではなく選択肢の実際の値で並べ替えます。</td>
</tr>
<tr>
  <td>datepicker</td>
  <td>trueまたはfalse (<code>string</code>)</td>
  <td>trueの場合、この項目に日付選択を付けます。</td>
</tr>
<tr>
  <td>colorpicker</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目に色選択を付けます。</td>
</tr>
<tr>
  <td>feEditable</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目をフロントエンドで編集できます。tl_memberのテーブルだけに適用できます。</td>
</tr>
<tr>
  <td>feGroup</td>
  <td>グループ名 (<code>string</code>)</td>
  <td><b>personal</b> 個人データ<br>
      <b>address</b> 住所の詳細<br>
      <b>contact</b> 連絡先の詳細<br>
      <b>login</b> ログインの詳細 (<code>tl_member</code>のテーブルだけ)<br>
      独自のグループも定義できます。</td>
</tr>
<tr>
  <td>feViewable</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、この項目をメンバーリストモジュールに表示可能にします。</td>
</tr>
<tr>
  <td>doNotCopy</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、レコードを複製するときに、この項目を複製しません。</td>
</tr>
<tr>
  <td>hideInput</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、項目の値を隠します。(ページのソースの表示では、見えるままです!)</td>
</tr>
<tr>
  <td>doNotShow</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>trueの場合、「複数を変更」や「詳細の表示」のモードで、この項目を表示しません。</td>
</tr>
<tr>
  <td>isBoolean</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>特定の項目が論理値であると示します。</td>
</tr>
<tr>
  <td>disabled</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>項目を無効にします。(すべての項目の種類でサポートしているわけではありません。)</td>
</tr>
<tr>
  <td>readonly</td>
  <td>trueまたはfalse (<code>boolean</code>)</td>
  <td>項目を読み込み専用とします。(すべての項目の種類でサポートしているわけではありません。)</td>
</tr>
</table>


### リレーション

リレーションは、データベースの項目が他のテーブルとどのように関係しているかを記述します。参照するテーブルは`foreignKey`キーで定義してください。
リレーションは、参照しているデータセットを効率的に、そして開発者に親切に読み込むモデルのクラスを提供します。(`Model::getRelated()`を参照)

<table>
<tr>
  <th>キー</th>
  <th>値</th>
  <th>説明</th>
</tr>
<tr>
  <td>type</td>
  <td>リレーションの種類<br> (<code>string</code>)
  <td>
    <b>hasOne</b> 子のデータセットへの値参照<br>
    <b>hasMany</b> 複数の(シリアライズした)子のデータセットへの値参照<br>
    <b>belongsTo</b> 親のデータセットへの値参照(例: <code>pid</code>)<br>
    <b>belongsToMany</b> 複数の(シリアライズした)親のデータセットへの値参照<br>
  </td>
</tr>
<tr>
  <td>load</td>
  <td>読み込みの挙動<br> (<code>string</code>)</td>
  <td>
      <b>lazy</b> 必要になった場合だけ参照しているレコードを読み込み(初期設定、RAMを節約)<br>
      <b>eager</b> 自動的に参照している絵コードを読み込み(データベースの呼び出しを節約)
  </td>
</tr>
</table>


## パレット

パレットは、レコードを編集するのに必要なフォームの項目のグループです。
通常、パレットはテーブルのすべての列ではなく、特定のモジュールやコンテンツ要素に属する列だけを含みます。パレットはユーザーの権限や要素の種類に依存して動的に変更でき、(サブパレットと呼ばれる)フォームのある部分をAjaxを介して対話的に読み込めます。


### グループの定義

パレットは、セミコロン(;)またはコンマ(,)で項目を連結した文字列です。コンマは項目の名前を単に区切るために使用し、一方でセミコロンは展開と折り畳みができる新しいフィールドセットの開始を示します。

![](https://raw.github.com/contao/docs/3.1/manual/en/images/palettes.jpg)

以下のコードで上記の例を定義しています:

``` {.php}
{title_legend},headline,alias,author;{date_legend},date,time;{teaser_legend:hide},subheadline,teaser
```

`title_legend`と`date_legend`といったプレースホルダーは、"TL_LANG"という配列の対応するラベルに置き換えらます。

``` {.php}
$GLOBALS['TL_LANG']['tl_news']['title_legend'] = 'Title and author';
$GLOBALS['TL_LANG']['tl_news']['date_legend']  = 'Date and time';
```


### 項目の配置

Contaoのバックエンドは単純な2列のグリッドシステムを使用して、グループ内に入力項目を配置します。データコンテナ配列の評価のセクションで、`tl_class`に以下のCSSのクラスを適用できます。(例: 'tl_class'=>'w50 wizard')

<table>
<tr>
  <th>tl_class</th>
  <th>説明</th>
</tr>
<tr>
  <td>w50</td>
  <td>項目の幅を50%にしてフロート(<code>float: left</code>)にします。</td>
</tr>
<tr>
  <td>clr</td>
  <td>すべてのfloatをクリア(<code>clear:both</code>)します。</td>
</tr>
<tr>
  <td>wizard</td>
  <td>入力項目を短くして、ウィザードのボタンに十分な場所を用意します。(例: 日付選択の項目)</td>
</tr>
<tr>
  <td>long</td>
  <td>テキスト入力を2列の幅にします。</td>
</tr>
<tr>
  <td>m12</td>
  <td>要素に12ピクセルのトップマージンを追加します。(単一のチェックボックスで使用)</td>
</tr>
</table>


## コールバック

コールバック関数はイベントのディスパッチャーのパターンに基づいています。特定のイベントに1つ以上のコールバックを登録でき、イベントが起きるとコールバック関数を実行します。コールバックによって、Contaoのコアのエンジンのプログラムの流れをカスタマイズできます。


#### 全体的なコールバック

<table>
<tr>
  <th>コールバック</th>
  <th>説明</th>
</tr>
<tr>
  <td>onload_callback</td>
  <td>データコンテナのオブジェクトを初期化するときに実行します。例えば権限を確認したり、データコンテナ配列を実行時に変更するといったことができます。</td>
</tr>
<tr>
  <td>onsubmit_callback</td>
  <td>バックエンドのフォームを提出したときに実行します。例えば、フォームのデータをデータベースに書き込む前に変更することができます。(カレンダー機能拡張で期間の計算に使用しています。)</td>
</tr>
<tr>
  <td>ondelete_callback</td>
  <td>データベースからレコードを削除する前に実行します。</td>
</tr>
<tr>
  <td>oncut_callback</td>
  <td>新しい位置にレコードを移動した後に実行します。</td>
</tr>
<tr>
  <td>oncopy_callback</td>
  <td>レコードを複製した後で実行します。</td>
</tr>
</table>


#### 一覧のコールバック

<table>
<tr>
  <th>コールバック</th>
  <th>説明</th>
</tr>
<tr>
  <td>paste_button_callback</td>
  <td>個々の張り付けボタンに使用でき、例えばサイト構造でユーザーの権限に応じてボタンを無効にするために使用しています。(load_callbackによる追加のコマンドの検査が必要です。)</td>
</tr>
<tr>
  <td>child_record_callback</td>
  <td>「ペアレントビュー」で子の要素を表示する方法を指定します。</td>
</tr>
<tr>
  <td>group_callback</td>
  <td>一覧で、個々のグループのヘッダーに使用できます。</td>
</tr>
<tr>
  <td>label_callback</td>
  <td>一覧で、個々のラベルに使用できます。例えば、ユーザーモジュールは状態のアイコンの表示に使用しています。</td>
</tr>
</table>


#### 操作のコールバック

<table>
<tr>
  <th>コールバック</th>
  <th>説明</th>
</tr>
<tr>
  <td>button_callback</td>
  <td>個々のナビゲーションアイコンで使用できます。例えば、サイト構造でユーザーの権限に応じてボタンを無効にするために使用しています。(load_callbackによる追加のコマンドの検査が必要です。)</td>
</tr>
</table>


#### 項目のコールバック

<table>
<tr>
  <th>コールバック</th>
  <th>説明</th>
</tr>
<tr>
  <td>options_callback</td>
  <td>ドロップダウンメニューやチェックボックスのリストにデータを読み込む個々の関数を定義できます。例えば、条件付きの外部キー関係のために役立ちます。</td>
</tr>
<tr>
  <td>input_field_callback</td>
  <td>個々のフォームの項目の作成に使用できます。例えば、「個人データ」のバックエンドモジュールで「データの消去」のウィジェットの生成に使用しています。注意: この項目は自動的に保存しません!</td>
</tr>
<tr>
  <td>load_callback</td>
  <td>フォームの項目を初期化するときに実行します。例えば、初期値を読み込むのに使用できます。</td>
</tr>
<tr>
  <td>save_callback</td>
  <td>項目を提出したときに実行します。例えば、個々の検証処理の追加に使用できます。</td>
</tr>
</table>


[1]: 02-Administration-area.md#listing-records
