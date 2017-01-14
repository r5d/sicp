;;; Under Creative Commons Attribution-ShareAlike 4.0
;;; International. See
;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one five)
  #:export (p test))

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
