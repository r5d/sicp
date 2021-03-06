;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one twentynine)
  #:export (simpson))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (let* ((h (/ (- b a) (* 1.0 n)))
         (y (lambda (k) (+ a (* k h))))
         (ce (lambda (k) ;coefficient
               (cond ((or (= k 0) (= k n)) 1)
                     ((even? k) 2)
                     (else 4))))
         (term (lambda (k)
                 (* (ce k) (f (y k)))))
         (next (lambda (k) (1+ k))))
    (* (/ h 3.0)
       (sum term 0 next n))))

;;; Guile REPL
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one twentynine)
;;; scheme@(guile-user)> (define (cube x) (* x x x))
;;; scheme@(guile-user)> (simpson cube 0 1 100)
;;; $23 = 0.24999999999999992
;;; scheme@(guile-user)> (simpson cube 0 1 1000)
;;; $24 = 0.2500000000000003

