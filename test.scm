;;;
;;; Test rfc.stringprep
;;;

(use gauche.test)

(test-start "rfc.stringprep")

(use rfc.stringprep)
(test-module 'rfc.stringprep)

(test* "Example1 (Japanese)" "アアa"
       (stringprep "ｱアＡ"))

(test* "Example2 (Japanese)" "アナタの name は何ですか?"
       (stringprep "アﾅタの Nａｍe は何ですか？"))

(test* "Example2-2 (Japanese)" "アナタの Name は何ですか?"
       (stringprep "アﾅタの Nａｍe は何ですか？" :profile "Nameprep*"))

(test* "Example3 (Japanese 丸囲み文字)" "テスト1"
       (stringprep "テスト①"))

(test* "ascii conversion" "a"
       (stringprep "A"))

(test* "null character" (test-error)
       (stringprep "\x00;"))

(test* "backspace character" "\x7f;"
       (stringprep "\x7f;"))

(test* "prohibited character" (test-error)
       (stringprep "\x80;"))

(let1 control-chars ($ string $* map ucs->char $ iota 31 1)
  (test* "ascii controlchar conversion (as-is)" control-chars
         (stringprep control-chars)))

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

(test* "Many conversion shrink/extend string (Case keeping)" "アアAaαΑմխὒC∕kgὐ"
       ;; Just check conversion is working
       (stringprep "アｱＡａαΑ\uFB17\u1F52\u33C6\u1F50" :profile "Nameprep*"))


;; https://www.ipsj.or.jp/dp/contents/publication/37/S1001-T05.html
(test* "Just simple test2" "ä"
       (stringprep "\u00e4"))
(test* "Just simple test" "ä"
       (stringprep "\u0061\u0308"))
(test* "Just Test working" #t
       (boolean (stringprep "\u08a1")))
(test* "Currently not converted" (test-error)
       (stringprep "\u0628\u0654"))

;; TODO more considration. need more tests

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)
