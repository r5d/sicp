;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;; Reference: http://enwp.org/?title=Church_encoding&oldid=849484371

(define-module (net ricketyspace sicp two six)
  #:export (zero
            add-1
            one
            two
            plus))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (plus m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))
