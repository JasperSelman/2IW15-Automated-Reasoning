(benchmark Exercise1-1.smt
:extrafuns ((Truck Int Int Int) (maxWeight Int) (maxPallet Int) (N Int) (RN Int) (WN Int) (P Int) (RP Int) (WP Int) (S Int) (RS Int) (WS Int) (C Int) (RC Int) (WC Int) (D Int) (RD Int) (WD Int))
:formula
(and
;;Define the maximum weight and maximum ammounts of pallets
(= maxWeight 7800)
(= maxPallet 8)

;;The number per type of pallets
(= N 1)
(= P 2)
(= S 3)
(= C 4)
(= D 5)

;;The number per type of pallets
(= RN 4)
(= RP 20);;The max number of Prittles
(= RS 8)
(= RC 10)
(= RD 5)

;;Define the weight per pallettype
(= WN 700)
(= WP 800)
(= WS 1000)
(= WC 1500)
(= WD 100)

;;Check the weight for all the trucks
(forall (?i Int)
	(<= (+ (* (Truck ?i N) 700) (* (Truck ?i P) 800) (* (Truck ?i S) 1000) (* (Truck ?i C) 1500) (* (Truck ?i D) 100)) maxWeight)
)

;;The number of pallets per truck is larger than 0
(forall (?i Int)
	(and
		(>= (Truck ?i N) 0)
		(>= (Truck ?i P) 0)
		(>= (Truck ?i S) 0)
		(>= (Truck ?i C) 0)
		(>= (Truck ?i D) 0)
	)
)

;;The total amount of pallets per truck is at most maxPallet
(forall (?i Int)
	(<= (+ (Truck ?i N) (Truck ?i P) (Truck ?i S) (Truck ?i C) (Truck ?i D)) maxPallet)
)

;;For all trucks the number of prittles or crottles is equal to 0
(forall (?i Int)
	(or
		(= (Truck ?i P) 0)
		(= (Truck ?i C) 0)
	)
)

;;Max two trucks with skipples
(= (+ (Truck 3 S) (Truck 4 S) (Truck 5 S) (Truck 6 S)) 0)

;;Check the total amount of pallets per type
(= (+ (Truck 1 N) (Truck 2 N) (Truck 3 N) (Truck 4 N) (Truck 5 N) (Truck 6 N)) RN)
(= (+ (Truck 1 P) (Truck 2 P) (Truck 3 P) (Truck 4 P) (Truck 5 P) (Truck 6 P)) RP)
(= (+ (Truck 1 S) (Truck 2 S) (Truck 3 S) (Truck 4 S) (Truck 5 S) (Truck 6 S)) RS)
(= (+ (Truck 1 C) (Truck 2 C) (Truck 3 C) (Truck 4 C) (Truck 5 C) (Truck 6 C)) RC)
(= (+ (Truck 1 D) (Truck 2 D) (Truck 3 D) (Truck 4 D) (Truck 5 D) (Truck 6 D)) RD)
)
)