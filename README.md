# Gauche-rfc-stringprep

[![CI](https://github.com/mhayashi1120/Gauche-rfc-stringprep/actions/workflows/build.yml/badge.svg)](https://github.com/mhayashi1120/Gauche-rfc-stringprep/actions/workflows/build.yml)

Normalize string in gauche script.

Examples:

- "ｱアＡ" => "アアa"
- "アﾅタの Nａｍe は何て゛すか？" => "アナタの name は何ですか?"
- "テスト①" => "テスト1"

This library just call [libidn](https://www.gnu.org/software/libidn/) `stringprep` function.

Maybe need:

```
sudo apt install libidn11-dev libidn11
```

## Japanese note

最初に要約すると、日本人の **一般的なテキスト入力** に対しては絵文字を含めてまともに動くはずです。

ユーザ入力や海外から飛んでくるメール(濁点が分離してる文字が混じったりする)を **雑に正規化** して表示したい、名寄せしたいときに使っています。
PRECIS framework というのが新しい仕様らしいのですが、まだよく分からないので手をつけてあった古いコード(このリポジトリ)を公開しておきます。

大雑把にいうと日本語話者が使いそうな文字に対しては以下のように働くらしい。

- いわゆる半角ｶﾅから全角カナへの変換
- 分離した濁点(゛)、半濁点(゜)の一文字への統合
- 全角ａｓｃｉｉ から ascii (小文字)への変換
- 丸囲み数字をただの ascii 数字へ置換
- null byte 以外の control char は変換なし
- null byte などの一部の禁止文字に対してはエラーを通知して変換不可能
- 独自拡張: :profile に "Nameprep*" を指定することで、Ascii の case が保持できる。(よく使いそうなので)

# Reference

RFC 3454
   [STRINGPREP] Hoffman, P. and M. Blanchet, "Preparation of
                Internationalized Strings ("stringprep")", RFC 3454,
                December 2002.

RFC 3491
   [NAMEPREP]   Hoffman, P. and M. Blanchet, "Nameprep: A Stringprep
                Profile for Internationalized Domain Names (IDN)", RFC
                3491, March 2003.

- https://www.rfc-editor.org/rfc/rfc3454.txt
- https://www.rfc-editor.org/rfc/rfc3491.txt
- https://www.rfc-editor.org/rfc/rfc8264.txt
- https://www.rfc-editor.org/rfc/rfc7790.txt
- https://www.rfc-editor.org/rfc/rfc7564.txt
- https://www.rfc-editor.org/rfc/rfc8264.txt


- ref: [デジタルプラクティス](https://www.ipsj.or.jp/dp/contents/publication/37/S1001-T05.html)
- ref: [Unicode正規化 - Qiita](https://qiita.com/fury00812/items/b98a7f9428d1395fc230)
- ref: Gauche git ext/charconv/jconv.c
- ref: (Dead) http://docs.python.jp/2/library/stringprep.html
- ref: [Gauche - A Scheme Implementation](http://practical-scheme.net/gauche/memo-str-j.html)
- ref: https://tex2e.github.io/rfc-translater/html/rfc7564.html
- ref: https://tex2e.github.io/rfc-translater/html/rfc8264.html

# Docker

```
make docker-check
```


# TODO

- stringprep=? (and other comparetor stringprep>=? stringprep<=? ...)
- accept more option and need consideration.
- consider NFKC / NFC like symbol ref https://qiita.com/fury00812/items/b98a7f9428d1395fc230
- Support to pass stringprep flags. (with `logior`)
