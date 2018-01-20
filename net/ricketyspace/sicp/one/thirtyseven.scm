;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtyseven)
  #:export (cont-frac-iter))

(define (cont-frac-iter n d k)
  (define (do-iter n d i)
    (cond ((< i k) (/ (n i)
                      (+ (d i) (do-iter n d (1+ i)))))
          (else (/ (n i) (d i)))))
  (do-iter n d 1))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtyseven)
;;; scheme@(guile-user)> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10)
;;; $16 = 0.6179775280898876
;;; scheme@(guile-user)> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11)
;;; $17 = 0.6180555555555556

