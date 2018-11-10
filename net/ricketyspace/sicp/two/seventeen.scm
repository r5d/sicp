;;;; License: CC0-1.0

(define-module (net ricketyspace sicp two seventeen)
  #:export (sicp-last-pair))

(define (sicp-last-pair items)
  (cond ((= (length items) 1) items)
        (else (sicp-last-pair (cdr items)))))
