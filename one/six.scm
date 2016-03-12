(define-module (one six)
   #:export (sqrt-sicp sqrt-nif square good-enough? new-if improve))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt-iter-nif guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter-nif (improve guess x)
                         x)))

(define (sqrt-sicp x)
  (sqrt-iter 1.0 x))

(define (sqrt-nif x)
  (sqrt-iter-nif 1.0 x))
