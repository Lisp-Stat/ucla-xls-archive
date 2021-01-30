(defun mfft1 (a b n ndim isn ierr) (declare (type (simple-array float (*)) a))
 (declare (type (simple-array float (*)) b))
 (declare (type (simple-array fixnum (*)) n)) (declare (type fixnum ndim))
 (declare (type fixnum isn)) (declare (type fixnum ierr))
 (prog ((nspan 0) (i 0) (ntot 0)) (declare (type fixnum nspan))
  (declare (type fixnum i)) (declare (type fixnum ntot))
  (if (/= (iabs isn) 1) (go label40)) (if (<= ndim 0) (go label50))
  (setf ntot 1)
  (fdo ((i 1 (+ i 1))) ((> i ndim) nil)
   (tagbody (setf ntot (* (fref n i) ntot)))
  )
  (if (< ntot 1) (go label30)) (setf nspan 1)
  (fdo ((i 1 (+ i 1))) ((> i ndim) nil)
   (tagbody (setf nspan (* (fref n i) nspan))
    (multiple-value-setq (a b ntot dummy_var nspan isn ierr)
     (sfft a b ntot (fref n i) nspan isn ierr)
    )
    (if (/= ierr 0) (go end_label))
  ))
  (go end_label) label30 (setf ierr 1) (go end_label) label40 (setf ierr 4)
  (go end_label) label50 (setf ierr 5) (go end_label) end_label
  (return (values a b n ndim isn ierr))
))

