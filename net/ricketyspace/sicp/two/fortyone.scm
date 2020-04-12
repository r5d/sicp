;;;; License: CC0-1.0
;;;;
;;;;  ___________________________________
;;;; < let's make some distinct bastards >
;;;;  -----------------------------------
;;;;      \
;;;;       \
;;;;              ,;;;;;;;,
;;;;             ;;;;;;;;;;;,
;;;;            ;;;;;'_____;'
;;;;            ;;;(/))))|((\
;;;;            _;;((((((|))))
;;;;           / |_\\\\\\\\\\\\
;;;;      .--~(  \ ~))))))))))))
;;;;     /     \  `\-(((((((((((\\
;;;;     |    | `\   ) |\       /|)
;;;;      |    |  `. _/  \_____/ |
;;;;       |    , `\~            /
;;;;        |    \  \           /
;;;;       | `.   `\|          /
;;;;       |   ~-   `\        /
;;;;        \____~._/~ -_,   (\
;;;;         |-----|\   \    ';;
;;;;        |      | :;;;'     \
;;;;       |  /    |            |
;;;;       |       |            |
;;;;


(define-module (net ricketyspace sicp two fortyone)
  #:export (bastard-triplets))


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


(define (bastard-triplets n s)
  (define (spawn-triplet i n)
    (flatmap (lambda (j)
               (map (lambda (k) (list i j k))
                    (enumerate-interval 1 n)))
             (enumerate-interval 1 n)))

  (define (spawn-triplets n)
    (flatmap (lambda (i) (spawn-triplet i n))
             (enumerate-interval 1 n)))

  (define (distinct-sum-equals-s? triplet)
    (let ((i (car triplet))
          (j (cadr triplet))
          (k (caddr triplet)))
      (and
       ;; check if i, j, k are distinct.
       (cond ((= i j) #f)
             ((= i k) #f)
             ((= j k) #f)
             (else #t))
       ;; check if i + j + k = s
       (= (+ i j k) s))))

  (filter distinct-sum-equals-s? (spawn-triplets n)))

;;;
;;; Guile REPL
;;;
;;; scheme@(guile-user)> ,re (net ricketyspace sicp two fortyone)
;;; scheme@(guile-user)> (bastard-triplets 10 6)
;;; $8 = ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))
;;;
