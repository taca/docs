## クラスメソッドのオーバーライド

ここではナビゲーションモジュールの動作を変更して、下位のページがなくてモジュールをまったく表示しない場合でも、常にモジュールを表示するようにしてみます。下位のページがない場合は、そのことをユーザーに通知する表示をします。もちろん、元のナビゲーションのクラスの殆どはそのままにするようにして、将来のアップデートで保守を不要にします。モジュールとコンテント要素のクラスはContaoのシステム構成で動的に割り当てられ、独自のバージョンと簡単に置き換えることができるようになっています。


### 独自のクラスの作成

既定のナビゲーションクラスの動作は、今回の目的にたいへんよく似ていますが、`generate()`メソッドが下位のページが存在しない場合にモジュールを表示しないところが違います。従って、この特定のメソッドだけ変更が必要なので、元のクラスをオーバーライドするのが最良の方法です。これを実現するには、新しく`xcustom/ModuleMyNavigation.php`というファイルを作成して、独自のクラス`ModuleMyNavigation`を定義します:

```php
// xcustom/ModuleMyNavigation.php
class ModuleMyNavigation extends ModuleNavigation
{
    public function generate()
    {
        // オリジナルのメソッドを実行
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

モジュールとコンテント要素のクラスはContaoのシステム構成で動的に割り当てられ、独自のバージョンと簡単に置き換えられるようになっています。モジュールのクラスは広域な配列`FE_MOD`が保持しています。

```php
// xcustom/config/config.php
$GLOBALS['FE_MOD']['navigationMenu']['navigation'] = 'ModuleMyNavigation';
```

動的な構成のおかげで、次のリクエストからContaoは自動的に新しいクラスを読み込み、ナビゲーションモジュールは何も表示しない代わりに "There are no subpages"という通知を表示します。この変更はContaoの更新に対応していて、保守を必要としません。
