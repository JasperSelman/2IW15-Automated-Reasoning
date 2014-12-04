(define nrPallets::int 5)
(define nrTrucks::int 6)
(define maxWeight::int 7800)
(define maxPallet::int 8)

(define-type pallet (subtype (n::int) (and (>= n 1) (<= n nrPallets))))
(define-type truck (subtype (n::int) (and (>= n 1) (<= n nrTrucks))))

(define load::(tuple truck pallet int))

(define palletsLoaded::(-> pallet int) (lambda (p::pallet) (+ (load 1 p) (load 2 p) (load 3 p) (load 4 p) (load 5 p) (load 6 p))))
(define palletsInTruck::(-> truck int) (lambda (t::truck) (+ (load t 1) (load t 2) (load t 3) (load t 4) (load t 5))))
(define truckWeight::(-> truck int) (lambda (t::truck) (+
			(* (load t 1) 700)
			(* (load t 2) 800)
			(* (load t 3) 1000)
			(* (load t 4) 1500)
			(* (load t 5) 100)
		)))
(define hasSkipples::(-> truck int) (lambda (t::truck) (if (> (load t 3) 0) 1 0)))
(define nrSkippleTrucks::int (+ (hasSkipples 1) (hasSkipples 2) (hasSkipples 3) (hasSkipples 4) (hasSkipples 5) (hasSkipples 6)))

(assert (= (palletsLoaded 1) 4))
(assert (= (palletsLoaded 2) 5))
(assert (= (palletsLoaded 3) 8))
(assert (= (palletsLoaded 4) 10))
(assert (= (palletsLoaded 5) 5))

(assert (forall (t::truck) (<= (truckWeight t) maxWeight)))
(assert (forall (t::truck) (and (>= (palletsInTruck t) 0) (<= (palletsInTruck t) maxPallet))))
(assert (<= nrSkippleTrucks 2))
(assert (forall (t::truck) (or (= (load t 2) 0) (= (load t 4) 0))))

(check)