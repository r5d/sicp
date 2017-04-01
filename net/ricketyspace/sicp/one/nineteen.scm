;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one nineteen)
  #:use-module (net ricketyspace sicp one seventeen)
  #:export (ifast-fib
            ifast-fib-iter))

;; Thanks
;; http://www.billthelizard.com/2010/01/sicp-exercise-119-computing-fibonacci.html
(define (ifast-fib n)
  " Compute fibonacci of N.

Iterative version in 𝝝(log N) steps using successive zarking squaring.
"
  (ifast-fib-iter 1 0 0 1 n))

(define (ifast-fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (ifast-fib-iter a
                   b
                   (+ (* p p) (* q q))
                   (+ (* q q ) (* 2 p q))
                   (/ count 2)))
        (else (ifast-fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
