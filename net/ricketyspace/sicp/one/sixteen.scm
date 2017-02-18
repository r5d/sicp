;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;;  _____________________________________
;;; < successive squaring 𝚯(log n) drivel >
;;;  -------------------------------------
;;;     \
;;;      \
;;;     ^__^         /
;;;     (oo)\_______/  _________
;;;     (__)\       )=(  ____|_ \_____
;;;         ||----w |  \ \     \_____ |
;;;         ||     ||   ||           ||
;;;

(define-module (net ricketyspace sicp one sixteen)
  #:export (fast-expt-iter))

(define (sqr x) (expt x 2))

(define (fast-expt-iter b n a)
  "Excercise 1.16."
  (cond ((= n 0) a)
        ((even? n) (fast-expt-iter (sqr b) (/ n 2) a))
        (else (fast-expt-iter b (- n 1) (* a b)))))
