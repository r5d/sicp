;;; Under Creative Commons Attribution-ShareAlike 4.0
;;; International. See
;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (one eleven)
  #:export (recursive-fn))

(define (recursive-fn n)
  (cond ((<= n 3) n)
        (else (+ (* 1 (recursive-fn (- n 1)))
                 (* 2 (recursive-fn (- n 2)))
                 (* 3 (recursive-fn (- n 3)))))))
