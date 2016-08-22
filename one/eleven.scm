;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (one eleven)
  #:export (recursive-fn
            make-cache
            alt-recursive-fn))

(define (recursive-fn n)
  (cond ((<= n 3) n)
        (else (+ (* 1 (recursive-fn (- n 1)))
                 (* 2 (recursive-fn (- n 2)))
                 (* 3 (recursive-fn (- n 3)))))))

;;;; alternative version. faster but ugly.

(define (make-cache)
  (let ((cache (make-hash-table)))
    (define (get key)
      (hash-get-handle cache key))
    (define (set key value)
      (hash-create-handle! cache key value)
      ;; return value as a side effect.
      value)
    (lambda args
      (apply (case (car args)
               ((get) get)
               ((set) set)
               (else (error "Invalid method")))
             (cdr args)))))

(define (alt-recursive-fn cache n)
  (let ((v (cache 'get n)))
    (cond (v (cdr v))
          ((<= n 3)
           (cache 'set n n))
          (else (cache 'set n
                       (+ (* 1 (alt-recursive-fn cache (- n 1)))
                          (* 2 (alt-recursive-fn cache (- n 2)))
                          (* 3 (alt-recursive-fn cache (- n 3)))))))))
