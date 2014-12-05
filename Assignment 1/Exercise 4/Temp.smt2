(define steps::int 8)

(define-type range (subrange 1 8))
(define-type adaptable (subrange 2 7))
(define-type row (subrange 0 steps))
(define-type adaptableRow (subrange 1 steps))

(define matrix::(tuple row range int))

(define calculateValue::(-> row adaptable int) (lambda (r::row a::adaptable) 
	(+
		(matrix (- r 1) (- a 1))
		(matrix (- r 1) (+ a 1))
	)
))
(define nrChanged::(-> row int) (lambda (r::row a::adaptable) 
	(+
		(if (= (matrix r 2) (matrix (- r 1) 2)) 0 1)
		(if (= (matrix r 3) (matrix (- r 1) 3)) 0 1)
		(if (= (matrix r 4) (matrix (- r 1) 4)) 0 1)
		(if (= (matrix r 5) (matrix (- r 1) 5)) 0 1)
		(if (= (matrix r 6) (matrix (- r 1) 6)) 0 1)
		(if (= (matrix r 7) (matrix (- r 1) 7)) 0 1)
	)
))

(assert (forall (r::row)
	(and
		(=
			(matrix r 1)
			1
		)
		(=
			(matrix r 8)
			8
		)
	)
))

(assert (= (matrix 0 2) 2))
(assert (= (matrix 0 3) 3))
(assert (= (matrix 0 4) 4))
(assert (= (matrix 0 5) 5))
(assert (= (matrix 0 6) 6))
(assert (= (matrix 0 7) 7))

(assert (forall (r::adaptableRow a::adaptable)
	(or
		(= (matrix r a) (calculateValue r a))
		(= (matrix r a) (matrix (- r 1) a))
	)
))

(assert (forall (r::adaptableRow) (= (nrChanged r) 1)))

(assert (exists (a::adaptable) (= (matrix steps a) 157)))

(check)