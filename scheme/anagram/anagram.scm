(define-module (anagram)
  #:export (anagrams-for compose))

(define (sort-word word)
	(sort (string->list (string-downcase word)) char>? ))

(define (anagrams-for word wordss)
	(anagrams-for-acc word wordss `())
	)
(define (anagrams-for-acc word wordss result)
	(cond 
		((nil? wordss) result)
		(
			(and 
				(not (string=? (car wordss) word))
				(equal? (sort-word (car wordss)) (sort-word word))
			)
			(anagrams-for-acc word (cdr wordss) (append result (list (car wordss))))
		)
		(else (anagrams-for-acc word (cdr wordss) result))
	)
)