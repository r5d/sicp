;;;; License: CC0-1.0

#lang racket

(provide make-vect
         xcor-vect
         ycor-vect
         add-vect
         sub-vect
         scale-vect)

(define (make-vect x y)
  (cons x y))

(define (xcor-vect a)
  (car a))

(define (ycor-vect a)
  (cdr a))

(define (add-vect a b)
  (let ((x (+ (xcor-vect a) (xcor-vect b)))
        (y (+ (ycor-vect a) (ycor-vect b))))
    (make-vect x y)))

(define (sub-vect a b)
  (let ((x (- (xcor-vect a) (xcor-vect b)))
        (y (- (ycor-vect a) (ycor-vect b))))
    (make-vect x y)) )

(define (scale-vect s a)
  (let ((x (* s (xcor-vect a)))
        (y (* s (ycor-vect a))))
    (make-vect x y)))

;;; Racket REPL
;;;
;;; 46.rkt> (define a (make-vect 8 16))
;;; 46.rkt> (define b (make-vect 32 64))
;;; 46.rkt> (xcor-vect a)
;;; 8
;;; 46.rkt> (ycor-vect a)
;;; 16
;;; 46.rkt> (add-vect a b)
;;; '(40 . 80)
;;; 46.rkt> (sub-vect b a)
;;; '(24 . 48)
;;; 46.rkt> (scale-vect 2 a)
;;; '(16 . 32)
;;; 46.rkt> (scale-vect 2 b)
;;; '(64 . 128)
