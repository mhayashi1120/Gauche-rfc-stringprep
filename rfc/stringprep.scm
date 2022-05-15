(define-module rfc.stringprep
  (use gauche.unicode)
  (use text.tr)
  (export
   stringprep
   stringprep-downcase
   stringprep-upcase
   stringprep-canonicalize stringprep-canonicalize!
   stringprep=? stringprep<=? stringprep>=?
   stringprep<? stringprep>?
   stringprep-ci=? stringprep-ci<=? stringprep-ci>=?
   stringprep-ci<? stringprep-ci>?
   )
  )
(dynamic-load "gauche_rfc_stringprep")

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

;; TODO stringprep -> stringprep-downcase
(define (stringprep-downcase s)
  )

;; TODO stringprep -> stringprep-upcase
(define (stringprep-upcase s)
  )

;;TODO
(define (stringprep-canonicalize s)
  )

;;TODO
(define (stringprep-canonicalize! s)
  )

(define stringprep stringprep-canonicalize)

;;;
;;; Basic comparer
;;;

(define (%wrap-comparer pred s1 s2)
  (pred (stringprep s1) (stringprep s2)))

(define (%wrap-comparer-ci pred s1 s2)
  (pred (stringprep-downcase s1) (stringprep-downcase s2)))

(define (stringprep=? s1 s2)
  (%wrap-comparer string=? s1 s2))

(define (stringprep>? s1 s2)
  (%wrap-comparer string>? s1 s2))

(define (stringprep<? s1 s2)
  (%wrap-comparer string<? s1 s2))

(define (stringprep>=? s1 s2)
  (%wrap-comparer string>=? s1 s2))

(define (stringprep<=? s1 s2)
  (%wrap-comparer string<=? s1 s2))

(define (stringprep-ci=? s1 s2)
  (%wrap-comparer-ci string-ci=? s1 s2))

(define (stringprep-ci>? s1 s2)
  (%wrap-comparer-ci string-ci>? s1 s2))

(define (stringprep-ci<? s1 s2)
  (%wrap-comparer-ci string-ci<? s1 s2))

(define (stringprep-ci>=? s1 s2)
  (%wrap-comparer-ci string-ci>=? s1 s2))

(define (stringprep-ci<=? s1 s2)
  (%wrap-comparer-ci string-ci<=? s1 s2))

