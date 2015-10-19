#!/usr/bin/env gosh

(debug-print-width #f)

(define (main args)
  #?= (read-tables "rfc3454.txt")
  0)

(define (read-tables file)
  (with-input-from-file file
    (^()
      (let loop ([tables '()])
        (let1 l (read-line)
          (cond
           [(eof-object? l)
            (reverse! tables)]
           [(#/^( +)-+ Start Table ([A-Z]\.[0-9.]+) -+$/ l) =>
            (^m
             (loop (cons (read-table (m 2) (m 1)) tables)))]
           [else
            (loop tables)]))))))

;; case-map
;; 

(define (read-table name indent)

  (define (hex->number s)
    (string->number s 16))

  (define (parse-line line)
    (cond
     [(#/^([0-9a-fA-F]+)$/ line) =>
      (^m
       (list (hex->number (m 1)) (hex->number (m 1))))]
     [(#/^([0-9a-fA-F]+)-([0-9a-fA-F]+)$/ line) =>
      (^m
       (list (hex->number (m 1)) (hex->number (m 2))))]
     [(string-split line "; ") =>
      (^l l)]
     [else
      #?= line]))

  (let* ([re-end (string->regexp #`"^,|indent|-+ End Table ,|name| -+")]
         [re-body (string->regexp #`"^,|indent|(.+)")])
    (let loop ([res '()])
      (let1 l (read-line)
        (cond
         [(eof-object? l)
          (error "Parse error (End tag not found)" name)]
         [(re-end l)
          (cons name (reverse! res))]
         [(re-body l) =>
          (^m
           (loop (cons (parse-line (m 1)) res)))]
         [else
          (loop res)])))))

