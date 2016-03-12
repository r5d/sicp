;;; Under Creative Commons Attribution-ShareAlike 4.0
;;; International. See
;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (one three)
  #:export (square sum-of-squares largest first-arg-2nd-largest-p
                   sum-of-squares-of-largest-two))

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (largest x y z)
  (cond ((and (>= x y)
              (>= x z)) x)
        ((and (>= y x)
              (>= y z)) y)
        ((and (>= z x)
              (>= z y)) z)))

(define (first-arg-2nd-largest-p x y z)
  (or (and (>= x y)
           (<= x z))
      (and (<= x y)
           (>= x z))
      ))

(define (sum-of-squares-of-largest-two x y z)
  (sum-of-squares (largest x y z)
                  (cond ((first-arg-2nd-largest-p x y z)
                         x)
                        ((first-arg-2nd-largest-p y x z)
                         y)
                        ((first-arg-2nd-largest-p z x y)
                         z))))
