;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;; pascal's fucking triangle.

(define-module (one twelve)
  #:export (compute-triangle
            compute-line
            display-line
            value-at
            print-triangle
            print-line))

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

;;;; printing

(define (print-triangle tl level)
  (cond ((= (length tl) 0) #t)
        (else
         (print-triangle (cdr tl) (+ 1 level))
         (print-line (car tl) level))))

(define (print-line l level)
  (let* ((l (map number->string l))
        (spaces (string-join (make-list level " ") ""))
        (line (string-append spaces (string-join l))))
    (format #t "~a\n" line)))
