(define-module (robot)
  #:export (build-robot
            robot-name
            reset-name)
  #:autoload (srfi srfi-1) (iota))

(define robots (make-hash-table))

(define (robot-name robot)
	(hash-ref robots (robot)))

(define (reset-name robot)
	(hashq-set! robots (robot) (make-new-name)))

(define (build-robot)
	(let* (
		(id (hash-count (const #t) robots))
		(handle (lambda () id))
	)
	(hashq-set! robots (handle) (make-new-name))
	handle		
	)
)

(define (make-new-name)
	; todo: use hashset to keep taken names in order to reduce lookup complexity
	(let ((name (generate-name)))
		(cond 
			; this name has not been taken, return it
			((= 0 (hash-count (lambda (key value) (string=? value name)) robots)) name)
			
			; this name has been taken, because random names count exceeded, clean all names and return it
			((= 676000 (hash-count (const #t) robots)) (hash-clear! robots) name)

			; this name has been taken, make a new name
			(else (make-new-name))
		)
	)
	)

(define (generate-name)
	(list->string (map (lambda (args) (apply random-char args)) 
		`((#\A #\Z) (#\A #\Z) (#\0 #\9) (#\0 #\9) (#\0 #\9)))))
	

(define (random-char from to)
	(integer->char (+ (char->integer from) (random (- (char->integer to) (char->integer from))))))