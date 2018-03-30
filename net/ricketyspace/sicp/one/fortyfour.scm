;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.
;;;;

(define-module (net ricketyspace sicp one fortyfour)
  #:export (smooth))

(define (avg-3 x y z)
  (/ (+ x y z) 3.0))

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (avg-3 (f (- x dx))
                     (f x)
                     (f (+ x dx)))))

;;; GNU Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one fortythree)
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one fortyfour)
;;; scheme@(guile-user)> (sqrt 27)
;;; $2 = 5.196152422706632
;;; scheme@(guile-user)> ((smooth sqrt) 27)
;;; $3 = 5.1961524227065725
;;; scheme@(guile-user)> ((smooth (smooth sqrt)) 27)
;;; $4 = 5.196152422706514
;;; scheme@(guile-user)> ((smooth (smooth (smooth sqrt))) 27)
;;; $5 = 5.196152422706454
;;; scheme@(guile-user)> (((repeated smooth 1) sqrt) 27)
;;; $6 = 5.1961524227065725
;;; scheme@(guile-user)> (((repeated smooth 2) sqrt) 27)
;;; $7 = 5.196152422706514
;;; scheme@(guile-user)> (((repeated smooth 3) sqrt) 27)
;;; $8 = 5.196152422706454
;;;
