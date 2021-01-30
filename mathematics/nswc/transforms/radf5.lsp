(defun radf5 (ido l1 cc ch wa1 wa2 wa3 wa4) (declare (type fixnum ido))
 (declare (type fixnum l1))
 (declare (type (simple-array double-float (* * *)) cc))
 (declare (type (simple-array double-float (* * *)) ch))
 (declare (type (simple-array double-float (*)) wa1))
 (declare (type (simple-array double-float (*)) wa2))
 (declare (type (simple-array double-float (*)) wa3))
 (declare (type (simple-array double-float (*)) wa4))
 (prog
  ((ti4 0.0d0) (tr4 0.0d0) (ti5 0.0d0) (tr5 0.0d0) (ti3 0.0d0) (tr3 0.0d0)
   (ti2 0.0d0) (tr2 0.0d0) (ci3 0.0d0) (cr4 0.0d0) (ci2 0.0d0) (cr5 0.0d0)
   (di5 0.0d0) (dr5 0.0d0) (di4 0.0d0) (dr4 0.0d0) (di3 0.0d0) (dr3 0.0d0)
   (di2 0.0d0) (dr2 0.0d0) (ic 0) (i 0) (idp2 0) (ti12 0.0d0) (ti11 0.0d0)
   (tr12 0.0d0) (tr11 0.0d0) (ci4 0.0d0) (cr3 0.0d0) (ci5 0.0d0) (cr2 0.0d0)
   (k 0)
  )
  (declare (type double-float ti4)) (declare (type double-float tr4))
  (declare (type double-float ti5)) (declare (type double-float tr5))
  (declare (type double-float ti3)) (declare (type double-float tr3))
  (declare (type double-float ti2)) (declare (type double-float tr2))
  (declare (type double-float ci3)) (declare (type double-float cr4))
  (declare (type double-float ci2)) (declare (type double-float cr5))
  (declare (type double-float di5)) (declare (type double-float dr5))
  (declare (type double-float di4)) (declare (type double-float dr4))
  (declare (type double-float di3)) (declare (type double-float dr3))
  (declare (type double-float di2)) (declare (type double-float dr2))
  (declare (type fixnum ic)) (declare (type fixnum i))
  (declare (type fixnum idp2)) (declare (type double-float ti12))
  (declare (type double-float ti11)) (declare (type double-float tr12))
  (declare (type double-float tr11)) (declare (type double-float ci4))
  (declare (type double-float cr3)) (declare (type double-float ci5))
  (declare (type double-float cr2)) (declare (type fixnum k))
  (setq tr11 0.309017)
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody (setf cr2 (+ (fref cc 1 k 5) (fref cc 1 k 2)))
    (setf ci5 (+ (fref cc 1 k 5) (- (fref cc 1 k 2))))
    (setf cr3 (+ (fref cc 1 k 4) (fref cc 1 k 3)))
    (setf ci4 (+ (fref cc 1 k 4) (- (fref cc 1 k 3))))
    (fset (fref ch 1 1 k) (+ (+ (fref cc 1 k 1) cr2) cr3))
    (fset (fref ch ido 2 k) (+ (+ (fref cc 1 k 1) (* tr11 cr2)) (* tr12 cr3)))
    (fset (fref ch 1 3 k) (+ (* ti11 ci5) (* ti12 ci4)))
    (fset (fref ch ido 4 k) (+ (+ (fref cc 1 k 1) (* tr12 cr2)) (* tr11 cr3)))
    (fset (fref ch 1 5 k) (+ (* ti12 ci5) (* (* -1 ti11) ci4)))
  ))
  (if (= ido 1) (go end_label)) (setf idp2 (+ ido 2))
  (if (< (/ (+ ido (- 1)) 2) l1) (go label104))
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody
    (fdo ((i 3 (+ i 2))) ((> i ido) nil)
     (tagbody (setf ic (+ idp2 (- i)))
      (setf dr2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc (+ i (- 1)) k 2))
        (* (fref wa1 (+ i (- 1))) (fref cc i k 2))
      ))
      (setf di2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc i k 2))
        (* (* -1 (fref wa1 (+ i (- 1)))) (fref cc (+ i (- 1)) k 2))
      ))
      (setf dr3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc (+ i (- 1)) k 3))
        (* (fref wa2 (+ i (- 1))) (fref cc i k 3))
      ))
      (setf di3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc i k 3))
        (* (* -1 (fref wa2 (+ i (- 1)))) (fref cc (+ i (- 1)) k 3))
      ))
      (setf dr4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc (+ i (- 1)) k 4))
        (* (fref wa3 (+ i (- 1))) (fref cc i k 4))
      ))
      (setf di4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc i k 4))
        (* (* -1 (fref wa3 (+ i (- 1)))) (fref cc (+ i (- 1)) k 4))
      ))
      (setf dr5
       (+ (* (fref wa4 (+ i (- 2))) (fref cc (+ i (- 1)) k 5))
        (* (fref wa4 (+ i (- 1))) (fref cc i k 5))
      ))
      (setf di5
       (+ (* (fref wa4 (+ i (- 2))) (fref cc i k 5))
        (* (* -1 (fref wa4 (+ i (- 1)))) (fref cc (+ i (- 1)) k 5))
      ))
      (setf cr2 (+ dr2 dr5)) (setf ci5 (+ dr5 (- dr2)))
      (setf cr5 (+ di2 (- di5))) (setf ci2 (+ di2 di5)) (setf cr3 (+ dr3 dr4))
      (setf ci4 (+ dr4 (- dr3))) (setf cr4 (+ di3 (- di4)))
      (setf ci3 (+ di3 di4))
      (fset (fref ch (+ i (- 1)) 1 k) (+ (+ (fref cc (+ i (- 1)) k 1) cr2) cr3)
      )
      (fset (fref ch i 1 k) (+ (+ (fref cc i k 1) ci2) ci3))
      (setf tr2 (+ (+ (fref cc (+ i (- 1)) k 1) (* tr11 cr2)) (* tr12 cr3)))
      (setf ti2 (+ (+ (fref cc i k 1) (* tr11 ci2)) (* tr12 ci3)))
      (setf tr3 (+ (+ (fref cc (+ i (- 1)) k 1) (* tr12 cr2)) (* tr11 cr3)))
      (setf ti3 (+ (+ (fref cc i k 1) (* tr12 ci2)) (* tr11 ci3)))
      (setf tr5 (+ (* ti11 cr5) (* ti12 cr4)))
      (setf ti5 (+ (* ti11 ci5) (* ti12 ci4)))
      (setf tr4 (+ (* ti12 cr5) (* (* -1 ti11) cr4)))
      (setf ti4 (+ (* ti12 ci5) (* (* -1 ti11) ci4)))
      (fset (fref ch (+ i (- 1)) 3 k) (+ tr2 tr5))
      (fset (fref ch (+ ic (- 1)) 2 k) (+ tr2 (- tr5)))
      (fset (fref ch i 3 k) (+ ti2 ti5))
      (fset (fref ch ic 2 k) (+ ti5 (- ti2)))
      (fset (fref ch (+ i (- 1)) 5 k) (+ tr3 tr4))
      (fset (fref ch (+ ic (- 1)) 4 k) (+ tr3 (- tr4)))
      (fset (fref ch i 5 k) (+ ti3 ti4))
      (fset (fref ch ic 4 k) (+ ti4 (- ti3)))
  ))))
  (go end_label) label104
  (fdo ((i 3 (+ i 2))) ((> i ido) nil)
   (tagbody (setf ic (+ idp2 (- i)))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody
      (setf dr2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc (+ i (- 1)) k 2))
        (* (fref wa1 (+ i (- 1))) (fref cc i k 2))
      ))
      (setf di2
       (+ (* (fref wa1 (+ i (- 2))) (fref cc i k 2))
        (* (* -1 (fref wa1 (+ i (- 1)))) (fref cc (+ i (- 1)) k 2))
      ))
      (setf dr3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc (+ i (- 1)) k 3))
        (* (fref wa2 (+ i (- 1))) (fref cc i k 3))
      ))
      (setf di3
       (+ (* (fref wa2 (+ i (- 2))) (fref cc i k 3))
        (* (* -1 (fref wa2 (+ i (- 1)))) (fref cc (+ i (- 1)) k 3))
      ))
      (setf dr4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc (+ i (- 1)) k 4))
        (* (fref wa3 (+ i (- 1))) (fref cc i k 4))
      ))
      (setf di4
       (+ (* (fref wa3 (+ i (- 2))) (fref cc i k 4))
        (* (* -1 (fref wa3 (+ i (- 1)))) (fref cc (+ i (- 1)) k 4))
      ))
      (setf dr5
       (+ (* (fref wa4 (+ i (- 2))) (fref cc (+ i (- 1)) k 5))
        (* (fref wa4 (+ i (- 1))) (fref cc i k 5))
      ))
      (setf di5
       (+ (* (fref wa4 (+ i (- 2))) (fref cc i k 5))
        (* (* -1 (fref wa4 (+ i (- 1)))) (fref cc (+ i (- 1)) k 5))
      ))
      (setf cr2 (+ dr2 dr5)) (setf ci5 (+ dr5 (- dr2)))
      (setf cr5 (+ di2 (- di5))) (setf ci2 (+ di2 di5)) (setf cr3 (+ dr3 dr4))
      (setf ci4 (+ dr4 (- dr3))) (setf cr4 (+ di3 (- di4)))
      (setf ci3 (+ di3 di4))
      (fset (fref ch (+ i (- 1)) 1 k) (+ (+ (fref cc (+ i (- 1)) k 1) cr2) cr3)
      )
      (fset (fref ch i 1 k) (+ (+ (fref cc i k 1) ci2) ci3))
      (setf tr2 (+ (+ (fref cc (+ i (- 1)) k 1) (* tr11 cr2)) (* tr12 cr3)))
      (setf ti2 (+ (+ (fref cc i k 1) (* tr11 ci2)) (* tr12 ci3)))
      (setf tr3 (+ (+ (fref cc (+ i (- 1)) k 1) (* tr12 cr2)) (* tr11 cr3)))
      (setf ti3 (+ (+ (fref cc i k 1) (* tr12 ci2)) (* tr11 ci3)))
      (setf tr5 (+ (* ti11 cr5) (* ti12 cr4)))
      (setf ti5 (+ (* ti11 ci5) (* ti12 ci4)))
      (setf tr4 (+ (* ti12 cr5) (* (* -1 ti11) cr4)))
      (setf ti4 (+ (* ti12 ci5) (* (* -1 ti11) ci4)))
      (fset (fref ch (+ i (- 1)) 3 k) (+ tr2 tr5))
      (fset (fref ch (+ ic (- 1)) 2 k) (+ tr2 (- tr5)))
      (fset (fref ch i 3 k) (+ ti2 ti5))
      (fset (fref ch ic 2 k) (+ ti5 (- ti2)))
      (fset (fref ch (+ i (- 1)) 5 k) (+ tr3 tr4))
      (fset (fref ch (+ ic (- 1)) 4 k) (+ tr3 (- tr4)))
      (fset (fref ch i 5 k) (+ ti3 ti4))
      (fset (fref ch ic 4 k) (+ ti4 (- ti3)))
  ))))
  (go end_label) end_label (return (values ido l1 cc ch wa1 wa2 wa3 wa4))
))

