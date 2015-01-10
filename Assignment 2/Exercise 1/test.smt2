(define matrix::(-> int int int))

(assert (= (matrix 0 0) 0))
(assert (= (matrix 0 1) 0))
(assert (= (matrix 0 2) 0))
(assert (= (matrix 0 3) 0))
(assert (= (matrix 0 4) 1))


(assert (or
(and
(= (matrix 1 0) (mod (+ (matrix 0 0) 1) 3))
(= (matrix 1 1) (matrix 0 1))
(= (matrix 1 2) (if (= (matrix 0 0) 0)(matrix 0 4) (if (= (matrix 0 0) 1)(+ (matrix 0 4) (matrix 0 2))(matrix 0 2))))
(= (matrix 1 3) (matrix 0 3))
(= (matrix 1 4) (if (= (matrix 0 0) 2)(matrix 0 2) (matrix 0 4)))
)
(and
(= (matrix 1 0) (matrix 0 0))
(= (matrix 1 1) (mod (+ (matrix 0 1) 1) 3))
(= (matrix 1 2) (matrix 0 2))
(= (matrix 1 3) (if (= (matrix 0 1) 0)(matrix 0 4) (if (= (matrix 0 1) 1)(+ (matrix 0 4) (matrix 0 3))(matrix 0 3))))
(= (matrix 1 4) (if (= (matrix 0 1) 2)(matrix 0 3) (matrix 0 4)))
)
))

(assert (or
(and
(= (matrix 2 0) (mod (+ (matrix 1 0) 1) 3))
(= (matrix 2 1) (matrix 1 1))
(= (matrix 2 2) (if (= (matrix 1 0) 0)(matrix 1 4) (if (= (matrix 1 0) 1)(+ (matrix 1 4) (matrix 1 2))(matrix 1 2))))
(= (matrix 2 3) (matrix 1 3))
(= (matrix 2 4) (if (= (matrix 1 0) 2)(matrix 1 2) (matrix 1 4)))
)
(and
(= (matrix 2 0) (matrix 1 0))
(= (matrix 2 1) (mod (+ (matrix 1 1) 1) 3))
(= (matrix 2 2) (matrix 1 2))
(= (matrix 2 3) (if (= (matrix 1 1) 0)(matrix 1 4) (if (= (matrix 1 1) 1)(+ (matrix 1 4) (matrix 1 3))(matrix 1 3))))
(= (matrix 2 4) (if (= (matrix 1 1) 2)(matrix 1 3) (matrix 1 4)))
)
))

(assert (or
(and
(= (matrix 3 0) (mod (+ (matrix 2 0) 1) 3))
(= (matrix 3 1) (matrix 2 1))
(= (matrix 3 2) (if (= (matrix 2 0) 0)(matrix 2 4) (if (= (matrix 2 0) 1)(+ (matrix 2 4) (matrix 2 2))(matrix 2 2))))
(= (matrix 3 3) (matrix 2 3))
(= (matrix 3 4) (if (= (matrix 2 0) 2)(matrix 2 2) (matrix 2 4)))
)
(and
(= (matrix 3 0) (matrix 2 0))
(= (matrix 3 1) (mod (+ (matrix 2 1) 1) 3))
(= (matrix 3 2) (matrix 2 2))
(= (matrix 3 3) (if (= (matrix 2 1) 0)(matrix 2 4) (if (= (matrix 2 1) 1)(+ (matrix 2 4) (matrix 2 3))(matrix 2 3))))
(= (matrix 3 4) (if (= (matrix 2 1) 2)(matrix 2 3) (matrix 2 4)))
)
))

(assert (or
(and
(= (matrix 4 0) (mod (+ (matrix 3 0) 1) 3))
(= (matrix 4 1) (matrix 3 1))
(= (matrix 4 2) (if (= (matrix 3 0) 0)(matrix 3 4) (if (= (matrix 3 0) 1)(+ (matrix 3 4) (matrix 3 2))(matrix 3 2))))
(= (matrix 4 3) (matrix 3 3))
(= (matrix 4 4) (if (= (matrix 3 0) 2)(matrix 3 2) (matrix 3 4)))
)
(and
(= (matrix 4 0) (matrix 3 0))
(= (matrix 4 1) (mod (+ (matrix 3 1) 1) 3))
(= (matrix 4 2) (matrix 3 2))
(= (matrix 4 3) (if (= (matrix 3 1) 0)(matrix 3 4) (if (= (matrix 3 1) 1)(+ (matrix 3 4) (matrix 3 3))(matrix 3 3))))
(= (matrix 4 4) (if (= (matrix 3 1) 2)(matrix 3 3) (matrix 3 4)))
)
))

