(require "f2cl_macros")
(require "lubksb")

(defun mprove (a alud n np indx b x &key (nmax 100))
 (declare (type (simple-array double-float (* *)) a))
 (declare (type (simple-array double-float (* *)) alud))
 (declare (type fixnum n)) (declare (type fixnum np))
 (declare (type (simple-array fixnum (*)) indx))
 (declare (type (simple-array double-float (*)) b))
 (declare (type (simple-array double-float (*)) x))
 (declare (type fixnum nmax))
 (prog
  ((sdp 0.0d0) (r (make-array nmax :element-type 'double-float)) (j 0) (i 0)
  )
  (declare (type float sdp)) (declare (type (simple-array double-float (*)) r))
  (declare (type fixnum j)) (declare (type fixnum i))
  (fdo ((i 1 (+ i 1))) ((> i n) nil)
   (tagbody (setf sdp (- (fref b i)))
    (fdo ((j 1 (+ j 1))) ((> j n) nil)
     (tagbody (setf sdp (+ sdp (* (fref a i j) (fref x j)))))
    )
    (fset (fref r i) sdp)
  ))
  (multiple-value-setq (alud n np indx r) (lubksb alud n np indx r))
  (fdo ((i 1 (+ i 1))) ((> i n) nil)
   (tagbody (fset (fref x i) (+ (fref x i) (- (fref r i)))))
  )
  (return (values a alud n np indx b x))
))

