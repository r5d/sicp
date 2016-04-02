;;; Under Creative Commons Attribution-ShareAlike 4.0
;;; International. See
;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (one seven)
  #:export (tolerances-and-sqrt
            good-enough-alt?
            sqrt-iter-alt
            sqrt-sicp-alt))

(use-modules (one six))

;;;; start yak shaving
(define (gen-good-enough tolerance)
  (lambda (guess x)
    (< (abs (- (square guess) x)) tolerance)))

(define (sqrt-iter-with-tolerance guess x tolerance)
  (let ((good-enough? (gen-good-enough tolerance)))
    (if (good-enough? guess x)
        guess
        (sqrt-iter-with-tolerance (improve guess x)
                   x tolerance))))

(define (sqrt-with-tolerance x tolerance)
 (sqrt-iter-with-tolerance 1.0 x tolerance))

(define (tolerances-and-sqrt x tolerance)
  (let* ((guile-sqrt (sqrt x))
         (custom-sqrt (sqrt-with-tolerance x tolerance)))
    (if (eqv? guile-sqrt custom-sqrt)
        (cons tolerance custom-sqrt)
        (cons (cons tolerance custom-sqrt)
              (tolerances-and-sqrt x (/ tolerance 10))))))
;;;; end yak shaving

;;; start excercise 1.1.7
(define (good-enough-alt? guess prev-guess)
  (< (abs (- guess prev-guess)) 0.001))

(define (sqrt-iter-alt guess prev-guess x)
  (if (good-enough-alt? guess prev-guess)
      guess
      (sqrt-iter-alt (improve guess x) guess
                     x)))

(define (sqrt-sicp-alt x)
  (sqrt-iter-alt 1.0 2.0 x))
;;;; end excercise 1.1.7
