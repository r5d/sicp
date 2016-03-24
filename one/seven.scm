;;; Under Creative Commons Attribution-ShareAlike 4.0
;;; International. See
;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (one seven)
  #:export (tolerances-and-sqrt))

(use-modules (one six))

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
