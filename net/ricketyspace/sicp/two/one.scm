;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp two one)
  #:export (make-rat))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-numer n neg?)
  (if neg? (* -1 (abs n))
      (abs n)))
(define (make-denom d) (abs d))

(define (make-rat n d)
  (let ((g (abs (gcd n d)))
        (neg? (< (* n d) 0)))
    (cons (/ (make-numer n neg?) g)
          (/ (make-denom d) g))))
