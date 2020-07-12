;;;;
;;;; License: CC0-1.0
;;;;

(define-module (net ricketyspace sicp two fortytwo)
  #:export (safe?))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (position-row pos)
  (car pos))

(define (position-col pos)
  (car (cdr pos)))

(define (abs-diff pos-a pos-b)
  (cons (abs (- (position-row pos-a) (position-row pos-b)))
        (abs (- (position-col pos-a) (position-col pos-b)))))

(define (safe? k positions)
  (define (kth-position)
    (let ((kpos (filter (lambda (pos)
                          (= (position-col pos) k))
                        positions)))
      (if (not (null? kpos)) (car kpos) #f)))
  (define (same-row?)
    (let* ((kpos (kth-position))
          (in-same-row (filter (lambda (pos)
                                 (and (not (equal? pos kpos))
                                      (= (position-row pos)
                                         (position-row kpos))))
                               positions)))
      (if (null? in-same-row) #f #t)))
  (define (same-diagonal?)
    (let* ((kpos (kth-position))
           (in-same-diag (filter (lambda (pos)
                                   (let ((diff (abs-diff pos kpos)))
                                     (and (not (equal? pos kpos))
                                          (= (car diff) (cdr diff)))))
                                 positions)))
      (if (null? in-same-diag) #f #t)))
  (not (or (same-row?) (same-diagonal?))))
