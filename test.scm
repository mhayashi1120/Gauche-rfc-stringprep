;;;
;;; Test gauche_rfc_stringprep
;;;

(use gauche.test)

(test-start "gauche_rfc_stringprep")

(use rfc.stringprep)
(test-module 'rfc.stringprep)

;; The following is a dummy test code.
;; Replace it for your tests.
(test* "test-gauche_rfc_stringprep" #t
       (boolean #?= stringprep))

;; If you don't want `gosh' to exit with nonzero status even if
;; the test fails, pass #f to :exit-on-failure.
(test-end :exit-on-failure #t)
