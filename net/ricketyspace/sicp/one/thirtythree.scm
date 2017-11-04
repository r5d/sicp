;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;;  ___________________
;;; < fuck abstraction. >
;;;  -------------------
;;;   \                 __
;;;    \               (oo)
;;;     \              (  )
;;;      \             /--\
;;;        __         / \  \
;;;       UooU\.'@@@@@@`.\  )
;;;       \__/(@@@@@@@@@@) /
;;;            (@@@@@@@@)((
;;;            `YY~~~~YY' \\
;;;            ||    ||   >>

(define-module (net ricketyspace sicp one thirtythree)
  #:use-module (net ricketyspace sicp one twentyeight)
  #:export (filtered-accumulate sum-odd sum-prime-sqrs))

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((not (filter a))
         (combiner null-value
                   (filtered-accumulate combiner null-value
                                        term (next a) next b
                                        filter)))
        (else
         (combiner (term a)
                   (filtered-accumulate combiner null-value
                                        term (next a) next b
                                        filter)))))

(define (sum-odd n)
  (let ((null-value 0)
        (term (lambda (x) x))
        (next (lambda (x) (1+ x))))
    (filtered-accumulate + null-value term 0 next n odd?)))

(define (sum-prime-sqrs a b)
  "Return sum of prime squares between A and B.

A and B must be an integer greater than zero."
  (let ((null-value 0)
        (term (lambda (x) (* x x)))
        (next (lambda (x) (1+ x))))
    (filtered-accumulate + null-value term a next b prime?)))


;;; Guile REPL
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtythree)
;;; scheme@(guile-user)> (sum-odd 1)
;;; $9 = 1
;;; scheme@(guile-user)> (sum-odd 5)
;;; $10 = 9
;;; scheme@(guile-user)> (sum-odd 10)
;;; $13 = 25
;;; scheme@(guile-user)> (sum-prime-sqrs 1 5)
;;; $10 = 39
;;; scheme@(guile-user)> (+ 1 4 9 25)
;;; $11 = 39
;;; scheme@(guile-user)> (sum-prime-sqrs 1 10)
;;; $12 = 88
;;; scheme@(guile-user)> (+ 1 4 9 25 49)
;;; $13 = 88

