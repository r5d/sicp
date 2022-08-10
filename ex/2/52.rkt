;;;; License: CC0-1.0

#lang racket

(require "46.rkt")
(require "48.rkt")
(require "49.rkt")

(define (wavex->painter)
  (let* ((h-ls (make-vect 0.426 0.000))    ; head - left start
         (h-le (make-vect 0.349 0.164))    ; head - left end
         (h-rs (make-vect 0.505 0.000))    ; head - right start
         (h-re (make-vect 0.577 0.165))    ; head - right end
         (n-le (make-vect 0.434 0.287))    ; neck - left end
         (n-re (make-vect 0.499 0.283))    ; neck - right end

         (m-ls (make-vect 0.440 0.230))    ; mouth - left start
         (m-le (make-vect 0.462 0.260))    ; mouth - left end
         (m-rs (make-vect 0.475 0.230))    ; mouth - right start

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

      ;; mouth
      (make-segment m-ls m-le)
      (make-segment m-le m-rs)

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
