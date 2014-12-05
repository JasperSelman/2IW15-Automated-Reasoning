(benchmark Temp2.smt
	:extrafuns (
		(steps int) (Values int int int)
	) 
	:formula ( and 
		(= steps 5)
		
		(or
			(= (Values steps 1) 157)
			(= (Values steps 2) 157)
			(= (Values steps 3) 157)
			(= (Values steps 4) 157)
			(= (Values steps 5) 157)
			(= (Values steps 6) 157)
			(= (Values steps 7) 157)
			(= (Values steps 8) 157)
		)
	)
)
