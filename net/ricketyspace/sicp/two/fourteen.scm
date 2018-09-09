;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two fourteen)
  #:use-module (net ricketyspace sicp two seven)
  #:use-module (net ricketyspace sicp two ten)
  #:use-module (net ricketyspace sicp two twelve)
  #:export (par1 par2 R1 R2 R3 A B))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))

(define R1 (make-interval 4 5))
(define R2 (make-interval 7 8))
(define R3 (make-interval 1 1))

(define A (make-center-percent 6 0.5))
(define B (make-center-percent 2 1))

