;;;; License: CC0-1.0

#lang racket

(provide
 frame-coord-map
 paint
 wave->painter
 x->painter)

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


(define (wave->painter)
  (let* ((h-ls (make-vect 0.426 0.000))    ; head - left start
         (h-le (make-vect 0.349 0.164))    ; head - left end
         (h-rs (make-vect 0.505 0.000))    ; head - right start
         (h-re (make-vect 0.577 0.165))    ; head - right end
         (n-le (make-vect 0.434 0.287))    ; neck - left end
         (n-re (make-vect 0.499 0.283))    ; neck - right end

         (sh-le (make-vect 0.302 0.288))   ; shoulder - left end
         (sh-re (make-vect 0.620 0.290))   ; shoulder - right end

         (lh-ts (make-vect 0.000 0.200))   ; left hand - top start
         (lh-te (make-vect 0.257 0.400))   ; left hand - top end
         (lh-bs (make-vect 0.000 0.316))   ; left hand - bottom start
         (lh-be (make-vect 0.296 0.533))   ; left hand - bottom end

         (uat-ls sh-le)                    ; upper arm top - left start
         (uat-le lh-te)                    ; upper arm top - left end
         (uab-ls (make-vect 0.398 0.371))  ; upper arm bottom - left end
         (uab-le lh-be)                    ; upper arm bottom - left end

         (uat-rs sh-re)                    ; upper arm top - right start
         (uat-re (make-vect 1.000 0.550))  ; upper arm top - right end
         (uab-rs (make-vect 1.000 0.660))  ; upper arm bottom - right start
         (uab-re (make-vect 0.563 0.376))  ; upper arm bottom - right end

         (wll-os uab-ls)                   ; waist left leg - outside start
         (wll-oe (make-vect 0.290 1.000))  ; waist left leg - outside end
         (wll-is (make-vect 0.490 0.642))  ; waist left leg - inside start
         (wll-ie (make-vect 0.384 1.000))  ; waist left leg - inside end

         (wrl-os uab-re)                   ; waist right leg - outside start
         (wrl-oe (make-vect 0.730 1.000))  ; waist right leg - outside end
         (wrl-is wll-is)                   ; waist right leg - inside start
         (wrl-ie (make-vect 0.650 1.000))) ; waist right leg - inside end
    (segments->painter
     (list
      ;; head
      (make-segment h-ls h-le)
      (make-segment h-rs h-re)
      (make-segment h-le n-le)
      (make-segment h-re n-re)

      ;; neck
      (make-segment n-le sh-le)
      (make-segment n-re sh-re)

      ;; left hand
      (make-segment lh-ts lh-te)
      (make-segment lh-bs lh-be)

      ;; upper arm left
      (make-segment uat-ls uat-le)
      (make-segment uab-ls uab-le)

      ;; upper arm right
      (make-segment uat-rs uat-re)
      (make-segment uab-rs uab-re)

      ;; waist - legs
      (make-segment wll-os wll-oe)
      (make-segment wll-is wll-ie)
      (make-segment wrl-os wrl-oe)
      (make-segment wrl-is wrl-ie)))))

;;; https://ricketyspace.net/sicp/2.49.webm
