;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two two)
  #:export (make-point
            x-point
            y-point
            make-segment
            start-segment
            end-segment
            midpoint-segment))

;;; Util
(define (avg a b)
  (/ (+ a b) 2.0))


;;; Point
(define (make-point x y)
  (cons x y))

(define (x-point point)
  (car point))

(define (y-point point)
  (cdr point))

;;; Segment
(define (make-segment start end)
  (list start end))

(define (start-segment segment)
  (car segment))

(define (end-segment segment)
  (cadr segment))

(define (midpoint-segment segment)
  (make-point (avg (x-point (start-segment segment))
                   (x-point (end-segment segment)))
              (avg (y-point (start-segment segment))
                   (y-point (end-segment segment)))))
