;;;; License: CC0-1.0

#lang racket

(provide make-frame
         make-frame-alt
         origin-frame
         edge1-frame
         edge2-frame)

(require "46.rkt")


;;; frame functions

(define  (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))


;;; alternative frame functions

(define (make-frame-alt origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame-alt frame)
  (car frame))

(define (edge1-frame-alt frame)
  (car (cdr frame)))

(define (edge2-frame-alt frame)
  (cdr (cdr frame)))

;;; tests

(module+ tests
  (require rackunit)

  (define f1 (make-frame (make-vect 1 2) (make-vect 3 4) (make-vect 5 6)))
  (define f2 (make-frame-alt (make-vect 1 2) (make-vect 3 4) (make-vect 5 6)))

  ;; test selectors for make-frame
  (check-equal? (origin-frame f1) '(1 . 2))
  (check-equal? (edge1-frame f1)  '(3 . 4))
  (check-equal? (edge2-frame f1)  '(5 . 6))

  ;; test selectors for make-frame-alt
  (check-equal? (origin-frame-alt f2) '(1 . 2))
  (check-equal? (edge1-frame-alt f2)  '(3 . 4))
  (check-equal? (edge2-frame-alt f2)  '(5 . 6))
  "all tests ran")
