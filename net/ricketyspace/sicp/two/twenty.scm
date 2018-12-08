;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twenty)
  #:export (same-parity))

(define (same-parity x . y)
  (define x-parity (remainder x 2))
  (define (find nums)
    (cond ((null? nums) '())
          ((= x-parity (remainder (car nums) 2))
           (cons (car nums) (find (cdr nums))))
          (else
           (find (cdr nums)))))
  (cons x (find y)))
