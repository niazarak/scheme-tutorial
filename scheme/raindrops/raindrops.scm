(define-module (raindrops)
  #:export (convert))

(define (convert num)
	(let ((ret-num-if-empty (lambda (str) (if (string-null? str) (number->string num) str)))
		  (check-rem (lambda (n rem mess) (if (and (>= n rem) (= (remainder n rem) 0)) mess ""))))
		(ret-num-if-empty 
			(string-append 
				(check-rem num 3 "Pling")
				(check-rem num 5 "Plang")
				(check-rem num 7 "Plong")
			)
		)
	)
)