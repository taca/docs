# 監理領域

Contaoの管理領域(バックエンド)にアクセスするには、ContaoのウェブサイトのURLに単純に`/contao`を追加してください。バックエンドのログインは総当たり攻撃から保護してあり、連続して間違ったパスワードを3回入力すると、5分の間アカウントはロックされます。


## レコードの一覧

Contaoのコアのエンジンは3つの表示方法をサポートしています: 単純な一覧("リストビュー")、親のテーブルでグループ化した一覧("ペアレントビュー")、階層的な一覧("ツリービュー")です。これらの3つの表示を任意のテーブルや関連するテーブルの一覧に使えます。


### リストビュー

"リストビュー"は単一のテーブルのレコードを特定の順序で一覧表示します。その結果は通常は最初の文字でグループにまとめられます。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/list-view.jpg)


### ペアレントビュー

"ペアレントビュー"は親のテーブルの特定のレコードに関連した、子のテーブルのレコードを一覧表示します。親と子の関係はContaoで多数使用していて、例えばアーティクルとコンテンツ要素、ニュースアーカイブとニュース記事、スタイルシートと書式定義などです。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/parent-view.jpg)


### ツリービュー

"ツリービュー"は、ファイルとフォルダーのように階層的な構造を構成する、レコードとその他のリソースを表示します。Contaoは単一の階層的なテーブル(例えば、サイト構造)に加えて、階層的な親のテーブルと関連した子のテーブル(例えば、アーティクルとページ)もサポートしています。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/tree-view.jpg)


### 並べ替えとデータのフィルター

Contaoには様々な結果を絞り込む方法をサポートしていて、例えテーブルが数千の列でも状況の把握ができなくなるようなことはありません。多くの一覧表示は1つ以上の項目でフィルターして、その条件に合ったレコードだけを表示できます。加えて殆どの一覧表示では、正規表現までサポートした全文検索も提供しています。ページを表示する時間を最小限とするため、Contaoは一度には30レコードだけ表示します。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/sorting-and-filtering.jpg)


## レコードの編集

Editing data is one of the central functions of a Content Management System.
Contao offers a lot of professional features that make the editing process as
easy and comfortable as possible. You can revert back to earlier versions of a
record, restore deleted records, move records via clipboard and even edit
multiple records at once. Most of these functions can be accessed using the
navigation icons.

データの編集はコンテンツ管理システムの中心的な機能の1つです。Contaoは編集の作業を可能な限り簡単に、そして快適にする多くの専門的な機能を用意しています。レコードの前のバージョンに戻したり、削除したレコードを復元したり、クリップボードを経由して移動したり、同時に複数のレコードを編集したりといったことさえ可能です。これらの機能の殆どはナビゲーションのアイコンを使用して実行できます。

### リストビューのアイコン

「リストビュー」はもっとも単純な表示形式で、4つの基本的な処理: 編集、複製、削除、表示を用意しています。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/list-view-icons.jpg)


### ペアレントビューのアイコン

「ペアレントビュー」はナビゲーションのアイコンを2つの追加していて、レコードの順序を制御できます。バージョン2.7からは、順序はドラッグアンドドロップで変更できます。これは(ナビゲーションのアイコンではなく)単純にレコードをクリックしてから、新しい位置にドラッグできます。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/parent-view-icons.jpg)


### ツリービューのアイコン

「ツリービュー」に必要なのは階層構造を扱うための追加のアイコンです。1つのレコードの複製に加えて、すべての下位のレコードを含めた複製、レコードの後や中に貼り付けを提供していて、入れ子となった構造を作成できるようにしています。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/tree-view-icons.jpg)


### 以前のバージョンの復元

Contaoはレコードを保存するときに、その新しいバージョンを毎回自動的に作成しています。複数のバージョンが存在していると、フォームの上部にドロップダウンメニューを表示して、ここから以前のバージョンに戻すことができます。単純にバージョンを選択して復元のボタンをクリックします。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/versioning.jpg)


### 複数のレコードの編集

一度に複数のレコードを編集する能力は、Contaoを様々なコンテンツ管理システムから明らかに際立たせています。「複数を変更」のボタンをクリックすると編集モードが切り替わるので、1つ以上の変更したいレコードを選択して、それから修正したい項目を選択してください。

