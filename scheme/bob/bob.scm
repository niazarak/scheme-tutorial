(define-module (bob)
  #:export (response-for))

(define (response-for str)
	(cond 
		((and (string-any char-alphabetic? str) (equal? str (string-upcase str))) "Whoa, chill out!")
		((string-suffix? "?" str) "Sure.")
		((equal? "" (string-trim-both str)) "Fine. Be that way!")
		(else "Whatever.")
	)
)