(define-module rfc.stringprep
  (use text.tr)
  (use rfc.stringprep.table)
  (export
   stringprep
   )
  )
(select-module rfc.stringprep)

;; Module concepts:
;; - Only support utf-8 environment.
;; 

(cond-expand
 [gauche.ces.utf8]
 [else
  (error "Failed load the library since not utf-8 environment.")]
 )


;; TODO build-transliterator from text.tr

(define (stringprep-downcase! s)
  )

(define (stringprep-upcase! s)
  )

;;TODO
(define (stringprep-canonicalize s)
  )

;;TODO
(define (stringprep-canonicalize! s)
  )

(define stringprep stringprep-canonicalize)

(define (stringprep=? s1 s2)
  )

(define (stringprep>? s1 s2)
  )

(define (stringprep<? s1 s2)
  )

(define (stringprep>=? s1 s2)
  (or (stringprep=? s1 s2)
      (stringprep>? s1 s2)))

(define (stringprep<=? s1 s2)
  (or (stringprep=? s1 s2)
      (stringprep<? s1 s2)))

(define (stringprep-ci=? s1 s2)
  )


(define (stringprep-ci>? s1 s2)
  )

(define (stringprep-ci<? s1 s2)
  )

(define (stringprep-ci>=? s1 s2)
  (or (stringprep-ci=? s1 s2)
      (stringprep-ci>? s1 s2)))

(define (stringprep-ci<=? s1 s2)
  (or (stringprep-ci=? s1 s2)
      (stringprep-ci<? s1 s2)))

