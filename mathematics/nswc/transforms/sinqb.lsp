(defun sinqb (n x wsave) (declare (type fixnum n))
 (declare (type (simple-array double-float (*)) x))
 (declare (type (simple-array double-float (*)) wsave))
 (prog ((xhold 0.0d0) (kc 0) (k 0) (ns2 0)) (declare (type double-float xhold))
  (declare (type fixnum kc)) (declare (type fixnum k))
  (declare (type fixnum ns2)) (if (> n 1) (go label101))
  (fset (fref x 1) (* 4.0 (fref x 1))) (go end_label) label101
  (setf ns2 (/ n 2))
  (fdo ((k 2 (+ k 2))) ((> k n) nil) (tagbody (fset (fref x k) (- (fref x k))))
  )
  (multiple-value-setq (n x wsave) (cosqb n x wsave))
  (fdo ((k 1 (+ k 1))) ((> k ns2) nil)
   (tagbody (setf kc (+ n (- k))) (setf xhold (fref x k))
    (fset (fref x k) (fref x (+ kc 1))) (fset (fref x (+ kc 1)) xhold)
  ))
  (go end_label) end_label (return (values n x wsave))
))

