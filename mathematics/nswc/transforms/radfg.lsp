(defun radfg (ido ip l1 idl1 cc c1 c2 ch ch2 wa) (declare (type fixnum ido))
 (declare (type fixnum ip)) (declare (type fixnum l1))
 (declare (type fixnum idl1))
 (declare (type (simple-array double-float (* * *)) cc))
 (declare (type (simple-array double-float (* * *)) c1))
 (declare (type (simple-array double-float (* *)) c2))
 (declare (type (simple-array double-float (* * *)) ch))
 (declare (type (simple-array double-float (* *)) ch2))
 (declare (type (simple-array double-float (*)) wa))
 (prog
  ((ic 0) (j2 0) (ar2h 0.0d0) (ai2 0.0d0) (ar2 0.0d0) (ds2 0.0d0) (dc2 0.0d0)
   (ar1h 0.0d0) (lc 0) (l 0) (ai1 0.0d0) (ar1 0.0d0) (jc 0) (i 0) (idij 0)
   (is 0) (k 0) (j 0) (ik 0) (nbd 0) (idp2 0) (ipp2 0) (ipph 0) (dsp 0.0d0)
   (dcp 0.0d0) (tpi 0.0d0) (arg 0.0d0)
  )
  (declare (type fixnum ic)) (declare (type fixnum j2))
  (declare (type double-float ar2h)) (declare (type double-float ai2))
  (declare (type double-float ar2)) (declare (type double-float ds2))
  (declare (type double-float dc2)) (declare (type double-float ar1h))
  (declare (type fixnum lc)) (declare (type fixnum l))
  (declare (type double-float ai1)) (declare (type double-float ar1))
  (declare (type fixnum jc)) (declare (type fixnum i))
  (declare (type fixnum idij)) (declare (type fixnum is))
  (declare (type fixnum k)) (declare (type fixnum j))
  (declare (type fixnum ik)) (declare (type fixnum nbd))
  (declare (type fixnum idp2)) (declare (type fixnum ipp2))
  (declare (type fixnum ipph)) (declare (type double-float dsp))
  (declare (type double-float dcp)) (declare (type double-float tpi))
  (declare (type double-float arg)) (setq tpi 6.2831855)
  (setf arg (/ tpi (float ip))) (setf dcp (cos arg)) (setf dsp (sin arg))
  (setf ipph (/ (+ ip 1) 2)) (setf ipp2 (+ ip 2)) (setf idp2 (+ ido 2))
  (setf nbd (/ (+ ido (- 1)) 2)) (if (= ido 1) (go label119))
  (fdo ((ik 1 (+ ik 1))) ((> ik idl1) nil)
   (tagbody (fset (fref ch2 ik 1) (fref c2 ik 1)))
  )
  (fdo ((j 2 (+ j 1))) ((> j ip) nil)
   (tagbody
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody (fset (fref ch 1 k j) (fref c1 1 k j)))
  )))
  (if (> nbd l1) (go label107)) (setf is (- ido))
  (fdo ((j 2 (+ j 1))) ((> j ip) nil)
   (tagbody (setf is (+ is ido)) (setf idij is)
    (fdo ((i 3 (+ i 2))) ((> i ido) nil)
     (tagbody (setf idij (+ idij 2))
      (fdo ((k 1 (+ k 1))) ((> k l1) nil)
       (tagbody
        (fset (fref ch (+ i (- 1)) k j)
         (+ (* (fref wa (+ idij (- 1))) (fref c1 (+ i (- 1)) k j))
          (* (fref wa idij) (fref c1 i k j))
        ))
        (fset (fref ch i k j)
         (+ (* (fref wa (+ idij (- 1))) (fref c1 i k j))
          (* (* -1 (fref wa idij)) (fref c1 (+ i (- 1)) k j))
  ))))))))
  (go label111) label107 (setf is (- ido))
  (fdo ((j 2 (+ j 1))) ((> j ip) nil)
   (tagbody (setf is (+ is ido))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody (setf idij is)
      (fdo ((i 3 (+ i 2))) ((> i ido) nil)
       (tagbody (setf idij (+ idij 2))
        (fset (fref ch (+ i (- 1)) k j)
         (+ (* (fref wa (+ idij (- 1))) (fref c1 (+ i (- 1)) k j))
          (* (fref wa idij) (fref c1 i k j))
        ))
        (fset (fref ch i k j)
         (+ (* (fref wa (+ idij (- 1))) (fref c1 i k j))
          (* (* -1 (fref wa idij)) (fref c1 (+ i (- 1)) k j))
  ))))))))
  label111 (if (< nbd l1) (go label115))
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody (setf jc (+ ipp2 (- j)))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody
      (fdo ((i 3 (+ i 2))) ((> i ido) nil)
       (tagbody
        (fset (fref c1 (+ i (- 1)) k j)
         (+ (fref ch (+ i (- 1)) k j) (fref ch (+ i (- 1)) k jc))
        )
        (fset (fref c1 (+ i (- 1)) k jc)
         (+ (fref ch i k j) (- (fref ch i k jc)))
        )
        (fset (fref c1 i k j) (+ (fref ch i k j) (fref ch i k jc)))
        (fset (fref c1 i k jc)
         (+ (fref ch (+ i (- 1)) k jc) (- (fref ch (+ i (- 1)) k j)))
  )))))))
  (go label121) label115
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody (setf jc (+ ipp2 (- j)))
    (fdo ((i 3 (+ i 2))) ((> i ido) nil)
     (tagbody
      (fdo ((k 1 (+ k 1))) ((> k l1) nil)
       (tagbody
        (fset (fref c1 (+ i (- 1)) k j)
         (+ (fref ch (+ i (- 1)) k j) (fref ch (+ i (- 1)) k jc))
        )
        (fset (fref c1 (+ i (- 1)) k jc)
         (+ (fref ch i k j) (- (fref ch i k jc)))
        )
        (fset (fref c1 i k j) (+ (fref ch i k j) (fref ch i k jc)))
        (fset (fref c1 i k jc)
         (+ (fref ch (+ i (- 1)) k jc) (- (fref ch (+ i (- 1)) k j)))
  )))))))
  (go label121) label119
  (fdo ((ik 1 (+ ik 1))) ((> ik idl1) nil)
   (tagbody (fset (fref c2 ik 1) (fref ch2 ik 1)))
  )
  label121
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody (setf jc (+ ipp2 (- j)))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody (fset (fref c1 1 k j) (+ (fref ch 1 k j) (fref ch 1 k jc)))
      (fset (fref c1 1 k jc) (+ (fref ch 1 k jc) (- (fref ch 1 k j))))
  ))))
  (setf ar1 1.0) (setf ai1 0.0)
  (fdo ((l 2 (+ l 1))) ((> l ipph) nil)
   (tagbody (setf lc (+ ipp2 (- l)))
    (setf ar1h (+ (* dcp ar1) (* (* -1 dsp) ai1)))
    (setf ai1 (+ (* dcp ai1) (* dsp ar1))) (setf ar1 ar1h)
    (fdo ((ik 1 (+ ik 1))) ((> ik idl1) nil)
     (tagbody (fset (fref ch2 ik l) (+ (fref c2 ik 1) (* ar1 (fref c2 ik 2))))
      (fset (fref ch2 ik lc) (* ai1 (fref c2 ik ip)))
    ))
    (setf dc2 ar1) (setf ds2 ai1) (setf ar2 ar1) (setf ai2 ai1)
    (fdo ((j 3 (+ j 1))) ((> j ipph) nil)
     (tagbody (setf jc (+ ipp2 (- j)))
      (setf ar2h (+ (* dc2 ar2) (* (* -1 ds2) ai2)))
      (setf ai2 (+ (* dc2 ai2) (* ds2 ar2))) (setf ar2 ar2h)
      (fdo ((ik 1 (+ ik 1))) ((> ik idl1) nil)
       (tagbody
        (fset (fref ch2 ik l) (+ (fref ch2 ik l) (* ar2 (fref c2 ik j))))
        (fset (fref ch2 ik lc) (+ (fref ch2 ik lc) (* ai2 (fref c2 ik jc))))
  ))))))
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody
    (fdo ((ik 1 (+ ik 1))) ((> ik idl1) nil)
     (tagbody (fset (fref ch2 ik 1) (+ (fref ch2 ik 1) (fref c2 ik j))))
  )))
  (if (< ido l1) (go label132))
  (fdo ((k 1 (+ k 1))) ((> k l1) nil)
   (tagbody
    (fdo ((i 1 (+ i 1))) ((> i ido) nil)
     (tagbody (fset (fref cc i 1 k) (fref ch i k 1)))
  )))
  (go label135) label132
  (fdo ((i 1 (+ i 1))) ((> i ido) nil)
   (tagbody
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody (fset (fref cc i 1 k) (fref ch i k 1)))
  )))
  label135
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody (setf jc (+ ipp2 (- j))) (setf j2 (+ j j))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody (fset (fref cc ido (+ j2 (- 2)) k) (fref ch 1 k j))
      (fset (fref cc 1 (+ j2 (- 1)) k) (fref ch 1 k jc))
  ))))
  (if (= ido 1) (go end_label)) (if (< nbd l1) (go label141))
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody (setf jc (+ ipp2 (- j))) (setf j2 (+ j j))
    (fdo ((k 1 (+ k 1))) ((> k l1) nil)
     (tagbody
      (fdo ((i 3 (+ i 2))) ((> i ido) nil)
       (tagbody (setf ic (+ idp2 (- i)))
        (fset (fref cc (+ i (- 1)) (+ j2 (- 1)) k)
         (+ (fref ch (+ i (- 1)) k j) (fref ch (+ i (- 1)) k jc))
        )
        (fset (fref cc (+ ic (- 1)) (+ j2 (- 2)) k)
         (+ (fref ch (+ i (- 1)) k j) (- (fref ch (+ i (- 1)) k jc)))
        )
        (fset (fref cc i (+ j2 (- 1)) k) (+ (fref ch i k j) (fref ch i k jc)))
        (fset (fref cc ic (+ j2 (- 2)) k)
         (+ (fref ch i k jc) (- (fref ch i k j)))
  )))))))
  (go end_label) label141
  (fdo ((j 2 (+ j 1))) ((> j ipph) nil)
   (tagbody (setf jc (+ ipp2 (- j))) (setf j2 (+ j j))
    (fdo ((i 3 (+ i 2))) ((> i ido) nil)
     (tagbody (setf ic (+ idp2 (- i)))
      (fdo ((k 1 (+ k 1))) ((> k l1) nil)
       (tagbody
        (fset (fref cc (+ i (- 1)) (+ j2 (- 1)) k)
         (+ (fref ch (+ i (- 1)) k j) (fref ch (+ i (- 1)) k jc))
        )
        (fset (fref cc (+ ic (- 1)) (+ j2 (- 2)) k)
         (+ (fref ch (+ i (- 1)) k j) (- (fref ch (+ i (- 1)) k jc)))
        )
        (fset (fref cc i (+ j2 (- 1)) k) (+ (fref ch i k j) (fref ch i k jc)))
        (fset (fref cc ic (+ j2 (- 2)) k)
         (+ (fref ch i k jc) (- (fref ch i k j)))
  )))))))
  (go end_label) end_label (return (values ido ip l1 idl1 cc c1 c2 ch ch2 wa))
))

