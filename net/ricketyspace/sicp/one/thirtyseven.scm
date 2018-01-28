;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one thirtyseven)
  #:export (cont-frac-iter
            cont-frac-rec))

(define (cont-frac-rec n d k)
  (define (do-rec n d i)
    (cond ((< i k) (/ (n i)
                      (+ (d i) (do-rec n d (1+ i)))))
          (else (/ (n i) (d i)))))
  (do-rec n d 1))

(define (cont-frac-iter n d k)
  (define (do-iter n d i acc)
    (cond ((= i 0) acc)
          (else (do-iter n d (1- i) (/ (n i) (+ (d i) acc))))))
  (do-iter n d k 0))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp one thirtyseven)
;;; scheme@(guile-user)> (cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) 10)
;;; $7 = 0.6179775280898876
;;; scheme@(guile-user)> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 10)
;;; $8 = 0.6179775280898876
;;; scheme@(guile-user)> (cont-frac-rec (lambda (i) 1.0) (lambda (i) 1.0) 11)
;;; $9 = 0.6180555555555556
;;; scheme@(guile-user)> (cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11)
;;; $10 = 0.6180555555555556
