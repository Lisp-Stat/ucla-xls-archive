(defun radb4 (ido l1 cc ch wa1 wa2 wa3) (declare (type fixnum ido))
 (declare (type fixnum l1))
 (declare (type (simple-array double-float (* * *)) cc))
 (declare (type (simple-array double-float (* * *)) ch))
 (declare (type (simple-array double-float (*)) wa1))
 (declare (type (simple-array double-float (*)) wa2))
 (declare (type (simple-array double-float (*)) wa3))
 (prog
  ((sqrt2 0.0d0) (ci4 0.0d0) (ci2 0.0d0) (cr4 0.0d0) (cr2 0.0d0) (ci3 0.0d0)
   (cr3 0.0d0) (ti4 0.0d0) (ti3 0.0d0) (ti2 0.0d0) (ti1 0.0d0) (ic 0) (i 0)
   (idp2 0) (tr4 0.0d0) (tr3 0.0d0) (tr2 0.0d0) (tr1 0.0d0) (k 0)
  )
  (declare (type double-float sqrt2)) (declare (type double-float ci4))
  (declare (type double-float ci2)) (declare (type double-float cr4))
  (declare (type double-float cr2)) (declare (type double-float ci3))
  (declare (type double-float cr3)) (declare (type double-float ti4))
  (declare (type double-float ti3)) (declare (type double-float ti2))
  (declare (type double-float ti1)) (declare (type fixnum ic))
  (declare (type fixnum i)) (declare (type fixnum idp2))
  (declare (type double-float tr4)) (declare (type double-float tr3))
  (declare (type double-float tr2)) (declare (type double-float tr1))
  (declare (type fixnum k)) (setq sqrt2 1.4142135)
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody (setf tr1 (+ (fref cc 1 1 k) (- (fref cc ido 4 k))))
    (setf tr2 (+ (fref cc 1 1 k) (fref cc ido 4 k)))
    (setf tr3 (+ (fref cc ido 2 k) (fref cc ido 2 k)))
    (setf tr4 (+ (fref cc 1 3 k) (fref cc 1 3 k)))
    (fset (fref ch 1 k 1) (+ tr2 tr3)) (fset (fref ch 1 k 2) (+ tr1 (- tr4)))
    (fset (fref ch 1 k 3) (+ tr2 (- tr3))) (fset (fref ch 1 k 4) (+ tr1 tr4))
  ))
  (arithmetic-if (+ ido (- 2)) (go label107) (go label105) (go label102))
  label102 (setf idp2 (+ ido 2)) (if (< (/ (+ ido (- 1)) 2) l1) (go label108))
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody
    (fdo ((i 3 (+ i 2))) ((> i ido) nil)
     (tagbody (setf ic (+ idp2 (- i)))
      (setf ti1 (+ (fref cc i 1 k) (fref cc ic 4 k)))
      (setf ti2 (+ (fref cc i 1 k) (- (fref cc ic 4 k))))
      (setf ti3 (+ (fref cc i 3 k) (- (fref cc ic 2 k))))
      (setf tr4 (+ (fref cc i 3 k) (fref cc ic 2 k)))
      (setf tr1 (+ (fref cc (+ i (- 1)) 1 k) (- (fref cc (+ ic (- 1)) 4 k))))
      (setf tr2 (+ (fref cc (+ i (- 1)) 1 k) (fref cc (+ ic (- 1)) 4 k)))
      (setf ti4 (+ (fref cc (+ i (- 1)) 3 k) (- (fref cc (+ ic (- 1)) 2 k))))
      (setf tr3 (+ (fref cc (+ i (- 1)) 3 k) (fref cc (+ ic (- 1)) 2 k)))
      (fset (fref ch (+ i (- 1)) k 1) (+ tr2 tr3)) (setf cr3 (+ tr2 (- tr3)))
      (fset (fref ch i k 1) (+ ti2 ti3)) (setf ci3 (+ ti2 (- ti3)))
      (setf cr2 (+ tr1 (- tr4))) (setf cr4 (+ tr1 tr4)) (setf ci2 (+ ti1 ti4))
      (setf ci4 (+ ti1 (- ti4)))
      (fset (fref ch (+ i (- 1)) k 2)
       (+ (* (fref wa1 (+ i (- 2))) cr2) (* (* -1 (fref wa1 (+ i (- 1)))) ci2))
      )
      (fset (fref ch i k 2)
       (+ (* (fref wa1 (+ i (- 2))) ci2) (* (fref wa1 (+ i (- 1))) cr2))
      )
      (fset (fref ch (+ i (- 1)) k 3)
       (+ (* (fref wa2 (+ i (- 2))) cr3) (* (* -1 (fref wa2 (+ i (- 1)))) ci3))
      )
      (fset (fref ch i k 3)
       (+ (* (fref wa2 (+ i (- 2))) ci3) (* (fref wa2 (+ i (- 1))) cr3))
      )
      (fset (fref ch (+ i (- 1)) k 4)
       (+ (* (fref wa3 (+ i (- 2))) cr4) (* (* -1 (fref wa3 (+ i (- 1)))) ci4))
      )
      (fset (fref ch i k 4)
       (+ (* (fref wa3 (+ i (- 2))) ci4) (* (fref wa3 (+ i (- 1))) cr4))
  )))))
  (go label111) label108
  (fdo ((i 3 (+ i 2))) ((> i ido) nil)
   (tagbody (setf ic (+ idp2 (- i)))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody (setf ti1 (+ (fref cc i 1 k) (fref cc ic 4 k)))
      (setf ti2 (+ (fref cc i 1 k) (- (fref cc ic 4 k))))
      (setf ti3 (+ (fref cc i 3 k) (- (fref cc ic 2 k))))
      (setf tr4 (+ (fref cc i 3 k) (fref cc ic 2 k)))
      (setf tr1 (+ (fref cc (+ i (- 1)) 1 k) (- (fref cc (+ ic (- 1)) 4 k))))
      (setf tr2 (+ (fref cc (+ i (- 1)) 1 k) (fref cc (+ ic (- 1)) 4 k)))
      (setf ti4 (+ (fref cc (+ i (- 1)) 3 k) (- (fref cc (+ ic (- 1)) 2 k))))
      (setf tr3 (+ (fref cc (+ i (- 1)) 3 k) (fref cc (+ ic (- 1)) 2 k)))
      (fset (fref ch (+ i (- 1)) k 1) (+ tr2 tr3)) (setf cr3 (+ tr2 (- tr3)))
      (fset (fref ch i k 1) (+ ti2 ti3)) (setf ci3 (+ ti2 (- ti3)))
      (setf cr2 (+ tr1 (- tr4))) (setf cr4 (+ tr1 tr4)) (setf ci2 (+ ti1 ti4))
      (setf ci4 (+ ti1 (- ti4)))
      (fset (fref ch (+ i (- 1)) k 2)
       (+ (* (fref wa1 (+ i (- 2))) cr2) (* (* -1 (fref wa1 (+ i (- 1)))) ci2))
      )
      (fset (fref ch i k 2)
       (+ (* (fref wa1 (+ i (- 2))) ci2) (* (fref wa1 (+ i (- 1))) cr2))
      )
      (fset (fref ch (+ i (- 1)) k 3)
       (+ (* (fref wa2 (+ i (- 2))) cr3) (* (* -1 (fref wa2 (+ i (- 1)))) ci3))
      )
      (fset (fref ch i k 3)
       (+ (* (fref wa2 (+ i (- 2))) ci3) (* (fref wa2 (+ i (- 1))) cr3))
      )
      (fset (fref ch (+ i (- 1)) k 4)
       (+ (* (fref wa3 (+ i (- 2))) cr4) (* (* -1 (fref wa3 (+ i (- 1)))) ci4))
      )
      (fset (fref ch i k 4)
       (+ (* (fref wa3 (+ i (- 2))) ci4) (* (fref wa3 (+ i (- 1))) cr4))
  )))))
  label111 (if (= (mod ido 2) 1) (go end_label)) label105
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody (setf ti1 (+ (fref cc 1 2 k) (fref cc 1 4 k)))
    (setf ti2 (+ (fref cc 1 4 k) (- (fref cc 1 2 k))))
    (setf tr1 (+ (fref cc ido 1 k) (- (fref cc ido 3 k))))
    (setf tr2 (+ (fref cc ido 1 k) (fref cc ido 3 k)))
    (fset (fref ch ido k 1) (+ tr2 tr2))
    (fset (fref ch ido k 2) (* sqrt2 (+ tr1 (- ti1))))
    (fset (fref ch ido k 3) (+ ti2 ti2))
    (fset (fref ch ido k 4) (* (* -1 sqrt2) (+ tr1 ti1)))
  ))
  label107 (go end_label) end_label (return (values ido l1 cc ch wa1 wa2 wa3))
))

