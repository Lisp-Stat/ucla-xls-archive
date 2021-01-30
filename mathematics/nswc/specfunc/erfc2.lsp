(defun erfc2 (x) (declare (type double-float x))
 (prog ((r4 0.0d0) (w 0.0d0) (p2 0.0d0) (erfc2 0.0d0) (t_ 0.0d0) (a 0.0d0))
  (declare (type double-float r4)) (declare (type double-float w))
  (declare (type double-float p2)) (declare (type double-float erfc2))
  (declare (type double-float t_)) (declare (type double-float a))
  (setq p2 0.3166529) (setq p1 1.7222757) (setq p0 21.385332)
  (setq q1 7.8437457) (setq q0 18.952257) (setq r4 4.318779E-5)
  (setq r3 0.5631696) (setq r2 3.0317993) (setq r1 6.8650184)
  (setq r0 7.3738885) (setq s3 5.3542166) (setq s2 12.795529)
  (setq s1 15.184908) (setq s0 7.373961) (setf a (abs x)) (setf t_ (* a a))
  (if (>= a 0.5) (go label10))
  (setf erfc2
   (+ 1.0
    (/ (* (* -1 x) (+ (* (+ (* p2 t_) p1) t_) p0)) (+ (* (+ t_ q1) t_) q0))
  ))
  (go end_label) label10
  (setf w
   (/ (+ (* (+ (* (+ (* (+ (* r4 a) r3) a) r2) a) r1) a) r0)
    (+ (* (+ (* (+ (* (+ a s3) a) s2) a) s1) a) s0)
  ))
  (setf erfc2 (* (exp (- t_)) w)) (if (< x 0.0) (setf erfc2 (+ 2.0 (- erfc2))))
  (go end_label) end_label (return erfc2)
))

