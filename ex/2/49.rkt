;;;; License: CC0-1.0

#lang racket

(require racket/draw)
(require racket/snip)

(require "46.rkt")
(require "47.rkt")
(require "48.rkt")

(define dc #f) ; drawing context. gets initialized by paint function.


(define (draw-line v1 v2)
  (let ((x1 (xcor-vect v1))
        (y1 (ycor-vect v1))
        (x2 (xcor-vect v2))
        (y2 (ycor-vect v2)))
    (send dc draw-line x1 y1 x2 y2)))


(define (paint painter)
  (let ((frame (make-frame (make-vect 250 250)
                           (make-vect 500 0)
                           (make-vect 0 500)))
        (target (make-bitmap 1000 1000)))
    (set! dc (new bitmap-dc% (bitmap target)))
    (painter frame)
    (make-object image-snip% target)))


(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect
      (scale-vect (xcor-vect v) (edge1-frame frame))
      (scale-vect (ycor-vect v) (edge2-frame frame))))))


(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
     (lambda (segment)
       (draw-line
        ((frame-coord-map frame)
         (start-segment segment))
        ((frame-coord-map frame)
         (end-segment segment))))
     segment-list)))


(define (outline->painter)
  (let ((v-tl (make-vect 0 0))  ; top left
        (v-tr (make-vect 1 0))  ; top right
        (v-br (make-vect 1 1))  ; bottom right
        (v-bl (make-vect 0 1))) ; bottom left
      (segments->painter
       (list (make-segment v-tl v-tr)
             (make-segment v-tr v-br)
             (make-segment v-br v-bl)
             (make-segment v-bl v-tl)))))


(define (x->painter)
  (let ((v-tl (make-vect 0 0))  ; top left
        (v-tr (make-vect 1 0))  ; top right
        (v-br (make-vect 1 1))  ; bottom right
        (v-bl (make-vect 0 1))) ; bottom left
    (segments->painter
     (list (make-segment v-tl v-br)
           (make-segment v-tr v-bl)))))


(define (diamond->painter)
  (let ((v-mt (make-vect 0.5 0))  ; midpoint top
        (v-mr (make-vect 1 0.5))  ; midpoint right
        (v-mb (make-vect 0.5 1))  ; midpoint bottom
        (v-ml (make-vect 0 0.5))) ; midpoint left
    (segments->painter
     (list (make-segment v-mt v-mr)
           (make-segment v-mr v-mb)
           (make-segment v-mb v-ml)
           (make-segment v-ml v-mt)))))
