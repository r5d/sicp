;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twentythree)
  #:export (for-each-sicp))

(define (for-each-sicp f l)
  (cond ((null? l) #t)
        (else (begin (f (car l)) (for-each-sicp f (cdr l))))))
