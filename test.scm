;;;
;;; Test local_rfc_stringprep
;;;

(use gauche.test)

(test-start "local_rfc_stringprep")

(use rfc.stringprep)
(test-module 'rfc.stringprep)

(test* "Example1 (Japanese)" "アアa"
       (stringprep "ｱアＡ"))

(test* "Example2 (Japanese)" "アナタの name は?"
       (stringprep "アﾅタの Nａｍe は？"))

(test* "Example3 (Japanese 丸囲み文字)" "テスト1"
       (stringprep "テスト①"))

(test* "ascii conversion" "a"
       (stringprep "A"))

(test* "ascii (Japan Zenkaku)" "aa"
       (stringprep "Ａａ"))

(test* "Circled number (Japan Zenkaku)" "1210"
       (stringprep "①②⑩"))

(test* "empty string is harmless" ""
       (stringprep ""))

(test* "rfc3454.c table say need 2 ucs char" "մխ"
       ;; \uFB17: -> 2 ucs
       (stringprep "\uFB17"))

(test* "rfc3454.c table say need 3 ucs char" "ὒ"
       ;; \u1F52:  -> 3 ucs (after NKFC step reduced)
       (stringprep "\u1F52"))

(test* "rfc3454.c table say need 4 ucs char" "c∕kg"
       ;; \u33C6: 1 ucs to 4 ucs -> "c∕kg" 4 ucs
       (stringprep "\u33C6"))

(test* "Many conversion shrink/extend string" "アアaaααմխὒc∕kgὐ"
       ;; Just check conversion is working
       (stringprep "アｱＡａαΑ\uFB17\u1F52\u33C6\u1F50"))

(test* "Many conversion shrink/extend string" "アアAaαΑմխὒC∕kgὐ"
       ;; Just check conversion is working
       (stringprep "アｱＡａαΑ\uFB17\u1F52\u33C6\u1F50" :profile "Nameprep*"))

;; TODO more considration. need more

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)
