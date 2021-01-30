(defun acond (fun x cond num ierr) (declare (type double-float x))
 (declare (type t cond)) (declare (type fixnum num))
 (declare (type fixnum ierr))
 (prog
  ((iwk (make-array '(100) :element-type 'fixnum))
   (wk (make-array '(400) :element-type 'double-float)) (z1 0.0d0) (ier1 0)
   (ier 0) (num1 0) (c 0.0d0) (a 0.0d0) (m 0) (l 0) (mo 0) (rerr 0.0d0)
   (aerr 0.0d0) (eps2 0.0d0) (eps1 0.0d0) (eps 0.0d0)
  )
  (declare (type (simple-array fixnum (*)) iwk))
  (declare (type (simple-array double-float (*)) wk))
  (declare (type double-float z1)) (declare (type fixnum ier1))
  (declare (type fixnum ier)) (declare (type fixnum num1))
  (declare (type double-float c)) (declare (type double-float a))
  (declare (type fixnum m)) (declare (type fixnum l))
  (declare (type fixnum mo)) (declare (type double-float rerr))
  (declare (type double-float aerr)) (declare (type double-float eps2))
  (declare (type double-float eps1)) (declare (type double-float eps))
  (setf eps (spmpar 1)) (setf eps1 (* 10.0 eps))
  (setf eps2 (* 100.0 (sqrt eps))) (setf aerr 1.0E-30) (setf rerr eps1)
  (setf mo 1) (setf l 100) (setf m 400) (setf a x) (setf c (abs x))
  (multiple-value-setq
   (acondf fun y c a mo aerr rerr z1 error1 num1 ier1 l m n iwk wk)
   (qagi1 acondf fun y c a mo aerr rerr z1 error1 num1 ier1 l m n iwk wk)
  )
  (setf a 0.0) (setf c x)
  (multiple-value-setq
   (acondg fun y c a mo aerr rerr z2 error2 num2 ier2 l m n iwk wk)
   (qagi1 acondg fun y c a mo aerr rerr z2 error2 num2 ier2 l m n iwk wk)
  )
  (setf num (+ num1 num2)) (setf ier (max0 ier1 ier2)) (setf cond false)
  (if (<= (abs (+ z1 (- z2))) (* eps2 (amax1 (abs z1) (abs z2))))
   (setf cond true)
  )
  (setf ierr 0) (if (> ier 4) (setf ierr 1))
  (return (values fun x cond num ierr))
))