(assert (or
(and
(= (matrix 5 0) (mod (+ (matrix 4 0) 1) 3))
(= (matrix 5 1) (matrix 4 1))
(= (matrix 5 2) (if (= (matrix 4 0) 0)(matrix 4 4) (if (= (matrix 4 0) 1)(+ (matrix 4 4) (matrix 4 2))(matrix 4 2))))
(= (matrix 5 3) (matrix 4 3))
(= (matrix 5 4) (if (= (matrix 4 0) 2)(matrix 4 2) (matrix 4 4)))
)
(and
(= (matrix 5 0) (matrix 4 0))
(= (matrix 5 1) (mod (+ (matrix 4 1) 1) 3))
(= (matrix 5 2) (matrix 4 2))
(= (matrix 5 3) (if (= (matrix 4 1) 0)(matrix 4 4) (if (= (matrix 4 1) 1)(+ (matrix 4 4) (matrix 4 3))(matrix 4 3))))
(= (matrix 5 4) (if (= (matrix 4 1) 2)(matrix 4 3) (matrix 4 4)))
)
))

(assert (or
(and
(= (matrix 6 0) (mod (+ (matrix 5 0) 1) 3))
(= (matrix 6 1) (matrix 5 1))
(= (matrix 6 2) (if (= (matrix 5 0) 0)(matrix 5 4) (if (= (matrix 5 0) 1)(+ (matrix 5 4) (matrix 5 2))(matrix 5 2))))
(= (matrix 6 3) (matrix 5 3))
(= (matrix 6 4) (if (= (matrix 5 0) 2)(matrix 5 2) (matrix 5 4)))
)
(and
(= (matrix 6 0) (matrix 5 0))
(= (matrix 6 1) (mod (+ (matrix 5 1) 1) 3))
(= (matrix 6 2) (matrix 5 2))
(= (matrix 6 3) (if (= (matrix 5 1) 0)(matrix 5 4) (if (= (matrix 5 1) 1)(+ (matrix 5 4) (matrix 5 3))(matrix 5 3))))
(= (matrix 6 4) (if (= (matrix 5 1) 2)(matrix 5 3) (matrix 5 4)))
)
))

(assert (or
(and
(= (matrix 7 0) (mod (+ (matrix 6 0) 1) 3))
(= (matrix 7 1) (matrix 6 1))
(= (matrix 7 2) (if (= (matrix 6 0) 0)(matrix 6 4) (if (= (matrix 6 0) 1)(+ (matrix 6 4) (matrix 6 2))(matrix 6 2))))
(= (matrix 7 3) (matrix 6 3))
(= (matrix 7 4) (if (= (matrix 6 0) 2)(matrix 6 2) (matrix 6 4)))
)
(and
(= (matrix 7 0) (matrix 6 0))
(= (matrix 7 1) (mod (+ (matrix 6 1) 1) 3))
(= (matrix 7 2) (matrix 6 2))
(= (matrix 7 3) (if (= (matrix 6 1) 0)(matrix 6 4) (if (= (matrix 6 1) 1)(+ (matrix 6 4) (matrix 6 3))(matrix 6 3))))
(= (matrix 7 4) (if (= (matrix 6 1) 2)(matrix 6 3) (matrix 6 4)))
)
))

(assert (or
(and
(= (matrix 8 0) (mod (+ (matrix 7 0) 1) 3))
(= (matrix 8 1) (matrix 7 1))
(= (matrix 8 2) (if (= (matrix 7 0) 0)(matrix 7 4) (if (= (matrix 7 0) 1)(+ (matrix 7 4) (matrix 7 2))(matrix 7 2))))
(= (matrix 8 3) (matrix 7 3))
(= (matrix 8 4) (if (= (matrix 7 0) 2)(matrix 7 2) (matrix 7 4)))
)
(and
(= (matrix 8 0) (matrix 7 0))
(= (matrix 8 1) (mod (+ (matrix 7 1) 1) 3))
(= (matrix 8 2) (matrix 7 2))
(= (matrix 8 3) (if (= (matrix 7 1) 0)(matrix 7 4) (if (= (matrix 7 1) 1)(+ (matrix 7 4) (matrix 7 3))(matrix 7 3))))
(= (matrix 8 4) (if (= (matrix 7 1) 2)(matrix 7 3) (matrix 7 4)))
)
))

