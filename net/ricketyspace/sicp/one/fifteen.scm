;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp one fifteen)
  #:use-module (ice-9 regex)
  #:export (sine))

(define (sine angle)
  (let ((out ""))
    (define (log angle)
      (set! out (string-append out " (p (sine "
                               (number->string (/ angle 3.0)))))
    (define (close-parens s)
      (string-trim (string-append
                    s (fold-matches "\\([p,s]" s ""
                                    (lambda (match prev)
                                      (string-append prev ")"))))))
    (define (cube x) (* x x x))
    (define (p x) (- (* 3 x) (* 4 (cube x))))
    (define (s angle)
      (if (not (> (abs angle) 0.1))
          angle
          (begin
            (log angle)
            (p (s (/ angle 3.0))))))
    (s angle)
    (close-parens out)))
;;
;; (sine 12.15)
;; $25 = "(p (sine 4.05 (p (sine 1.3499999999999999 (p (sine 0.44999999999999996 (p (sine 0.15 (p (sine 0.049999999999999996))))))))))"
