(defun abslv1 (mo m n a na u nu b nb v nv c nc wk ierr)
 (declare (type fixnum mo)) (declare (type fixnum m)) (declare (type fixnum n))
 (declare (type (simple-array float (* *)) a)) (declare (type fixnum na))
 (declare (type (simple-array float (* *)) u)) (declare (type fixnum nu))
 (declare (type (simple-array float (* *)) b)) (declare (type fixnum nb))
 (declare (type (simple-array float (* *)) v)) (declare (type fixnum nv))
 (declare (type (simple-array float (* *)) c)) (declare (type fixnum nc))
 (declare (type (simple-array float (*)) wk)) (declare (type fixnum ierr))
 (prog ((temp 0.0d0) (k 0) (j 0) (i 0)) (declare (type float temp))
  (declare (type fixnum k)) (declare (type fixnum j)) (declare (type fixnum i))
  (if (and (/= mo 0) (/= mo 1)) (go label35))
  (fdo ((i 1 (+ i 1))) ((> i m) nil)
   (tagbody
    (fdo ((j i (+ j 1))) ((> j m) nil)
     (tagbody (setf temp (fref a i j)) (fset (fref a i j) (fref a j i))
      (fset (fref a j i) temp)
  ))))
  (multiple-value-setq (na m dummy_var m a wk) (orthes na m 1 m a wk))
  (multiple-value-setq (m dummy_var m a na u nu wk) (ortrn1 m 1 m a na u nu wk)
  )
  (if (= m 1) (go label20))
  (multiple-value-setq (m dummy_var m a na u nu dummy_var dummy_var ierr)
   (schur m 1 m a na u nu (fref wk 1) (fref wk (+ m 1)) ierr)
  )
  (if (/= ierr 0) (go label200)) label20
  (fdo ((i 1 (+ i 1))) ((> i m) nil)
   (tagbody
    (fdo ((j i (+ j 1))) ((> j m) nil)
     (tagbody (setf temp (fref a i j)) (fset (fref a i j) (fref a j i))
      (fset (fref a j i) temp)
  ))))
  label35 (if (and (/= mo 0) (/= mo 2)) (go label45))
  (multiple-value-setq (nb n dummy_var n b wk) (orthes nb n 1 n b wk))
  (multiple-value-setq (n dummy_var n b nb v nv wk) (ortrn1 n 1 n b nb v nv wk)
  )
  (if (= n 1) (go label45))
  (multiple-value-setq (n dummy_var n b nb v nv dummy_var dummy_var ierr)
   (schur n 1 n b nb v nv (fref wk 1) (fref wk (+ n 1)) ierr)
  )
  (if (/= ierr 0) (go label210)) label45
  (fdo ((j 1 (+ j 1))) ((> j n) nil)
   (tagbody
    (fdo ((i 1 (+ i 1))) ((> i m) nil)
     (tagbody (fset (fref wk i) 0.0)
      (fdo ((k 1 (+ k 1))) ((> k m) nil)
       (tagbody
        (fset (fref wk i) (+ (fref wk i) (* (fref u k i) (fref c k j))))
    ))))
    (fdo ((i 1 (+ i 1))) ((> i m) nil)
     (tagbody (fset (fref c i j) (fref wk i)))
  )))
  (fdo ((i 1 (+ i 1))) ((> i m) nil)
   (tagbody
    (fdo ((j 1 (+ j 1))) ((> j n) nil)
     (tagbody (fset (fref wk j) 0.0)
      (fdo ((k 1 (+ k 1))) ((> k n) nil)
       (tagbody
        (fset (fref wk j) (+ (fref wk j) (* (fref c i k) (fref v k j))))
    ))))
    (fdo ((j 1 (+ j 1))) ((> j n) nil)
     (tagbody (fset (fref c i j) (fref wk j)))
  )))
  (multiple-value-setq (a b c m n na nb nc ierr)
   (shrslv a b c m n na nb nc ierr)
  )
  (if (/= ierr 0) (go label220))
  (fdo ((j 1 (+ j 1))) ((> j n) nil)
   (tagbody
    (fdo ((i 1 (+ i 1))) ((> i m) nil)
     (tagbody (fset (fref wk i) 0.0)
      (fdo ((k 1 (+ k 1))) ((> k m) nil)
       (tagbody
        (fset (fref wk i) (+ (fref wk i) (* (fref u i k) (fref c k j))))
    ))))
    (fdo ((i 1 (+ i 1))) ((> i m) nil)
     (tagbody (fset (fref c i j) (fref wk i)))
  )))
  (fdo ((i 1 (+ i 1))) ((> i m) nil)
   (tagbody
    (fdo ((j 1 (+ j 1))) ((> j n) nil)
     (tagbody (fset (fref wk j) 0.0)
      (fdo ((k 1 (+ k 1))) ((> k n) nil)
       (tagbody
        (fset (fref wk j) (+ (fref wk j) (* (fref c i k) (fref v j k))))
    ))))
    (fdo ((j 1 (+ j 1))) ((> j n) nil)
     (tagbody (fset (fref c i j) (fref wk j)))
  )))
  (go end_label) label200 (setf ierr (- 1)) (go end_label) label210
  (setf ierr (- 2)) (go end_label) label220 (setf ierr 1) (go end_label)
  end_label (return (values mo m n a na u nu b nb v nv c nc wk ierr))
))

