;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two three)
  #:use-module (net ricketyspace sicp two two)
  #:export (rectangle-make
            rectangle-make-alt
            rectangle-area
            rectangle-perimeter))

;;;;
;;;;
;;;; Visual representation of the rectangle.
;;;;
;;;;    3                2
;;;;           l2
;;;;    +----------------+
;;;;    |                |
;;;; w2 |                | w1   width
;;;;    |                |
;;;;    +----------------+
;;;;  start    l1
;;;;    0                1
;;;;          length
;;;;

;;; Rectangle constructors.

(define (rectangle-make length width start)
  (define TYPE 0)
  (define p0 start)
  (define p1 (make-point (+ (x-point p0) length)
                         (y-point p0)))
  (define p2 (make-point (+ (x-point p0) length)
                         (+ (y-point p0) width)))
  (define p3 (make-point (x-point p0)
                         (+ (y-point p0) width)))
  (list TYPE
        (make-segment p0 p1)   ;l1
        (make-segment p1 p2)   ;w1
        (make-segment p3 p2)   ;l2
        (make-segment p0 p3))) ;w2

(define (rectangle-make-alt length width start)
  (define TYPE 1)
  (list TYPE length width start))


;;; Rectangle selectors.

(define (rectangle-type rect)
  (car rect))

(define (rectangle-length rect)
  (let ((type (rectangle-type rect))
        (l (cadr rect)))
    (cond ((= type 0) (- (x-point (end-segment l))
                         (x-point (start-segment l))))
          ((= type 1) l)
          (else (error "Unknown rectangle type")))))

(define (rectangle-width rect)
  (let ((type (rectangle-type rect))
        (w (caddr rect)))
    (cond ((= type 0) (- (y-point (end-segment w))
                         (y-point (start-segment w))))
          ((= type 1) w)
          (else (error "Unknown rectangle type")))))


;;; Rectangle utils.

(define (rectangle-area rect)
  "Returns area of rectangle RECT"
  (* (rectangle-length rect) (rectangle-width rect)))

(define (rectangle-perimeter rect)
  "Returns perimeter of rectangle RECT"
  (* 2 (+ (rectangle-length rect) (rectangle-width rect))))
