;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two eighteen)
  #:use-module (net ricketyspace sicp two seventeen)
  #:export (sicp-reverse))

(define (sicp-append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (sicp-append (cdr list1) list2))))

(define (sicp-reverse items)
  (cond ((null? items) '())
        (else (sicp-append (sicp-reverse (cdr items)) (list (car items))))))
