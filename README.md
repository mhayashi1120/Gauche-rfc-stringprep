# Gauche-rfc-stringprep

Normalize string in gauche script.

Examples:

- "ｱアＡ" => "アアa"
- "アﾅタの Nａｍe は？" => "アナタの name は?"
- "テスト①" => "テスト1"

This library just call [libidn](https://www.gnu.org/software/libidn/) `stringprep` function

## Reference

http://docs.python.jp/2/library/stringprep.html

RFC 3454
   [STRINGPREP] Hoffman, P. and M. Blanchet, "Preparation of
                Internationalized Strings ("stringprep")", RFC 3454,
                December 2002.

RFC 3491
   [NAMEPREP]   Hoffman, P. and M. Blanchet, "Nameprep: A Stringprep
                Profile for Internationalized Domain Names (IDN)", RFC
                3491, March 2003.


https://www.ipsj.or.jp/dp/contents/publication/37/S1001-T05.html


https://www.rfc-editor.org/rfc/rfc3454.txt
https://www.rfc-editor.org/rfc/rfc3491.txt
https://www.rfc-editor.org/rfc/rfc8264.txt
https://www.rfc-editor.org/rfc/rfc7790.txt


ref: https://qiita.com/fury00812/items/b98a7f9428d1395fc230


ref: Gauche git ext/charconv/jconv.c

## TODO

- stringprep=? (and other comparetor stringprep>=? stringprep<=? ...)
- accept more option and consideration.
- need keeping case option.
- consider NFKC / NFC like symbol ref https://qiita.com/fury00812/items/b98a7f9428d1395fc230
- Support to pass stringprep flags. (with `logior`)
