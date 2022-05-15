;;;
;;; Hold huge table
;;;

(define-module rfc.stringprep.table
  (use scheme.hash-table)
  (export))
(select-module rfc.stringprep.table)

;; - table: <STRINGPREP-TABLE>
;; - inverse-table -> X cannot implemented

;; - upcase-table: <STRINGPREP-TABLE>
;; - downcase-table: <STRINGPREP-TABLE>

;; <STRINGPREP-TABLE>:
;; - KEY: UCS-CHAR
;; - VALUE: STRING | STRINGPREP-TABLE | #f
(define table (make-hash-table eq?))
