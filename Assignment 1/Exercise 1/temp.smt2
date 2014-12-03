(define nrPallets::int 5)
(define nrTrucks::int 6)

(define-type pallet (subtype (n::int) (and (>= n 1) (<= n nrPallets))))
(define-type truck (subtype (n::int) (and (>= n 1) (<= n nrTrucks))))

(define load::(tuple truck pallet int))

(assert (forall (t::truck p::pallet) (>= (load t p) 0)))