;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two twentyseven)
  #:export (sicp-deep-reverse))

(define (sicp-append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (sicp-append (cdr list1) list2))))

(define (sicp-deep-reverse items)
  (cond ((null? items) '())
        ((pair? (car items))
         (sicp-append (sicp-deep-reverse (cdr items))
                      (list (sicp-deep-reverse (car items)))))
        (else
         (sicp-append (sicp-deep-reverse (cdr items))
                      (list (car items))))))

;;; Guile REPL

;;; scheme@(guile-user)> ,use (net ricketyspace sicp two twentyseven)
;;; scheme@(guile-user)> (sicp-deep-reverse '((1 2 3) (4 5 6)))
;;; $27 = ((6 5 4) (3 2 1))
;;; scheme@(guile-user)> (sicp-deep-reverse '(1 (4 5 6)))
;;; $28 = ((6 5 4) 1)
;;; scheme@(guile-user)> (sicp-deep-reverse '(1 (6)))
;;; $29 = ((6) 1)
;;; scheme@(guile-user)> (sicp-deep-reverse '(1 2 3 4 5 6))
;;; $30 = (6 5 4 3 2 1)
