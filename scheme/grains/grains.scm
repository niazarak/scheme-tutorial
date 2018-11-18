(define-module (grains)
  #:export (square total square-rec)
  #:autoload (srfi srfi-1) (iota))

(define (square-rec n)
	(if (= n 1)
		1
		(* 2 (square (- n 1))
	)
  )
)

; inspired by SICP
; this is actually iterative
(define (square n)
	(square-iter n 1)
	)

(define (square-iter count acc)
	(if (= count 1)
		acc
		(square-iter (- count 1) (* 2 acc))
	))

(define (total)
	(- (square 65) 1)
  )
