(define-module rfc.stringprep
  (use gauche.unicode)
  (use text.tr)
  (export
   stringprep stringprep-normalize
   ;; stringprep-downcase stringprep-upcase
   )
  )
(dynamic-load "local_rfc_stringprep")

(select-module rfc.stringprep)

;; Module concepts:
;; - Only support utf-8 environment.
;; - Just call libidn* stringprep
;; - Maybe upgrade interface with keywords.
;; - Maybe need streaming interface.  (probablly maybe)

(cond-expand
 [gauche.ces.utf8]
 [else
  ;; Maybe no need support old system.
  (error "Failed load the library since not utf-8 environment.")]
 )


;; TODO build-transliterator from text.tr

;;;
;;; Entry point
;;;

;; TODO stringprep -> call-stringprep-downcase
(define (stringprep-downcase s)
  (error "Not yet implemented"))

;; TODO stringprep -> call-stringprep-upcase
;; -> reconsider. maybe alread stringprep then need just upcase/downcase
(define (stringprep-upcase s)
  (error "Not yet implemented"))

;;TODO
;; Maybe introduce destructive type `stringprep!`
;; keyword should support:
;; - NFKC / NFC like symbol ref https://qiita.com/fury00812/items/b98a7f9428d1395fc230
;; - stringprep profiles.
;; - stringprep tables.
;; - stringprep flags. (with `logior`)
(define (stringprep s :key)
  )

(define stringprep-normalize stringprep)

