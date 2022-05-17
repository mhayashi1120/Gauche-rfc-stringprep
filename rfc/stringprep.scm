(define-module rfc.stringprep
  (use gauche.unicode)
  (use text.tr)
  (export
   stringprep stringprep-normalize
   )
  )
(dynamic-load "rfc__stringprep")

(select-module rfc.stringprep)

;; Module concepts:
;; - Only support utf-8 environment.
;; - Just call libidn* stringprep.
;; - Maybe upgrade interface via keywords.
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

;; Supported profiles:
;; "Nameprep" (default) / "KRBprep" / "Nodeprep"/ "Resourceprep"
;; "plain"/ "trace"/ "SASLprep"/ "ISCSIprep"/ "iSCSI"
;; "Nameprep*"

;; keyword should support:
(define (stringprep s :key (profile "Nameprep"))
  (call-stringprep s profile))

(define stringprep-normalize stringprep)
