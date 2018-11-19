(define-module (dna)
  #:export (to-rna))

(define (to-rna dna)
	(string-map convert dna)
)

(define (convert nuc)
	(case nuc
		((#\G) #\C)
		((#\C) #\G)
		((#\T) #\A)
		((#\A) #\U)
	)
)