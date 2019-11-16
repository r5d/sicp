;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtythree)
  #:export (sicp-map
            sicp-append
            sicp-length))


(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))


(define (sicp-map p sequence)
  (accumulate (λ (x y)
                (cons (p x) y))
              '() sequence))


(define (sicp-append seq1 seq2)
  (accumulate cons seq2 seq1))


(define (sicp-length sequence)
  (accumulate (λ (x y)
                (+ 1 y))
              0
              sequence))

;;; Guile REPL
;;;
;;;
;;; scheme@(guile-user)> ,use (net ricketyspace sicp two thirtythree)
;;;
;;; scheme@(guile-user)> (sicp-map (λ (x) (expt 2 x)) '(1 2 3 4 5 6 7 8 9 10))
;;; $5 = (2 4 8 16 32 64 128 256 512 1024)
;;; 
;;; scheme@(guile-user)> (sicp-append '(1 2 3 4 5 6 7 8 9 10) '(11 12 13 14 15 16))
;;; $7 = (1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16)
;;; 
;;; scheme@(guile-user)> (sicp-length '(40 41 42 43 44 45 46 47 48 49))
;;; $11 = 10
;;;
