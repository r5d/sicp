;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtyone)
  #:export (product product-iter factorial factorial-iter pi pi-iter))

(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (factorial n)
  (let ((term (lambda (x) x))
        (next (lambda (x) (1+ x))))
    (product term 1 next n)))

(define (factorial-iter n)
  (let ((term (lambda (x) x))
        (next (lambda (x) (1+ x))))
    (product-iter term 1 next n)))

(define (pi precision)
  (let* ((n (lambda (x) (if (even? x) (+ x 2) (+ x 1)))) ; numerator of term.
         (d (lambda (x) (if (even? x) (+ x 1) (+ x 2)))) ; denominator of term.
         (term (lambda (x) (/ (n x) (d x))))
         (next (lambda (x) (1+ x))))
    (* (product term 1.0 next precision) 4)))

(define (pi-iter precision)
  (let* ((n (lambda (x) (if (even? x) (+ x 2) (+ x 1)))) ; numerator of term.
         (d (lambda (x) (if (even? x) (+ x 1) (+ x 2)))) ; denominator of term.
         (term (lambda (x) (/ (n x) (d x))))
         (next (lambda (x) (1+ x))))
    (* (product-iter term 1.0 next precision) 4)))


;;; Guile REPL
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtyone)
;;; scheme@(guile-user)> (factorial 5)
;;; $19 = 120
;;; scheme@(guile-user)> (factorial-iter 5)
;;; $20 = 120
;;; scheme@(guile-user)> (factorial 10)
;;; $21 = 3628800
;;; scheme@(guile-user)> (factorial-iter 10)
;;; $22 = 3628800
;;; scheme@(guile-user)> (factorial 20)
;;; $23 = 2432902008176640000
;;; scheme@(guile-user)> (factorial-iter 20)
;;; $24 = 2432902008176640000
;;; scheme@(guile-user)> (pi 1000)
;;; $25 = 3.143160705532257
;;; scheme@(guile-user)> (pi-iter 1000)
;;; $26 = 3.1431607055322552
;;; scheme@(guile-user)> (pi 10000)
;;; $27 = 3.1417497057379635
;;; scheme@(guile-user)> (pi-iter 10000)
;;; $28 = 3.1417497057380084
;;; scheme@(guile-user)> (pi 100000)
;;; $29 = 3.1416083612780903
;;; scheme@(guile-user)> (pi-iter 100000)
;;; $30 = 3.141608361277941
;;; scheme@(guile-user)> (pi 1000000)
;;; $31 = 3.1415942243828017
;;; scheme@(guile-user)> (pi-iter 1000000)
;;; $32 = 3.141594224382854
