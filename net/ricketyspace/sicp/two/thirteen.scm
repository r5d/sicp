;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two thirteen)
  #:use-module (net ricketyspace sicp two twelve)
  #:export (mul-tol-percent))

(define (mul-tol-percent intv-a intv-b)
  "Returns approx. percentage tolerance of INT-A * INTV-B.

Assumes all numbers in INTV-A and INTV-B are positive.

Say 2⨦.10 and 7⨦.20 are the two intervals.

  The lower and upper bounds of the product of these interavals:

     (2 - 0.10) * (7 - 0.20) ; Lower bound
     (2 - 0.10) * (7 - 0.20) ; Upper bound

      Lower bound -> (2 - 0.10) * (7 - 0.20)
                  -> (2 * 7) - (2 * 0.20) - (7 * 0.10) + (0.10 * 0.20)
                                   X            Y            Z
                  -> (2 * 7) - (X + Y - Z)
                  -> (2 * 7) - (X + Y) ; ignore Z as it is small.

      Upper bound -> (2 + 0.10) * (7 + 0.20)
                  -> (2 * 7) + (2 * 0.20) + (7 * 0.10) + (0.10 * 0.20)
                                   X            Y            Z
                  -> (2 * 7) - (X + Y + Z)
                  -> (2 * 7) - (X + Y)  ; ignore Z as it is small.

      => Percentage tolerance is ⨦ (X + Y)"
  (let* ((ca (center intv-a))
         (pa (percent intv-a))
         (cb (center intv-b))
         (pb (percent intv-b))
         (x (* ca pb))
         (y (* cb pa)))
      (/ (+ x y) 100.0)))


;;; Guile REPL
;;; scheme@(guile-user)> ,re  (net ricketyspace sicp two thirteen)
;;; scheme@(guile-user)> (mul-tol-percent (make-center-percent 2 10) (make-center-percent 7 20))
;;; $20 = 1.1000000000000003
;;; scheme@(guile-user)> (+ (* 2 .20) (* 0.10 7))
;;; $21 = 1.1
