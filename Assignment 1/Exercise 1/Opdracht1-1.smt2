(define-type pallet (record req::nat weight::nat))

(define nuzzle::(subtype (p::pallet) (and (= (select p weight) 700) (= (select p req) 4))))
(define prittle::(subtype (p::pallet) (and (= (select p weight) 800) (= (select p req) 21))))
(define skipple::(subtype (p::pallet) (and (= (select p weight) 1000) (= (select p req) 8))))
(define crottle::(subtype (p::pallet) (and (= (select p weight) 1500) (= (select p req) 10))))
(define dupple::(subtype (p::pallet) (and (= (select p weight) 100) (= (select p req) 5))))

(define-type truckType 
	(subtype (t::(record maxWeight::nat nrNuz::nat nrPrit::nat nrSkip::nat nrCrot::nat nrDup::nat))
		(and
			(<=
				(+ 
					(* (select t nrNuz) 700)
					(* (select t nrPrit) 800)
					(* (select t nrSkip) 1000)
					(* (select t nrCrot) 1500)
					(* (select t nrDup) 100)
				)
				(select t maxWeight)
			)
			(<=
				(+
					(select t nrNuz)
					(select t nrPrit)
					(select t nrSkip)
					(select t nrCrot)
					(select t nrDup)
				)
				(select t maxPallet)
			)
		)
	)
)
(define-type truck 
	(subtype (t::truckType) 
		(and
			(= (select t maxWeight) 7800)
			(= (select t maxPallet) 8)
			(or
				(= (select t nrPrit) 0)
				(= (select t nrCrot) 0)
			)
		)
	)
)
(define-type noSkippleTruck
	(subtype (t::truck)
		(= (select t nrSkip) 0)
	)
)

(define t1::truck)
(define t2::truck)
(define t3::noSkippleTruck)
(define t4::noSkippleTruck)
(define t5::noSkippleTruck)
(define t6::noSkippleTruck)

(assert 
	(=
		(+
			(select t1 nrNuz)
			(select t2 nrNuz)
			(select t3 nrNuz)
			(select t4 nrNuz)
			(select t5 nrNuz)
			(select t6 nrNuz)
		)
		(select nuzzle req)
	)
)
(assert 
	(=
		(+
			(select t1 nrPrit)
			(select t2 nrPrit)
			(select t3 nrPrit)
			(select t4 nrPrit)
			(select t5 nrPrit)
			(select t6 nrPrit)
		)
		(select prittle req)
	)
)
(assert 
	(=
		(+
			(select t1 nrSkip)
			(select t2 nrSkip)
			(select t3 nrSkip)
			(select t4 nrSkip)
			(select t5 nrSkip)
			(select t6 nrSkip)
		)
		(select skipple req)
	)
)
(assert 
	(=
		(+
			(select t1 nrCrot)
			(select t2 nrCrot)
			(select t3 nrCrot)
			(select t4 nrCrot)
			(select t5 nrCrot)
			(select t6 nrCrot)
		)
		(select crottle req)
	)
)
(assert 
	(=
		(+
			(select t1 nrDup)
			(select t2 nrDup)
			(select t3 nrDup)
			(select t4 nrDup)
			(select t5 nrDup)
			(select t6 nrDup)
		)
		(select dupple req)
	)
)
:formula
(<= (select t1 nrCrot) 8)