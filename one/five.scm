(define-module (one five)
  #:export (p test))

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
