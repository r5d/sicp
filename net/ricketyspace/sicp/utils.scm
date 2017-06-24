;;;; Under Creative Commons Attribution-ShareAlike 4.0
;;;; International. See
;;;; <https://creativecommons.org/licenses/by-sa/4.0/>.

(define-module (net ricketyspace sicp utils)
  #:export (runtime))

;; Thanks
;; https://web.archive.org/web/20170624185633/http://community.schemewiki.org/?SICP
(define (runtime) (tms:clock (times)))
