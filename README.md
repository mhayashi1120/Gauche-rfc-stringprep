# Gauche-rfc-stringprep

Normalize string in gauche script.

Examples:

- "ｱアＡ" => "アアa"
- "アﾅタの Nａｍe は何て゛すか？" => "アナタの name は何ですか?"
- "テスト①" => "テスト1"

This library just call [libidn](https://www.gnu.org/software/libidn/) `stringprep` function

## Reference

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


ref: [デジタルプラクティス](https://www.ipsj.or.jp/dp/contents/publication/37/S1001-T05.html)
ref: [Unicode正規化 - Qiita](https://qiita.com/fury00812/items/b98a7f9428d1395fc230)
ref: Gauche git ext/charconv/jconv.c
ref: (Dead) http://docs.python.jp/2/library/stringprep.html
ref: [Gauche - A Scheme Implementation](http://practical-scheme.net/gauche/memo-str-j.html)


## TODO

- stringprep=? (and other comparetor stringprep>=? stringprep<=? ...)
- accept more option and need consideration.
- consider NFKC / NFC like symbol ref https://qiita.com/fury00812/items/b98a7f9428d1395fc230
- Support to pass stringprep flags. (with `logior`)