(assert (or
(and
(= (matrix 9 0) (mod (+ (matrix 8 0) 1) 3))
(= (matrix 9 1) (matrix 8 1))
(= (matrix 9 2) (if (= (matrix 8 0) 0)(matrix 8 4) (if (= (matrix 8 0) 1)(+ (matrix 8 4) (matrix 8 2))(matrix 8 2))))
(= (matrix 9 3) (matrix 8 3))
(= (matrix 9 4) (if (= (matrix 8 0) 2)(matrix 8 2) (matrix 8 4)))
)
(and
(= (matrix 9 0) (matrix 8 0))
(= (matrix 9 1) (mod (+ (matrix 8 1) 1) 3))
(= (matrix 9 2) (matrix 8 2))
(= (matrix 9 3) (if (= (matrix 8 1) 0)(matrix 8 4) (if (= (matrix 8 1) 1)(+ (matrix 8 4) (matrix 8 3))(matrix 8 3))))
(= (matrix 9 4) (if (= (matrix 8 1) 2)(matrix 8 3) (matrix 8 4)))
)
))

(assert (or
(and
(= (matrix 10 0) (mod (+ (matrix 9 0) 1) 3))
(= (matrix 10 1) (matrix 9 1))
(= (matrix 10 2) (if (= (matrix 9 0) 0)(matrix 9 4) (if (= (matrix 9 0) 1)(+ (matrix 9 4) (matrix 9 2))(matrix 9 2))))
(= (matrix 10 3) (matrix 9 3))
(= (matrix 10 4) (if (= (matrix 9 0) 2)(matrix 9 2) (matrix 9 4)))
)
(and
(= (matrix 10 0) (matrix 9 0))
(= (matrix 10 1) (mod (+ (matrix 9 1) 1) 3))
(= (matrix 10 2) (matrix 9 2))
(= (matrix 10 3) (if (= (matrix 9 1) 0)(matrix 9 4) (if (= (matrix 9 1) 1)(+ (matrix 9 4) (matrix 9 3))(matrix 9 3))))
(= (matrix 10 4) (if (= (matrix 9 1) 2)(matrix 9 3) (matrix 9 4)))
)
))

(assert (or
(and
(= (matrix 11 0) (mod (+ (matrix 10 0) 1) 3))
(= (matrix 11 1) (matrix 10 1))
(= (matrix 11 2) (if (= (matrix 10 0) 0)(matrix 10 4) (if (= (matrix 10 0) 1)(+ (matrix 10 4) (matrix 10 2))(matrix 10 2))))
(= (matrix 11 3) (matrix 10 3))
(= (matrix 11 4) (if (= (matrix 10 0) 2)(matrix 10 2) (matrix 10 4)))
)
(and
(= (matrix 11 0) (matrix 10 0))
(= (matrix 11 1) (mod (+ (matrix 10 1) 1) 3))
(= (matrix 11 2) (matrix 10 2))
(= (matrix 11 3) (if (= (matrix 10 1) 0)(matrix 10 4) (if (= (matrix 10 1) 1)(+ (matrix 10 4) (matrix 10 3))(matrix 10 3))))
(= (matrix 11 4) (if (= (matrix 10 1) 2)(matrix 10 3) (matrix 10 4)))
)
))

(assert (or
(and
(= (matrix 12 0) (mod (+ (matrix 11 0) 1) 3))
(= (matrix 12 1) (matrix 11 1))
(= (matrix 12 2) (if (= (matrix 11 0) 0)(matrix 11 4) (if (= (matrix 11 0) 1)(+ (matrix 11 4) (matrix 11 2))(matrix 11 2))))
(= (matrix 12 3) (matrix 11 3))
(= (matrix 12 4) (if (= (matrix 11 0) 2)(matrix 11 2) (matrix 11 4)))
)
(and
(= (matrix 12 0) (matrix 11 0))
(= (matrix 12 1) (mod (+ (matrix 11 1) 1) 3))
(= (matrix 12 2) (matrix 11 2))
(= (matrix 12 3) (if (= (matrix 11 1) 0)(matrix 11 4) (if (= (matrix 11 1) 1)(+ (matrix 11 4) (matrix 11 3))(matrix 11 3))))
(= (matrix 12 4) (if (= (matrix 11 1) 2)(matrix 11 3) (matrix 11 4)))
)
))

