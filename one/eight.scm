;;; Under Creative Commons Attribution-ShareAlike 4.0
;;; International. See
;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (one eight)
  #:export (cube double
            div-three improve
            good-enough? cbrt-iter
            cbrt-sicp))

(use-modules (one six))

(define (cube x)
  (* (square x) x))

(define (double x)
  (* 2 x))

(define (div-three x)
  (/ x 3.0))

(define (improve y x)
  (div-three (+ (/ x (square y))
                (double y))))

(define (good-enough? y x)
  (< (abs (- (cube y) x))
     0.001))

(define (cbrt-iter y x)
  (if (good-enough? y x)
      y
      (cbrt-iter (improve y x)
                 x)))

(define (cbrt-sicp x)
  (cbrt-iter 1.0 x))

