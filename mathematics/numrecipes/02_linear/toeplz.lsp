(require "f2cl_macros")

(defun toeplz (r x y n &key (nmax 100))
 (declare (type (simple-array double-float (*)) r))
 (declare (type (simple-array double-float (*)) x))
 (declare (type (simple-array double-float (*)) y)) (declare (type fixnum n))
 (declare (type fixnum nmax))
 (prog
  ((g (make-array nmax :element-type 'double-float))
   (h (make-array nmax :element-type 'double-float)) (qt2 0.0d0) (qt1 0.0d0)
   (pt2 0.0d0) (pt1 0.0d0) (qq 0.0d0) (pp 0.0d0) (m2 0) (k 0) (sgd 0.0d0)
   (shn 0.0d0) (sgn 0.0d0) (j 0) (sd 0.0d0) (sxn 0.0d0) (m1 0) (m 0)
  )
  (declare (type (simple-array double-float (*)) g))
  (declare (type (simple-array double-float (*)) h))
  (declare (type double-float qt2)) (declare (type double-float qt1))
  (declare (type double-float pt2)) (declare (type double-float pt1))
  (declare (type double-float qq)) (declare (type double-float pp))
  (declare (type fixnum m2)) (declare (type fixnum k))
  (declare (type double-float sgd)) (declare (type double-float shn))
  (declare (type double-float sgn)) (declare (type fixnum j))
  (declare (type double-float sd)) (declare (type double-float sxn))
  (declare (type fixnum m1)) (declare (type fixnum m))
  (if (= (fref r n) 0.0) (go label99))
  (fset (fref x 1) (/ (fref y 1) (fref r n))) (if (= n 1) (go end_label))
  (fset (fref g 1) (/ (fref r (+ n (- 1))) (fref r n)))
  (fset (fref h 1) (/ (fref r (+ n 1)) (fref r n)))
  (fdo ((m 1 (+ m 1))) ((> m n) nil)
   (tagbody (setf m1 (+ m 1)) (setf sxn (- (fref y m1)))
    (setf sd (- (fref r n)))
    (fdo ((j 1 (+ j 1))) ((> j m) nil)
     (tagbody (setf sxn (+ sxn (* (fref r (+ (+ n m1) (- j))) (fref x j))))
      (setf sd
       (+ sd (* (fref r (+ (+ n m1) (- j))) (fref g (+ (+ m (- j)) 1))))
    )))
    (if (= sd 0.0) (go label99)) (fset (fref x m1) (/ sxn sd))
    (fdo ((j 1 (+ j 1))) ((> j m) nil)
     (tagbody
      (fset (fref x j)
       (+ (fref x j) (* (* -1 (fref x m1)) (fref g (+ (+ m (- j)) 1))))
    )))
    (if (= m1 n) (go end_label)) (setf sgn (- (fref r (+ n (- m1)))))
    (setf shn (- (fref r (+ n m1)))) (setf sgd (- (fref r n)))
    (fdo ((j 1 (+ j 1))) ((> j m) nil)
     (tagbody (setf sgn (+ sgn (* (fref r (+ (+ n j) (- m1))) (fref g j))))
      (setf shn (+ shn (* (fref r (+ (+ n m1) (- j))) (fref h j))))
      (setf sgd
       (+ sgd (* (fref r (+ (+ n j) (- m1))) (fref h (+ (+ m (- j)) 1))))
    )))
    (if (or (= sd 0.0) (= sgd 0.0)) (go label99))
    (fset (fref g m1) (/ sgn sgd)) (fset (fref h m1) (/ shn sd)) (setf k m)
    (setf m2 (/ (+ m 1) 2)) (setf pp (fref g m1)) (setf qq (fref h m1))
    (fdo ((j 1 (+ j 1))) ((> j m2) nil)
     (tagbody (setf pt1 (fref g j)) (setf pt2 (fref g k)) (setf qt1 (fref h j))
      (setf qt2 (fref h k)) (fset (fref g j) (+ pt1 (* (* -1 pp) qt2)))
      (fset (fref g k) (+ pt2 (* (* -1 pp) qt1)))
      (fset (fref h j) (+ qt1 (* (* -1 qq) pt2)))
      (fset (fref h k) (+ qt2 (* (* -1 qq) pt1))) (setf k (+ k (- 1)))
  ))))
  (error "never get here") label99
  (error "Levinson method fails: singular principal minor") end_label
  (return (values r x y n))
))

