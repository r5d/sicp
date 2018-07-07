;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two five)
  #:export (npair-cons npair-car npair-cdr))

(define (npair-cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (npair-cdr n)
  (cond ((not (= (remainder n 3) 0)) 0)
        (else (1+ (npair-cdr (quotient n 3))))))

(define (npair-car n)
  (cond ((not (= (remainder n 2) 0)) 0)
        (else (1+ (npair-car (quotient n 2))))))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two five)
;;; scheme@(guile-user)> (npair-car (npair-cons 1 1))
;;; $21 = 1
;;; scheme@(guile-user)> (npair-cdr (npair-cons 1 1))
;;; $22 = 1
;;; scheme@(guile-user)> (npair-car (npair-cons 2 1))
;;; $23 = 2
;;; scheme@(guile-user)> (npair-cdr (npair-cons 2 1))
;;; $24 = 1
;;; scheme@(guile-user)> (npair-car (npair-cons 2 5))
;;; $25 = 2
;;; scheme@(guile-user)> (npair-cdr (npair-cons 2 5))
;;; $26 = 5
;;; scheme@(guile-user)> (npair-car (npair-cons 272 583))
;;; $27 = 272
;;; scheme@(guile-user)> (npair-cdr (npair-cons 272 583))
;;; $28 = 583
;;; scheme@(guile-user)> (npair-car (npair-cons 2732 5883))
;;; $29 = 2732
;;; scheme@(guile-user)> (npair-cdr (npair-cons 2732 5883))
;;; $30 = 5883
;;; scheme@(guile-user)> (npair-car (npair-cons 233 839))
;;; $31 = 233
;;; scheme@(guile-user)> (npair-cdr (npair-cons 233 839))
;;; $32 = 839
