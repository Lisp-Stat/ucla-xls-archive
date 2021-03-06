(defun cexpli (mo z w) (declare (type fixnum mo)) (declare (type complex z))
 (declare (type complex w))
 (prog
  ((ind nil) (g0 (make-array '(2) :element-type 'float))
   (gn (make-array '(2) :element-type 'float))
   (h0 (make-array '(2) :element-type 'float))
   (hn (make-array '(2) :element-type 'float))
   (wn (make-array '(2) :element-type 'float))
   (qf (make-array '(2) :element-type 'float))
   (sm (make-array '(2) :element-type 'float))
   (tm (make-array '(2) :element-type 'float))
   (ts (make-array '(2) :element-type 'float))
   (cd (make-array '(18) :element-type 'float))
   (ce (make-array '(18) :element-type 'float)) (n 0.0d0) (np1 0.0d0)
   (sy 0.0d0) (cy 0.0d0) (qm 0.0d0) (c 0.0d0) (e 0.0d0) (tol 0.0d0) (u 0.0d0)
   (d 0.0d0) (ss 0.0d0) (i 0) (euler 0.0d0) (r 0.0d0) (y 0.0d0) (eps 0.0d0)
   (x 0.0d0)
  )
  (declare (type t ind)) (declare (type (simple-array float (*)) g0))
  (declare (type (simple-array float (*)) gn))
  (declare (type (simple-array float (*)) h0))
  (declare (type (simple-array float (*)) hn))
  (declare (type (simple-array float (*)) wn))
  (declare (type (simple-array float (*)) qf))
  (declare (type (simple-array float (*)) sm))
  (declare (type (simple-array float (*)) tm))
  (declare (type (simple-array float (*)) ts))
  (declare (type (simple-array float (*)) cd))
  (declare (type (simple-array float (*)) ce)) (declare (type float n))
  (declare (type float np1)) (declare (type double-float sy))
  (declare (type double-float cy)) (declare (type double-float qm))
  (declare (type double-float c)) (declare (type double-float e))
  (declare (type double-float tol)) (declare (type double-float u))
  (declare (type double-float d)) (declare (type double-float ss))
  (declare (type fixnum i)) (declare (type double-float euler))
  (declare (type double-float r)) (declare (type double-float y))
  (declare (type double-float eps)) (declare (type double-float x))
  (fset (anorm x y) (amax1 (abs x) (abs y))) (setq pi 3.1415927)
  (setq euler 0.5772157) (replace cd '(18.032295) :end 0)
  (replace cd '(13.212207) :end 0) (replace cd '(9.978145) :end 0)
  (replace cd '(7.622735) :end 0) (replace cd '(5.8505826) :end 0)
  (replace cd '(4.4958334) :end 0) (replace cd '(3.4509845) :end 0)
  (replace cd '(2.6405241) :end 0) (replace cd '(2.008868) :end 0)
  (replace cd '(1.5140048) :end 0) (replace cd '(1.1238425) :end 0)
  (replace cd '(0.8140421) :end 0) (replace cd '(0.56676626) :end 0)
  (replace cd '(0.36993143) :end 0) (replace cd '(0.21653233) :end 0)
  (replace cd '(0.10366126) :end 0) (replace cd '(0.031110596) :end 0)
  (replace cd '(0.0) :end 0) (replace ce '(9.1028156E-8) :end 0)
  (replace ce '(7.021509E-6) :end 0) (replace ce '(1.2657979E-4) :end 0)
  (replace ce '(9.926124E-4) :end 0) (replace ce '(0.0044380296) :end 0)
  (replace ce '(0.013220164) :end 0) (replace ce '(0.02908227) :end 0)
  (replace ce '(0.050859615) :end 0) (replace ce '(0.07473984) :end 0)
  (replace ce '(0.09634194) :end 0) (replace ce '(0.11262142) :end 0)
  (replace ce '(0.12231444) :end 0) (replace ce '(0.12509663) :end 0)
  (replace ce '(0.12042472) :end 0) (replace ce '(0.10704758) :end 0)
  (replace ce '(0.08368174) :end 0) (replace ce '(0.050503746) :end 0)
  (replace ce '(0.008501565) :end 0) (setf eps (spmpar 1)) (setf x (real z))
  (setf y (aimag z)) (setf r (cpabs x y)) (setf eps (amax1 eps 1.0E-15))
  (if (<= r 1.0) (go label20)) (if (>= r 40.0) (go label60))
  (if (< r 4.0) (go label10)) (if (or (<= x 0.0) (> (abs y) 8.0)) (go label60))
  (if (and (< r 10.0) (> (abs y) (* 1.8 x))) (go label60)) (go label20) label10
  (if (< x (* (* 0.09 y) y)) (go label50))
  (if (and (> r 3.6) (> (abs y) (* 1.8 x))) (go label60)) label20
  (fset (fref sm 1) 0.0) (fset (fref sm 2) 0.0) (fset (fref tm 1) x)
  (fset (fref tm 2) y) (setf n 1.0) label30 (setf n (+ n 1.0))
  (fset (fref ts 1) (+ (* (fref tm 1) x) (* (* -1 (fref tm 2)) y)))
  (fset (fref ts 2) (+ (* (fref tm 1) y) (* (fref tm 2) x)))
  (fset (fref tm 1) (/ (fref ts 1) n)) (fset (fref tm 2) (/ (fref ts 2) n))
  (fset (fref ts 1) (/ (fref tm 1) n)) (fset (fref ts 2) (/ (fref tm 2) n))
  (fset (fref sm 1) (+ (fref sm 1) (fref ts 1)))
  (fset (fref sm 2) (+ (fref sm 2) (fref ts 2)))
  (if
   (> (anorm (fref ts 1) (fref ts 2)) (* eps (anorm (fref sm 1) (fref sm 2))))
   (go label30)
  )
  (fset (fref sm 1) (+ x (fref sm 1))) (fset (fref sm 2) (+ y (fref sm 2)))
  (fset (fref sm 1) (+ (+ euler (alog r)) (fref sm 1)))
  (fset (fref sm 2) (+ (atan2 (- y) (- x)) (fref sm 2))) (go label110) label50
  (fset (fref sm 1) 0.0) (fset (fref sm 2) 0.0)
  (fdo ((i 1 (+ i 1))) ((> i 18) nil)
   (tagbody (fset (fref ts 1) (+ x (- (fref cd i)))) (fset (fref ts 2) y)
    (setf ss (+ (* (fref ts 1) (fref ts 1)) (* (fref ts 2) (fref ts 2))))
    (fset (fref sm 1) (+ (fref sm 1) (/ (* (fref ce i) (fref ts 1)) ss)))
    (fset (fref sm 2) (+ (fref sm 2) (/ (* (* -1 (fref ce i)) (fref ts 2)) ss))
  )))
  (go label100) label60 (setf x (- x)) (setf y (- y)) (setf d (* 4.0 r))
  (if (< r 10.0) (setf d 32.0)) (fset (fref g0 1) 1.0) (fset (fref g0 2) 0.0)
  (fset (fref gn 1) (/ (+ 1.0 x) d)) (fset (fref gn 2) (/ y d))
  (fset (fref h0 1) 1.0) (fset (fref h0 2) 0.0) (setf u (+ x 2.0))
  (fset (fref hn 1) (/ u d)) (fset (fref hn 2) (fref gn 2))
  (setf w (/ (cmplx (+ 1.0 x) y) (cmplx u y))) (fset (fref wn 1) (real w))
  (fset (fref wn 2) (aimag w)) (setf np1 1.0) (setf tol (* 4.0 eps)) label70
  (setf n np1) (setf np1 (+ n 1.0)) (setf e (/ (* n np1) d)) (setf u (+ u 2.0))
  (fset (fref tm 1)
   (/
    (+ (+ (* u (fref gn 1)) (* (* -1 y) (fref gn 2))) (* (* -1 e) (fref g0 1)))
    d
  ))
  (fset (fref tm 2)
   (/ (+ (+ (* u (fref gn 2)) (* y (fref gn 1))) (* (* -1 e) (fref g0 2))) d)
  )
  (fset (fref g0 1) (fref gn 1)) (fset (fref g0 2) (fref gn 2))
  (fset (fref gn 1) (fref tm 1)) (fset (fref gn 2) (fref tm 2))
  (fset (fref tm 1)
   (/
    (+ (+ (* u (fref hn 1)) (* (* -1 y) (fref hn 2))) (* (* -1 e) (fref h0 1)))
    d
  ))
  (fset (fref tm 2)
   (/ (+ (+ (* u (fref hn 2)) (* y (fref hn 1))) (* (* -1 e) (fref h0 2))) d)
  )
  (fset (fref h0 1) (fref hn 1)) (fset (fref h0 2) (fref hn 2))
  (fset (fref hn 1) (fref tm 1)) (fset (fref hn 2) (fref tm 2))
  (fset (fref tm 1) (fref wn 1)) (fset (fref tm 2) (fref wn 2))
  (setf w (/ (cmplx (fref gn 1) (fref gn 2)) (cmplx (fref hn 1) (fref hn 2))))
  (fset (fref wn 1) (real w)) (fset (fref wn 2) (aimag w))
  (if
   (> (anorm (+ (fref tm 1) (- (fref wn 1))) (+ (fref tm 2) (- (fref wn 2))))
    (* tol (anorm (fref wn 1) (fref wn 2)))
   )
   (go label70)
  )
  (setf x (real z)) (setf y (aimag z)) (setf w (/ w z))
  (fset (fref sm 1) (real w)) (fset (fref sm 2) (aimag w)) label100
  (setf ind (or (<= x 0.0) (> (abs y) 0.01)))
  (if (and ind (/= mo 0)) (go label130)) (setf c pi_)
  (if (> y 0.0) (setf c (- pi_))) (setf qm (exp x)) (setf cy (cos y))
  (setf sy (sin y)) (fset (fref qf 1) (* qm cy)) (fset (fref qf 2) (* qm sy))
  (if (= mo 0) (go label120)) (setf r (/ c qm))
  (fset (fref sm 1) (+ (fref sm 1) (* r sy)))
  (fset (fref sm 2) (+ (fref sm 2) (* r cy))) (go label130) label110
  (if (= mo 0) (go label130)) (setf ind true) (setf qm (exp (- x)))
  (fset (fref qf 1) (* qm (cos (- y)))) (fset (fref qf 2) (* qm (sin (- y))))
  label120
  (fset (fref ts 1)
   (+ (* (fref qf 1) (fref sm 1)) (* (* -1 (fref qf 2)) (fref sm 2)))
  )
  (fset (fref ts 2) (+ (* (fref qf 1) (fref sm 2)) (* (fref qf 2) (fref sm 1)))
  )
  (fset (fref sm 1) (fref ts 1)) (fset (fref sm 2) (fref ts 2))
  (if (not ind) (fset (fref sm 2) (+ (fref sm 2) c))) label130
  (setf w (cmplx (fref sm 1) (fref sm 2))) (return (values mo z w))
))

