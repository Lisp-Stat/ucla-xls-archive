(defun jrot (nr n h i a b r) (declare (type fixnum nr))
 (declare (type fixnum n)) (declare (type (simple-array float (* *)) h))
 (declare (type fixnum i)) (declare (type double-float a))
 (declare (type double-float b)) (declare (type double-float r))
 (prog ((j 0) (s 0.0d0) (c 0.0d0) (z 0.0d0) (t_ 0.0d0))
  (declare (type fixnum j)) (declare (type double-float s))
  (declare (type double-float c)) (declare (type double-float z))
  (declare (type double-float t_)) (if (<= (abs a) (abs b)) (go label10))
  (setf t_ (/ b a)) (setf z (sqrt (+ 1.0 (* t_ t_))))
  (setf c (sign (/ 1.0 z) a)) (setf s (* t_ c)) (setf r (* z (abs a)))
  (go label20) label10 (if (= a 0.0) (go label40)) (setf t_ (/ a b))
  (setf z (sqrt (+ 1.0 (* t_ t_)))) (setf s (sign (/ 1.0 z) b))
  (setf c (* t_ s)) (setf r (* z (abs b))) label20
  (fdo ((j i (+ j 1))) ((> j n) nil)
   (tagbody (setf t_ (fref h i j)) (setf z (fref h (+ i 1) j))
    (fset (fref h i j) (+ (* c t_) (* (* -1 s) z)))
    (fset (fref h (+ i 1) j) (+ (* s t_) (* c z)))
  ))
  (go end_label) label40 (setf s (sign 1.0 b)) (setf r (abs b))
  (fdo ((j i (+ j 1))) ((> j n) nil)
   (tagbody (setf t_ (fref h i j))
    (fset (fref h i j) (* (* -1 s) (fref h (+ i 1) j)))
    (fset (fref h (+ i 1) j) (* s t_))
  ))
  (go end_label) end_label (return (values nr n h i a b r))
))

