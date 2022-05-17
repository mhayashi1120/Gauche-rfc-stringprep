(define-module rfc.stringprep.utility
  (use rfc.stringprep)
  ;; TODO maybe need this
  (use gauche.unicode)
  (export
   stringprep=? stringprep<=? stringprep>=?
   stringprep<? stringprep>?
   stringprep-ci=? stringprep-ci<=? stringprep-ci>=?
   stringprep-ci<? stringprep-ci>?
   )
  )
(select-module rfc.stringprep.utility)

;;;
;;; Basic comparer (Has performance overhead)
;;;

(define (%wrap-comparer pred s1 s2)
  (pred (stringprep s1) (stringprep s2)))

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
  (%wrap-comparer string-ci=? s1 s2))

(define (stringprep-ci>? s1 s2)
  (%wrap-comparer string-ci>? s1 s2))

(define (stringprep-ci<? s1 s2)
  (%wrap-comparer string-ci<? s1 s2))

(define (stringprep-ci>=? s1 s2)
  (%wrap-comparer string-ci>=? s1 s2))

(define (stringprep-ci<=? s1 s2)
  (%wrap-comparer string-ci<=? s1 s2))
