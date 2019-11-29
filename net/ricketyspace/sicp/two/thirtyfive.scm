;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtyfive)
  #:export (count-leaves-acc))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (count-leaves-acc t)
  (accumulate + 0
              (map (lambda (p)
                     (cond ((pair? p)
                            (count-leaves-acc p))
                           (else 1)))
                   t)))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtyfive)
;;; scheme@(guile-user)> (count-leaves-acc '(1 3 (5 7) 9))
;;; $11 = 5
;;; scheme@(guile-user)> (count-leaves-acc '((7)))
;;; $12 = 1
;;; scheme@(guile-user)> (count-leaves-acc '(1 (2 (3 (4 (5 (6 7)))))))
;;; $13 = 7
;;; scheme@(guile-user)>

