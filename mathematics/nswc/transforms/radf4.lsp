(defun radf4 (ido l1 cc ch wa1 wa2 wa3) (declare (type fixnum ido))
 (declare (type fixnum l1))
 (declare (type (simple-array double-float (* * *)) cc))
 (declare (type (simple-array double-float (* * *)) ch))
 (declare (type (simple-array double-float (*)) wa1))
 (declare (type (simple-array double-float (*)) wa2))
 (declare (type (simple-array double-float (*)) wa3))
 (prog
  ((hsqt2 0.0d0) (tr3 0.0d0) (ti3 0.0d0) (ti2 0.0d0) (ti4 0.0d0) (ti1 0.0d0)
   (tr4 0.0d0) (ci4 0.0d0) (cr4 0.0d0) (ci3 0.0d0) (cr3 0.0d0) (ci2 0.0d0)
   (cr2 0.0d0) (ic 0) (i 0) (idp2 0) (tr2 0.0d0) (tr1 0.0d0) (k 0)
  )
  (declare (type double-float hsqt2)) (declare (type double-float tr3))
  (declare (type double-float ti3)) (declare (type double-float ti2))
  (declare (type double-float ti4)) (declare (type double-float ti1))
  (declare (type double-float tr4)) (declare (type double-float ci4))
  (declare (type double-float cr4)) (declare (type double-float ci3))
  (declare (type double-float cr3)) (declare (type double-float ci2))
  (declare (type double-float cr2)) (declare (type fixnum ic))
  (declare (type fixnum i)) (declare (type fixnum idp2))
  (declare (type double-float tr2)) (declare (type double-float tr1))
  (declare (type fixnum k)) (setq hsqt2 0.70710677)
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody (setf tr1 (+ (fref cc 1 k 2) (fref cc 1 k 4)))
    (setf tr2 (+ (fref cc 1 k 1) (fref cc 1 k 3)))
    (fset (fref ch 1 1 k) (+ tr1 tr2)) (fset (fref ch ido 4 k) (+ tr2 (- tr1)))
    (fset (fref ch ido 2 k) (+ (fref cc 1 k 1) (- (fref cc 1 k 3))))
    (fset (fref ch 1 3 k) (+ (fref cc 1 k 4) (- (fref cc 1 k 2))))
  ))
  (arithmetic-if (+ ido (- 2)) (go label107) (go label105) (go label102))
  label102 (setf idp2 (+ ido 2)) (if (< (/ (+ ido (- 1)) 2) l1) (go label111))
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody
    (fdo ((i 3 (+ i 2))) ((> i ido) nil)
     (tagbody (setf ic (+ idp2 (- i)))
      (setf cr2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc (+ i (- 1)) k 2))
        (* (fref wa1 (+ i (- 1))) (fref cc i k 2))
      ))
      (setf ci2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc i k 2))
        (* (* -1 (fref wa1 (+ i (- 1)))) (fref cc (+ i (- 1)) k 2))
      ))
      (setf cr3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc (+ i (- 1)) k 3))
        (* (fref wa2 (+ i (- 1))) (fref cc i k 3))
      ))
      (setf ci3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc i k 3))
        (* (* -1 (fref wa2 (+ i (- 1)))) (fref cc (+ i (- 1)) k 3))
      ))
      (setf cr4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc (+ i (- 1)) k 4))
        (* (fref wa3 (+ i (- 1))) (fref cc i k 4))
      ))
      (setf ci4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc i k 4))
        (* (* -1 (fref wa3 (+ i (- 1)))) (fref cc (+ i (- 1)) k 4))
      ))
      (setf tr1 (+ cr2 cr4)) (setf tr4 (+ cr4 (- cr2))) (setf ti1 (+ ci2 ci4))
      (setf ti4 (+ ci2 (- ci4))) (setf ti2 (+ (fref cc i k 1) ci3))
      (setf ti3 (+ (fref cc i k 1) (- ci3)))
      (setf tr2 (+ (fref cc (+ i (- 1)) k 1) cr3))
      (setf tr3 (+ (fref cc (+ i (- 1)) k 1) (- cr3)))
      (fset (fref ch (+ i (- 1)) 1 k) (+ tr1 tr2))
      (fset (fref ch (+ ic (- 1)) 4 k) (+ tr2 (- tr1)))
      (fset (fref ch i 1 k) (+ ti1 ti2))
      (fset (fref ch ic 4 k) (+ ti1 (- ti2)))
      (fset (fref ch (+ i (- 1)) 3 k) (+ ti4 tr3))
      (fset (fref ch (+ ic (- 1)) 2 k) (+ tr3 (- ti4)))
      (fset (fref ch i 3 k) (+ tr4 ti3))
      (fset (fref ch ic 2 k) (+ tr4 (- ti3)))
  ))))
  (go label110) label111
  (fdo ((i 3 (+ i 2))) ((> i ido) nil)
   (tagbody (setf ic (+ idp2 (- i)))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody
      (setf cr2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc (+ i (- 1)) k 2))
        (* (fref wa1 (+ i (- 1))) (fref cc i k 2))
      ))
      (setf ci2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc i k 2))
        (* (* -1 (fref wa1 (+ i (- 1)))) (fref cc (+ i (- 1)) k 2))
      ))
      (setf cr3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc (+ i (- 1)) k 3))
        (* (fref wa2 (+ i (- 1))) (fref cc i k 3))
      ))
      (setf ci3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc i k 3))
        (* (* -1 (fref wa2 (+ i (- 1)))) (fref cc (+ i (- 1)) k 3))
      ))
      (setf cr4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc (+ i (- 1)) k 4))
        (* (fref wa3 (+ i (- 1))) (fref cc i k 4))
      ))
      (setf ci4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc i k 4))
        (* (* -1 (fref wa3 (+ i (- 1)))) (fref cc (+ i (- 1)) k 4))
      ))
      (setf tr1 (+ cr2 cr4)) (setf tr4 (+ cr4 (- cr2))) (setf ti1 (+ ci2 ci4))
      (setf ti4 (+ ci2 (- ci4))) (setf ti2 (+ (fref cc i k 1) ci3))
      (setf ti3 (+ (fref cc i k 1) (- ci3)))
      (setf tr2 (+ (fref cc (+ i (- 1)) k 1) cr3))
      (setf tr3 (+ (fref cc (+ i (- 1)) k 1) (- cr3)))
      (fset (fref ch (+ i (- 1)) 1 k) (+ tr1 tr2))
      (fset (fref ch (+ ic (- 1)) 4 k) (+ tr2 (- tr1)))
      (fset (fref ch i 1 k) (+ ti1 ti2))
      (fset (fref ch ic 4 k) (+ ti1 (- ti2)))
      (fset (fref ch (+ i (- 1)) 3 k) (+ ti4 tr3))
      (fset (fref ch (+ ic (- 1)) 2 k) (+ tr3 (- ti4)))
      (fset (fref ch i 3 k) (+ tr4 ti3))
      (fset (fref ch ic 2 k) (+ tr4 (- ti3)))
  ))))
  label110 (if (= (mod ido 2) 1) (go end_label)) label105
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody (setf ti1 (* (* -1 hsqt2) (+ (fref cc ido k 2) (fref cc ido k 4))))
    (setf tr1 (* hsqt2 (+ (fref cc ido k 2) (- (fref cc ido k 4)))))
    (fset (fref ch ido 1 k) (+ tr1 (fref cc ido k 1)))
    (fset (fref ch ido 3 k) (+ (fref cc ido k 1) (- tr1)))
    (fset (fref ch 1 2 k) (+ ti1 (- (fref cc ido k 3))))
    (fset (fref ch 1 4 k) (+ ti1 (fref cc ido k 3)))
  ))
  label107 (go end_label) end_label (return (values ido l1 cc ch wa1 wa2 wa3))
))
