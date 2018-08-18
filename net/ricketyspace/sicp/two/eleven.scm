;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two eleven)
  #:use-module (net ricketyspace sicp two seven)
  #:export (mul-interval-alt))

(define (mul-interval-alt x y)
  (define lbx (lower-bound x))
  (define ubx (upper-bound x))
  (define lby (lower-bound y))
  (define uby (upper-bound y))
  (define (n a) (< a 0))  ; is negative
  (define (p a) (>= a 0)) ; is positive
  (define (signs slbx subx slby suby)
    (and (slbx lbx)
         (subx ubx)
         (slby lby)
         (suby uby)))
  (cond ((signs n p p p) (make-interval (* lbx uby) (* ubx uby)))
        ((signs p p n p) (make-interval (* ubx lby) (* ubx uby)))
        ((signs p p p p) (make-interval (* lbx lby) (* ubx uby)))
        ((signs n n n n) (make-interval (* lbx lby) (* ubx uby)))
        ((signs n n p p) (make-interval (* ubx uby) (* lbx lby)))
        ((signs p p n n) (make-interval (* ubx uby) (* lbx lby)))
        ((signs n n n p) (make-interval (* ubx uby) (* ubx lby)))
        ((signs n p n n) (make-interval (* ubx uby) (* lbx uby)))
        ((signs n p n p) (make-interval (min (* lbx uby) (* ubx lby))
                                        (* ubx uby)))
        (else (error "Intervals not supported"))))
