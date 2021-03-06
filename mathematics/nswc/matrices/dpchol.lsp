(defun dpchol (mo n m a b kb ierr) (declare (type fixnum mo))
 (declare (type fixnum n)) (declare (type fixnum m))
 (declare (type (simple-array double-float (*)) a))
 (declare (type (simple-array double-float (*)) b)) (declare (type fixnum kb))
 (declare (type fixnum ierr))
 (prog ((onej 0) (d (make-array '(2) :element-type 'double-float)) (j 0))
  (declare (type fixnum onej))
  (declare (type (simple-array double-float (*)) d)) (declare (type fixnum j))
  (multiple-value-setq (a n ierr) (dppfa a n ierr))
  (if (/= ierr 0) (go end_label)) (if (< m 1) (go label20)) (setf onej 1)
  (fdo ((j 1 (+ j 1))) ((> j m) nil)
   (tagbody (multiple-value-setq (a n dummy_var) (dppsl a n (fref b onej)))
    (setf onej (+ onej kb))
  ))
  label20 (if (= mo 0) (multiple-value-setq (a n d dummy_var) (dppdi a n d 1)))
  (go end_label) end_label (return (values mo n m a b kb ierr))
))

