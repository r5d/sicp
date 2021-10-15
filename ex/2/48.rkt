;;;; License: CC0-1.0

#lang racket

(provide make-segment
         start-segment
         end-segment)

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

;;; tests

(module+ tests
  (require rackunit
           "46.rkt")

  (define v-start (make-vect 1 2))
  (define v-end (make-vect 3 4))

  ;; test make-segment
  (define seg (make-segment v-start v-end))
  (check-equal? (car seg) v-start)
  (check-equal? (cdr seg) v-end)

  ;; test start-segment
  (check-equal? (start-segment seg) v-start)
  (check-equal? (end-segment seg) v-end)
  "all tests ran")
