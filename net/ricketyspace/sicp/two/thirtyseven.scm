;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two thirtyseven)
  #:use-module (net ricketyspace sicp two thirtysix)
  #:export (dot-product
            matrix-*-vector
            transpose
            matrix-*-matrix))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (r) (dot-product r v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row)
           (matrix-*-vector cols row)) m)))

;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,re (net ricketyspace sicp two thirtyseven)
;;; scheme@(guile-user)> (dot-product '(1 2 3) '(4 5 6))
;;; $14 = 32
;;; scheme@(guile-user)> (matrix-*-vector '((1 2 3) (3 2 1) (1 2 3)) '(1 10 100))
;;; $15 = (321 123 321)
;;; scheme@(guile-user)> (transpose '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
;;; $16 = ((1 4 6) (2 5 7) (3 6 8) (4 6 9))
;;; scheme@(guile-user)> (matrix-*-matrix '((1 2 3) (3 2 1) (1 2 3)) '((4 5 6) (6 5 4) (4 6 5)))
;;; $17 = ((28 33 29) (28 31 31) (28 33 29))
