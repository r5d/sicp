
;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;;
;;;  __________________
;;; < +, - everything. >
;;;  ------------------
;;;   \            .    .     .
;;;    \      .  . .     `  ,
;;;     \    .; .  : .' :  :  : .
;;;      \   i..`: i` i.i.,i  i .
;;;       \   `,--.|i |i|ii|ii|i:
;;;            U**U\.'@@@@@@`.||'
;;;            \__/(@@@@@@@@@@)'
;;;                 (@@@@@@@@)
;;;                 `YY~~~~YY'
;;;                  ||    ||
;;;

(define-module (net ricketyspace sicp one seventeen)
  #:export (double
            halve
            fast-*)
  #:replace (even?))

(define (double a)
  "Return A + A."
  (+ a a))

(define (halve b)
  "Return B/2.

B must be an even number."
  (cond ((= b 0) 0)
        (else (+ 1 (halve (- b 2))))))

(define (even? b)
  "Return #t if B is divisible by 2; #f otherwise."
  (cond ((= b 1) #f)
        ((= b 0) #t)
        (else (even? (- b 2)))))

(define (fast-* a b)
  "Return A * B."
  (cond ((= b 0) 0)
        ((even? b) (double (fast-* a (halve b))))
        (else (+ a (fast-* a (- b 1))))))