(assert (or
(and
(= (matrix 13 0) (mod (+ (matrix 12 0) 1) 3))
(= (matrix 13 1) (matrix 12 1))
(= (matrix 13 2) (if (= (matrix 12 0) 0)(matrix 12 4) (if (= (matrix 12 0) 1)(+ (matrix 12 4) (matrix 12 2))(matrix 12 2))))
(= (matrix 13 3) (matrix 12 3))
(= (matrix 13 4) (if (= (matrix 12 0) 2)(matrix 12 2) (matrix 12 4)))
)
(and
(= (matrix 13 0) (matrix 12 0))
(= (matrix 13 1) (mod (+ (matrix 12 1) 1) 3))
(= (matrix 13 2) (matrix 12 2))
(= (matrix 13 3) (if (= (matrix 12 1) 0)(matrix 12 4) (if (= (matrix 12 1) 1)(+ (matrix 12 4) (matrix 12 3))(matrix 12 3))))
(= (matrix 13 4) (if (= (matrix 12 1) 2)(matrix 12 3) (matrix 12 4)))
)
))

(assert (or
(and
(= (matrix 14 0) (mod (+ (matrix 13 0) 1) 3))
(= (matrix 14 1) (matrix 13 1))
(= (matrix 14 2) (if (= (matrix 13 0) 0)(matrix 13 4) (if (= (matrix 13 0) 1)(+ (matrix 13 4) (matrix 13 2))(matrix 13 2))))
(= (matrix 14 3) (matrix 13 3))
(= (matrix 14 4) (if (= (matrix 13 0) 2)(matrix 13 2) (matrix 13 4)))
)
(and
(= (matrix 14 0) (matrix 13 0))
(= (matrix 14 1) (mod (+ (matrix 13 1) 1) 3))
(= (matrix 14 2) (matrix 13 2))
(= (matrix 14 3) (if (= (matrix 13 1) 0)(matrix 13 4) (if (= (matrix 13 1) 1)(+ (matrix 13 4) (matrix 13 3))(matrix 13 3))))
(= (matrix 14 4) (if (= (matrix 13 1) 2)(matrix 13 3) (matrix 13 4)))
)
))

(assert (or
(and
(= (matrix 15 0) (mod (+ (matrix 14 0) 1) 3))
(= (matrix 15 1) (matrix 14 1))
(= (matrix 15 2) (if (= (matrix 14 0) 0)(matrix 14 4) (if (= (matrix 14 0) 1)(+ (matrix 14 4) (matrix 14 2))(matrix 14 2))))
(= (matrix 15 3) (matrix 14 3))
(= (matrix 15 4) (if (= (matrix 14 0) 2)(matrix 14 2) (matrix 14 4)))
)
(and
(= (matrix 15 0) (matrix 14 0))
(= (matrix 15 1) (mod (+ (matrix 14 1) 1) 3))
(= (matrix 15 2) (matrix 14 2))
(= (matrix 15 3) (if (= (matrix 14 1) 0)(matrix 14 4) (if (= (matrix 14 1) 1)(+ (matrix 14 4) (matrix 14 3))(matrix 14 3))))
(= (matrix 15 4) (if (= (matrix 14 1) 2)(matrix 14 3) (matrix 14 4)))
)
))

(assert (or
(and
(= (matrix 16 0) (mod (+ (matrix 15 0) 1) 3))
(= (matrix 16 1) (matrix 15 1))
(= (matrix 16 2) (if (= (matrix 15 0) 0)(matrix 15 4) (if (= (matrix 15 0) 1)(+ (matrix 15 4) (matrix 15 2))(matrix 15 2))))
(= (matrix 16 3) (matrix 15 3))
(= (matrix 16 4) (if (= (matrix 15 0) 2)(matrix 15 2) (matrix 15 4)))
)
(and
(= (matrix 16 0) (matrix 15 0))
(= (matrix 16 1) (mod (+ (matrix 15 1) 1) 3))
(= (matrix 16 2) (matrix 15 2))
(= (matrix 16 3) (if (= (matrix 15 1) 0)(matrix 15 4) (if (= (matrix 15 1) 1)(+ (matrix 15 4) (matrix 15 3))(matrix 15 3))))
(= (matrix 16 4) (if (= (matrix 15 1) 2)(matrix 15 3) (matrix 15 4)))
)
))

