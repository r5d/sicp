;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.
;;;;
;;;;  _____
;;;; < 42! >
;;;;  -----
;;;;   \                 __
;;;;    \               (**)
;;;;     \              (U )
;;;;      \             /--\
;;;;        __         / \  \
;;;;       U**U\.'@@@@@@`.\  )
;;;;       \__/(@@@@@@@@@@) /
;;;;            (@@@@@@@@)((
;;;;            `YY~~~~YY' \\
;;;;             ||    ||   >>
;;;;

(define-module (net ricketyspace sicp one fortytwo)
  #:export (sicp-compose inc square))

(define (sicp-compose f g)
  (lambda (x) (f (g x))))

(define (inc x) (1+ x))
(define (square x) (* x x))

;;; GNU Guile REPL

;;; scheme@(guile-user)> ,use (net ricketyspace sicp one fortytwo)
;;; scheme@(guile-user)> ((sicp-compose square inc) 6)
;;; $21 = 49
;;; scheme@(guile-user)> ((sicp-compose square inc) 8)
;;; $22 = 81
