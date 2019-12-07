;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtysix)
  #:export (accumulate-n))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map (lambda (seq) (car seq)) seqs))
            (accumulate-n op init (map (lambda (seq) (cdr seq)) seqs)))))


;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtysix)
;;; scheme@(guile-user)> (accumulate-n + 0 '((1 2 3) (4 5 6) (7 8 9) (10 11 12)))
;;; $9 = (22 26 30)
;;; scheme@(guile-user)> (accumulate-n + 0 '((2 4 6) (3 6 9) (4 8 12) (5 10 15) (6 12 18)))
;;; $10 = (20 40 60)
