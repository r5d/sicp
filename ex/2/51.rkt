;;;; License: CC0-1.0

#lang racket

(require "46.rkt")
(require "49.rkt")
(require "50.rkt")


(define (beside painter1 painter2)
  (let ((split-point (make-vect 0.5 0.0)))
    (let ((paint-left
           (transform-painter
            painter1
            (make-vect 0.0 0.0)
            split-point
            (make-vect 0.0 1.0)))
          (paint-right
           (transform-painter
            painter2
            split-point
            (make-vect 1.0 0.0)
            (make-vect 0.5 1.0))))
      (lambda (frame)
        (paint-left frame)
        (paint-right frame)))))


(define (below painter1 painter2)
  (let ((split-point (make-vect 0.0 0.5)))
    (let ((paint-above
           (transform-painter
            painter2
            (make-vect 0.0 0.0)
            (make-vect 1.0 0.0)
            split-point))
          (paint-below
           (transform-painter
            painter1
            split-point
            (make-vect 1.0 0.5)
            (make-vect 0.0 1.0))))
      (lambda (frame)
        (paint-above frame)
        (paint-below frame)))))
