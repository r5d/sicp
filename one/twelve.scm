;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;; pascal's fucking triangle.

(define-module (one twelve)
  #:export (compute-triangle
            compute-line
            display-line
            value-at))

(define (compute-triangle n)
  (cond ((= n 1) (list (compute-line n 1)))
        (else (cons (compute-line n 1)
                    (compute-triangle (- n 1))))))

(define (compute-line n pos)
  (cond ((> pos n) '())
        (else
         (cons (value-at n pos)
               (compute-line n (+ pos 1))))))

(define (value-at line pos)
  (cond ((= line 1) 1)
        ((= pos 1) 1)
        ((= line pos) 1)
        (else (+
               (value-at (- line 1) (- pos 1))
               (value-at (- line 1) pos)))))
