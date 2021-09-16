;;;; License: CC0-1.0

#lang racket

(require
 racket/runtime-path
 sicp-pict)

(define-runtime-path rogers-file "rogers.jpg")

(define rogers
  (bitmap->painter rogers-file))

(define (right-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (right-split painter (- n 1))))
        (beside painter (below smaller smaller)))))

(define (up-split painter n)
  (if (= n  0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

;;; Racket REPL
;;;
;;; https://ricketyspace.net/sicp/2.44.jpg
