(define-module rfc.stringprep.utility
  (use rfc.stringprep)
  (export
   stringprep=? stringprep<=? stringprep>=?
   stringprep<? stringprep>?
   stringprep-ci=? stringprep-ci<=? stringprep-ci>=?
   stringprep-ci<? stringprep-ci>?
   )
  )
(select-module rfc.stringprep.utility)

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

