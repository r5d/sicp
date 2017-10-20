;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtytwo)
  #:export (factorial simpson))

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (let ((term (lambda (x) x))
        (next (lambda (x) (1+ x))))
    (product term 1 next n)))

(define (sum term a next b)
  (accumulate + 0 term a next b))

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
