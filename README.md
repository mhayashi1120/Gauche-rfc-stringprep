# Gauche-rfc-stringprep

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

## First plan

- canonicalize by `stringprep`
- extend string-downcase / string-upcase (or simply introduce other procedure)
- stringprep=? (and other comparetor stringprep>=? stringprep<=? ...)
- TODO support kana <-> hankaku-kana seems not prepared in rfc3454.txt
- first implementation is just same as example1.c (located `/usr/share/doc/libidn11-dev/examples/` on debian apt)


