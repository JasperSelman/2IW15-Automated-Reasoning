(define maxTime::int 59)
(define nrJobs::int 12)
(define-type ids (subtype (i::int) (and (>= i 1) (<= i nrJobs))))
(define-type job 
	(subtype (j::(record id::ids runningTime::nat startTime::nat endTime::nat))
		(and 
			(= (select j runningTime) (+ (select j id) 5))
			(= (select j endTime) (+ (select j startTime) (select j runningTime)))
		)
	)
)

(define startAfterEnd::(-> job job bool) (lambda (j1::job j2::job) (<= (select j2 endTime) (select j1 startTime))))
(define startAfterStart::(-> job job bool) (lambda (j1::job j2::job) (<= (select j2 startTime) (select j1 startTime))))
(define notConcurrent::(-> job job bool) (lambda (j1::job j2::job) (or (startAfterEnd j1 j2) (startAfterEnd j2 j1))))

(define j1::(subtype (j::job) (= (select j id) 1)))
(define j2::(subtype (j::job) (= (select j id) 2)))
(define j3::(subtype (j::job) (= (select j id) 3)))
(define j4::(subtype (j::job) (= (select j id) 4)))
(define j5::(subtype (j::job) (= (select j id) 5)))
(define j6::(subtype (j::job) (= (select j id) 6)))
(define j7::(subtype (j::job) (= (select j id) 7)))
(define j8::(subtype (j::job) (= (select j id) 8)))
(define j9::(subtype (j::job) (= (select j id) 9)))
(define j10::(subtype (j::job) (= (select j id) 10)))
(define j11::(subtype (j::job) (= (select j id) 11)))
(define j12::(subtype (j::job) (= (select j id) 12)))

(define time::nat)

(assert (forall (j1::job j2::job) (=> (= (select j1 id) (select j2 id)) (= (select j1 startTime) (select j2 startTime)))))

(assert (startAfterEnd j3 j1))
(assert (startAfterEnd j3 j2))
(assert (startAfterEnd j5 j3))
(assert (startAfterEnd j5 j4))
(assert (startAfterEnd j7 j3))
(assert (startAfterEnd j7 j4))
(assert (startAfterEnd j7 j6))

(assert (startAfterStart j8 j5))

(assert (startAfterEnd j9 j5))
(assert (startAfterEnd j9 j8))
(assert (startAfterEnd j11 j10))
(assert (startAfterEnd j12 j9))
(assert (startAfterEnd j12 j11))

(assert (notConcurrent j5 j7))
(assert (notConcurrent j5 j10))
(assert (notConcurrent j7 j10))

(assert (forall (j::job) (<= (select j endTime) maxTime)))
(assert (forall (j::job) (<= (select j endTime) time)))
(assert (exists (j::job) (= (select j endTime) time)))

(check)
