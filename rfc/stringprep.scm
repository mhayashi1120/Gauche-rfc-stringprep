(define-module rfc.stringprep
  (use text.tr)
  (export)
   )
(select-module rfc.stringprep)

;; TODO build-transliterator from text.tr

(define (stringprep-downcase! s)
  )

(define (stringprep-upcase! s)
  )

;;TODO
(define (stringprep-canonicalize! s)
  )

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

