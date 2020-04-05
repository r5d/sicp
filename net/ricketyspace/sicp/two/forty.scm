;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two forty)
  #:use-module (net ricketyspace sicp one twentyseven)
  #:export (unique-pairs
            prime-sum-pairs))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))


(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))


(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))


(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))


(define (unique-pairs n)
  (flatmap (lambda (i)
             (map (lambda (j) (list i j))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))


(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))


;;;
;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,re (net ricketyspace sicp two forty)
;;; scheme@(guile-user)> (unique-pairs 6)
;;; $8 = ((2 1) (3 1) (3 2) (4 1) (4 2) (4 3) (5 1) (5 2) (5 3) (5 4) (6 1) (6 2) (6 3) (6 4) (6 5))
;;; scheme@(guile-user)> (prime-sum-pairs 6)
;;; $9 = ((2 1 3) (3 2 5) (4 1 5) (4 3 7) (5 2 7) (6 1 7) (6 5 11))
;;;
