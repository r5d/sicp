;;;; License: CC0-1.0

#lang racket

(require
 racket/runtime-path
 sicp-pict)

(define-runtime-path rogers-file "rogers.jpg")

(define rogers
  (bitmap->painter rogers-file))

(define (split left right)
  (lambda (painter n)
    (if (= n 0)
        painter
        (let ((smaller ((split left right) painter (- n 1))))
          (left painter (right smaller smaller))))))

(define right-split (split beside below))

(define up-split (split below beside))

;;; Racket REPL
;;;
;;; https://ricketyspace.net/sicp/2.45.jpg
