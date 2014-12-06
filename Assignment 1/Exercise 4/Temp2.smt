(benchmark Temp2.smt
	:extrafuns (
		(size int) (steps int) (Values int int int)
	) 
	:formula ( and 
		(= steps 5)
		(= size 8)
		
		(forall (?i int) 
			(and
				(= (Values ?i 1) 1)
				(= (Values ?i size) size)
				(= (Values 0 ?i) ?i)
			)
		)
		
		(forall (?i int)
			(implies
				(and
					(>= ?i 1)
					(<= ?i steps)
				)
				(forall (?k int)
					(implies
						(and
							(> ?k 1)
							(< ?k size)
						)
						(or
							(= (Values ?i ?k) (Values (- ?i 1) ?k))
							(= 
								(Values ?i ?k)
								(+
									(Values (- ?i 1) (- ?k 1))
									(Values (- ?i 1) (+ ?k 1))
								)
							)
						)
					)
				)
			)
		)
	)
)
