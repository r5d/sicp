;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twentyone)
  #:export (square-list-v1
            square-list-v2))

(define (square-list-v1 items)
  (if (null? items)
      items
      (cons (* (car items) (car items))
            (square-list-v1 (cdr items)))))

(define (square-list-v2 items)
  (map (lambda (x) (* x x)) items))
