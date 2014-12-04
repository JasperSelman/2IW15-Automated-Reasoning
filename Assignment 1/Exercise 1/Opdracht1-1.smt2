(define-type pallet (record id::nat req::nat))

(define nuzzle::(subtype (p::pallet) (= (select p req) 4)))
(define prittle::(subtype (p::pallet)  (= (select p req) 266)))
(define skipple::(subtype (p::pallet) (= (select p req) 8)))
(define crottle::(subtype (p::pallet) (= (select p req) 10)))
(define dupple::(subtype (p::pallet) (= (select p req) 5)))

(define-type truckType 
	(record maxWeight::nat maxPallet::nat)
)
(define-type truck 
	(subtype (t::truckType) 
		(and
			(= (select t maxWeight) 7800)
			(= (select t maxPallet) 8)
		)
	)
)

(define t1::truck)
(define t2::truck)
(define t3::truck)
(define t4::truck)
(define t5::truck)
(define t6::truck)

(define load::(tuple truck pallet nat))

(assert
	(forall (p::pallet)
		(=
			(+
				(load t1 p)
				(load t2 p)
				(load t3 p)
				(load t4 p)
				(load t5 p)
				(load t6 p)
			)
			(select p req)
		)
	)
)

(assert
	(and
		(>= (load t1 skipple) 0)
		(>= (load t2 skipple) 0)
		(= (load t3 skipple) 0)
		(= (load t4 skipple) 0)
		(= (load t5 skipple) 0)
		(= (load t6 skipple) 0)
	)
)

(assert
	(forall (t::truck)
		(or
			(= (load t prittle) 0)
			(= (load t crottle) 0)
		)
	)
)

(assert
	(forall (t::truck)
		(<=
			(+ 
				(* (load t nuzzle) 700)
				(* (load t prittle) 800)
				(* (load t skipple) 1000)
				(* (load t crottle) 1500)
				(* (load t dupple) 100)
			)
			(select t maxWeight)
		)
	)
)

(assert
	(forall (t::truck)
		(<=
			(+ 
				(load t nuzzle)
				(load t prittle)
				(load t skipple)
				(load t crottle)
				(load t dupple)
			)
			(select t maxPallet)
		)
	)
)