(define-module (leap-year)
  #:export (leap-year?))

(define (leap-year? x)
	(or 
		(= (modulo x 400) 0)
		(and 
			(= (modulo x 4) 0)
			(not (= (modulo x 100) 0))
		)
	))