![](https://raw.github.com/contao/docs/3.0/manual/en/images/select-multiple-records.jpg)

![](https://raw.github.com/contao/docs/3.0/manual/en/images/select-fields-to-edit.jpg)

![](https://raw.github.com/contao/docs/3.0/manual/en/images/edit-multiple-records.jpg)


## キーボードのショートカット

Contaoで作業するときの流れを高速化する、バックエンドのショートカットがいくつかあって、特定のコマンドを実行できます。例えば、フォームの最後にある「保存」ボタンの実行は、マウスのクリックかキーボードのショートカット`[ALT] + [s]`で行えます。


### 一般的なキーボードのショートカット

<table>
<tr>
  <th>ショートカット</th>
  <th>ボタン</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>[Alt]+[h]</code></td>
  <td><b>H</b>ome</td>
  <td>Go to the home page of the back end.</td>
</tr>
<tr>
  <td><code>[Alt]+[q]</code></td>
  <td><b>Q</b>uit</td>
  <td>Quit the current back end session (log out).</td>
</tr>
<tr>
  <td><code>[Alt]+[t]</code></td>
  <td><b>T</b>op</td>
  <td>Go to the top of the page.</td>
</tr>
<tr>
  <td><code>[Alt]+[b]</code></td>
  <td><b>B</b>ack</td>
  <td>Go back to the previous page.</td>
</tr>
<tr>
  <td><code>[Alt]+[n]</code></td>
  <td><b>N</b>ew record</td>
  <td>Create a new record.</td>
</tr>
<tr>
  <td><code>[Alt]+[e]</code></td>
  <td><b>E</b>dit multiple</td>
  <td>Switch to the "edit multiple" mode.</td>
</tr>
<tr>
  <td><code>[Alt]+[f]</code></td>
  <td><b>F</b>ront end preview</td>
  <td>Open the front end preview in a new browser window.</td>
</tr>
</table>


### Keyboard shortcuts in edit mode

<table>
<tr>
  <th>ショートカット</th>
  <th>ボタン</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>[Alt]+[s]</code></td>
  <td><b>S</b>ave</td>
  <td>Saves the current form.</td>
</tr>
<tr>
  <td><code>[Alt]+[c]</code></td>
  <td>Save and <b>c</b>lose</td>
  <td>Saves the current form and redirects to the previous page.</td>
</tr>
<tr>
  <td><code>[Alt]+[g]</code></td>
  <td>Save and <b>g</b>o back</td>
  <td>Saves the current form and redirects to the parent page, e.g. from a
content element to the article tree.</td>
</tr>
<tr>
  <td><code>[Alt]+[e]</code></td>
  <td>Save and <b>e</b>dit</td>
  <td>Saves the current form and redirects to the child records view, e.g. when
creating style sheets.</td>
</tr>
<tr>
  <td><code>[Alt]+[n]</code></td>
  <td>Save and <b>n</b>ew</td>
  <td>Saves the current form and creates a new record.</td>
</tr>
</table>


### Keyboard shortcuts in "edit multiple" mode

<table>
<tr>
  <th>ショートカット</th>
  <th>ボタン</th>
  <th>説明</th>
</tr>
<tr>
  <td><code>[Alt]+[d]</code></td>
  <td><b>D</b>elete multiple</td>
  <td>Deletes all selected records in "edit multiple" mode.</td>
</tr>
<tr>
  <td><code>[Alt]+[x]</code></td>
  <td>Cut multiple</td>
  <td>Moves all selected records in "edit multiple" mode.</td>
</tr>
<tr>
  <td><code>[Alt]+[c]</code></td>
  <td><b>C</b>opy multiple</td>
  <td>Duplicates all selected records in "edit multiple" mode.</td>
</tr>
<tr>
  <td><code>[Alt]+[v]</code></td>
  <td>Override multiple</td>
  <td>Overrides all selected records in "edit multiple" mode.</td>
</tr>
</table>

The keyboard shortcuts above only work on Windows in this form. Mac users have
to use `[Ctrl]+[⌥ Opt]` instead of the `[Alt]` key together with the keyboard
shortcut. In addition, Firefox on Windows deviates from the standard: you have
to press `[Alt]+[Shift]` and the keyboard shortcut.
