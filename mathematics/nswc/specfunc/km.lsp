(defun km (k2) (declare (type complex k2))
 (prog
  ((an 0.0d0) (s1 0.0d0) (km 0.0d0) (hpi 0.0d0) (c 0.0d0) (ri 0.0d0) (i 0)
   (tol 0.0d0) (eps 0.0d0)
  )
  (declare (type complex an)) (declare (type complex s1))
  (declare (type complex km)) (declare (type double-float hpi))
  (declare (type double-float c)) (declare (type double-float ri))
  (declare (type fixnum i)) (declare (type double-float tol))
  (declare (type double-float eps)) (setq hpi 1.5707964) (setf eps (spmpar 1))
  (setf tol (amax1 eps 1.0E-14)) (setf s1 (complex 1.0 0.0))
  (setf an (complex 1.0 0.0))
  (fdo ((i 1 (+ i 1))) ((> i 50) nil)
   (tagbody (setf ri i) (setf c (expt (/ (+ ri (- 0.5)) ri) 2))
    (setf an (* c (* an k2))) (setf s1 (+ s1 an))
    (if (< (+ (abs (real an)) (abs (aimag an))) tol) (go label20))
  ))
  label20 (setf km (* hpi s1)) (return km)
))