(assert (or
(and
(= (matrix 17 0) (mod (+ (matrix 16 0) 1) 3))
(= (matrix 17 1) (matrix 16 1))
(= (matrix 17 2) (if (= (matrix 16 0) 0)(matrix 16 4) (if (= (matrix 16 0) 1)(+ (matrix 16 4) (matrix 16 2))(matrix 16 2))))
(= (matrix 17 3) (matrix 16 3))
(= (matrix 17 4) (if (= (matrix 16 0) 2)(matrix 16 2) (matrix 16 4)))
)
(and
(= (matrix 17 0) (matrix 16 0))
(= (matrix 17 1) (mod (+ (matrix 16 1) 1) 3))
(= (matrix 17 2) (matrix 16 2))
(= (matrix 17 3) (if (= (matrix 16 1) 0)(matrix 16 4) (if (= (matrix 16 1) 1)(+ (matrix 16 4) (matrix 16 3))(matrix 16 3))))
(= (matrix 17 4) (if (= (matrix 16 1) 2)(matrix 16 3) (matrix 16 4)))
)
))

(assert (or
(and
(= (matrix 18 0) (mod (+ (matrix 17 0) 1) 3))
(= (matrix 18 1) (matrix 17 1))
(= (matrix 18 2) (if (= (matrix 17 0) 0)(matrix 17 4) (if (= (matrix 17 0) 1)(+ (matrix 17 4) (matrix 17 2))(matrix 17 2))))
(= (matrix 18 3) (matrix 17 3))
(= (matrix 18 4) (if (= (matrix 17 0) 2)(matrix 17 2) (matrix 17 4)))
)
(and
(= (matrix 18 0) (matrix 17 0))
(= (matrix 18 1) (mod (+ (matrix 17 1) 1) 3))
(= (matrix 18 2) (matrix 17 2))
(= (matrix 18 3) (if (= (matrix 17 1) 0)(matrix 17 4) (if (= (matrix 17 1) 1)(+ (matrix 17 4) (matrix 17 3))(matrix 17 3))))
(= (matrix 18 4) (if (= (matrix 17 1) 2)(matrix 17 3) (matrix 17 4)))
)
))

(assert (or
(and
(= (matrix 19 0) (mod (+ (matrix 18 0) 1) 3))
(= (matrix 19 1) (matrix 18 1))
(= (matrix 19 2) (if (= (matrix 18 0) 0)(matrix 18 4) (if (= (matrix 18 0) 1)(+ (matrix 18 4) (matrix 18 2))(matrix 18 2))))
(= (matrix 19 3) (matrix 18 3))
(= (matrix 19 4) (if (= (matrix 18 0) 2)(matrix 18 2) (matrix 18 4)))
)
(and
(= (matrix 19 0) (matrix 18 0))
(= (matrix 19 1) (mod (+ (matrix 18 1) 1) 3))
(= (matrix 19 2) (matrix 18 2))
(= (matrix 19 3) (if (= (matrix 18 1) 0)(matrix 18 4) (if (= (matrix 18 1) 1)(+ (matrix 18 4) (matrix 18 3))(matrix 18 3))))
(= (matrix 19 4) (if (= (matrix 18 1) 2)(matrix 18 3) (matrix 18 4)))
)
))

(assert (or
(and
(= (matrix 20 0) (mod (+ (matrix 19 0) 1) 3))
(= (matrix 20 1) (matrix 19 1))
(= (matrix 20 2) (if (= (matrix 19 0) 0)(matrix 19 4) (if (= (matrix 19 0) 1)(+ (matrix 19 4) (matrix 19 2))(matrix 19 2))))
(= (matrix 20 3) (matrix 19 3))
(= (matrix 20 4) (if (= (matrix 19 0) 2)(matrix 19 2) (matrix 19 4)))
)
(and
(= (matrix 20 0) (matrix 19 0))
(= (matrix 20 1) (mod (+ (matrix 19 1) 1) 3))
(= (matrix 20 2) (matrix 19 2))
(= (matrix 20 3) (if (= (matrix 19 1) 0)(matrix 19 4) (if (= (matrix 19 1) 1)(+ (matrix 19 4) (matrix 19 3))(matrix 19 3))))
(= (matrix 20 4) (if (= (matrix 19 1) 2)(matrix 19 3) (matrix 19 4)))
)
))

