(defun kml (ind z k1 k2) (declare (type fixnum ind)) (declare (type complex z))
 (declare (type complex k1)) (declare (type complex k2))
 (prog
  ((bi 0.0d0) (u1 0.0d0) (u2 0.0d0) (u3 0.0d0) (s 0.0d0) (e 0.0d0) (ai 0.0d0)
   (al 0.0d0) (i 0) (l 0) (r 0.0d0) (m 0) (c1 0.0d0) (c 0.0d0) (b 0.0d0)
   (a 0.0d0) (x2 0.0d0) (x1 0.0d0) (eps 0.0d0)
  )
  (declare (type complex bi)) (declare (type complex u1))
  (declare (type complex u2)) (declare (type complex u3))
  (declare (type complex s)) (declare (type complex e))
  (declare (type double-float ai)) (declare (type double-float al))
  (declare (type fixnum i)) (declare (type fixnum l))
  (declare (type double-float r)) (declare (type fixnum m))
  (declare (type double-float c1)) (declare (type double-float c))
  (declare (type double-float b)) (declare (type double-float a))
  (declare (type double-float x2)) (declare (type double-float x1))
  (declare (type double-float eps)) (setq c1 1.2533141) (setf eps (spmpar 1))
  (setf x1 (real z)) (setf x2 (aimag z))
  (multiple-value-setq (x1 x2 r th) (capo x1 x2 r th))
  (setf a (/ 3.0 (+ 1.0 r))) (setf b (/ 14.7 (+ 28.0 r)))
  (setf c (/ 2.0 (* (* c1 eps) (expt (* 2.0 r) 0.25))))
  (setf m
   (+
    (/
     (* (/ 0.485 r)
      (expt (+ (alog c) (/ (* r (cos (* a th))) (+ 1.0 (* 0.008 r)))) 2)
     )
     (expt (* 2.0 (cos (* b th))) 2)
    )
    1.5
  ))
  (setf s 0.0) (setf u2 0.0) (setf u1 eps) (setf l m)
  (fdo ((i 1 (+ i 1))) ((> i m) nil)
   (tagbody (setf al l) (setf u3 u2) (setf u2 u1)
    (setf ai
     (/ (+ (expt (+ al (- 0.5)) 2) (/ (* -1 1.0) 9.0)) (* al (+ al 1.0)))
    )
    (setf bi (/ (* 2.0 (+ al z)) (+ al 1.0)))
    (setf u1 (/ (+ (* bi u2) (- u3)) ai)) (setf s (+ s u1))
    (setf l (+ l (- 1)))
  ))
  (setf k1 (/ (* c1 u1) (* s (csqrt z))))
  (setf k2 (/ (* k1 (+ (+ z (/ 1.0 6.0)) (/ (* -1 u2) u1))) z))
  (if (/= ind 0) (go end_label)) (setf e (cexp (- z))) (setf k1 (* k1 e))
  (setf k2 (* k2 e)) (go end_label) end_label (return (values ind z k1 k2))
))

