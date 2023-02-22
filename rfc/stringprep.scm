(define-module rfc.stringprep
  (use gauche.unicode)
  (use text.tr)
  (export
   stringprep stringprep-normalize
   )
  )
(dynamic-load "rfc--stringprep")

(select-module rfc.stringprep)

;; Module concepts:
;; - Only support utf-8 environment.
;; - Just call libidn* stringprep.
;; - Accept option via keywords interface.
;; - Maybe need streaming interface.  (probablly maybe)

(cond-expand
 [gauche.ces.utf8]
 [else
  ;; Maybe no need support old system.
  (error "Failed load the library since not an utf-8 environment.")])

;;;
;;; API
;;;

;; ## String normalization. RFC3454 (stringprep)
;; - :profile : Define conversion style. Valid values are:
;;    "Nameprep" (default) / "KRBprep" / "Nodeprep"/ "Resourceprep"
;;    "plain"/ "trace"/ "SASLprep"/ "ISCSIprep"/ "iSCSI"
;; "Nameprep*"
;; -> <string>
(define (stringprep text :key (profile "Nameprep"))
  (call-stringprep text profile))

(define stringprep-normalize stringprep)