(assert (or
(and
(= (matrix 21 0) (mod (+ (matrix 20 0) 1) 3))
(= (matrix 21 1) (matrix 20 1))
(= (matrix 21 2) (if (= (matrix 20 0) 0)(matrix 20 4) (if (= (matrix 20 0) 1)(+ (matrix 20 4) (matrix 20 2))(matrix 20 2))))
(= (matrix 21 3) (matrix 20 3))
(= (matrix 21 4) (if (= (matrix 20 0) 2)(matrix 20 2) (matrix 20 4)))
)
(and
(= (matrix 21 0) (matrix 20 0))
(= (matrix 21 1) (mod (+ (matrix 20 1) 1) 3))
(= (matrix 21 2) (matrix 20 2))
(= (matrix 21 3) (if (= (matrix 20 1) 0)(matrix 20 4) (if (= (matrix 20 1) 1)(+ (matrix 20 4) (matrix 20 3))(matrix 20 3))))
(= (matrix 21 4) (if (= (matrix 20 1) 2)(matrix 20 3) (matrix 20 4)))
)
))

(assert (or
(and
(= (matrix 22 0) (mod (+ (matrix 21 0) 1) 3))
(= (matrix 22 1) (matrix 21 1))
(= (matrix 22 2) (if (= (matrix 21 0) 0)(matrix 21 4) (if (= (matrix 21 0) 1)(+ (matrix 21 4) (matrix 21 2))(matrix 21 2))))
(= (matrix 22 3) (matrix 21 3))
(= (matrix 22 4) (if (= (matrix 21 0) 2)(matrix 21 2) (matrix 21 4)))
)
(and
(= (matrix 22 0) (matrix 21 0))
(= (matrix 22 1) (mod (+ (matrix 21 1) 1) 3))
(= (matrix 22 2) (matrix 21 2))
(= (matrix 22 3) (if (= (matrix 21 1) 0)(matrix 21 4) (if (= (matrix 21 1) 1)(+ (matrix 21 4) (matrix 21 3))(matrix 21 3))))
(= (matrix 22 4) (if (= (matrix 21 1) 2)(matrix 21 3) (matrix 21 4)))
)
))

(assert (or
(and
(= (matrix 23 0) (mod (+ (matrix 22 0) 1) 3))
(= (matrix 23 1) (matrix 22 1))
(= (matrix 23 2) (if (= (matrix 22 0) 0)(matrix 22 4) (if (= (matrix 22 0) 1)(+ (matrix 22 4) (matrix 22 2))(matrix 22 2))))
(= (matrix 23 3) (matrix 22 3))
(= (matrix 23 4) (if (= (matrix 22 0) 2)(matrix 22 2) (matrix 22 4)))
)
(and
(= (matrix 23 0) (matrix 22 0))
(= (matrix 23 1) (mod (+ (matrix 22 1) 1) 3))
(= (matrix 23 2) (matrix 22 2))
(= (matrix 23 3) (if (= (matrix 22 1) 0)(matrix 22 4) (if (= (matrix 22 1) 1)(+ (matrix 22 4) (matrix 22 3))(matrix 22 3))))
(= (matrix 23 4) (if (= (matrix 22 1) 2)(matrix 22 3) (matrix 22 4)))
)
))

(assert (or
(and
(= (matrix 24 0) (mod (+ (matrix 23 0) 1) 3))
(= (matrix 24 1) (matrix 23 1))
(= (matrix 24 2) (if (= (matrix 23 0) 0)(matrix 23 4) (if (= (matrix 23 0) 1)(+ (matrix 23 4) (matrix 23 2))(matrix 23 2))))
(= (matrix 24 3) (matrix 23 3))
(= (matrix 24 4) (if (= (matrix 23 0) 2)(matrix 23 2) (matrix 23 4)))
)
(and
(= (matrix 24 0) (matrix 23 0))
(= (matrix 24 1) (mod (+ (matrix 23 1) 1) 3))
(= (matrix 24 2) (matrix 23 2))
(= (matrix 24 3) (if (= (matrix 23 1) 0)(matrix 23 4) (if (= (matrix 23 1) 1)(+ (matrix 23 4) (matrix 23 3))(matrix 23 3))))
(= (matrix 24 4) (if (= (matrix 23 1) 2)(matrix 23 3) (matrix 23 4)))
)
))


(assert (= (matrix 24 4)99))

(check)
