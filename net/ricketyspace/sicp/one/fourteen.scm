;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

;;; adapted from section 1.2.2
;;; intolerable scheme drivel; ignore it.

(define-module (net ricketyspace sicp one fourteen)
  #:export (get-cc
            cc-range
            cc-diff-list))

(define (get-cc)
  (let ((no-of-steps 0))
    (define (cc amount kinds-of-coins)
      (set! no-of-steps (1+ no-of-steps))
      (cond ((= amount 0) 1)
            ((or (< amount 0) (= kinds-of-coins 0)) 0)
            (else (+ (cc amount
                         (- kinds-of-coins 1))
                     (cc (- amount
                            (first-denomination kinds-of-coins))
                         kinds-of-coins)))))
    (define (first-denomination kinds-of-coins)
      (cond ((= kinds-of-coins 1) 1)
            ((= kinds-of-coins 2) 5)
            ((= kinds-of-coins 3) 10)
            ((= kinds-of-coins 4) 25)
            ((= kinds-of-coins 5) 50)))
    (lambda (amount)
      (cc amount 5)
      no-of-steps)))

(define (cc-range amount limit incr)
  (cond ((> amount limit) '())
        ((<= amount limit)
         (cons ((get-cc) amount)
              (cc-range (+ amount incr) limit incr)))))

(define (cc-diff-list l)
  (cond ((= (length l) 1) '())
        ((> (length l) 1) (cons (+ (* -1 (car l)) (cadr l))
                                (cc-diff-list (cdr l))))))
