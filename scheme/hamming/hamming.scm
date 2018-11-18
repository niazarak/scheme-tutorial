(define-module (hamming)
  #:export (hamming-distance))


(define (hamming-distance s1 s2)
	(hamming-distance-list (string->list s1) (string->list s2))
)

(define (hamming-distance-list s1 s2)
	(cond 
		((and (null? s1) (null? s2)) 0)
		(else 
			(+ 
				(cond 
					((eq? (car s1) (car s2)) 0)
					(else 1))
				(hamming-distance-list (cdr s1) (cdr s2))
			)
		)
	)
)