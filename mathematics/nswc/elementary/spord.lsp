(defun spord (m n ia r iwk) (declare (type fixnum m)) (declare (type fixnum n))
 (declare (type (simple-array fixnum (*)) ia))
 (declare (type (simple-array fixnum (*)) r))
 (declare (type (simple-array fixnum (*)) iwk))
 (prog ((k 0) (l 0) (num 0) (ii 0) (i 0) (np1 0)) (declare (type fixnum k))
  (declare (type fixnum l)) (declare (type fixnum num))
  (declare (type fixnum ii)) (declare (type fixnum i))
  (declare (type fixnum np1)) (setf np1 (+ n 1))
  (fdo ((i 1 (+ i 1))) ((> i np1) nil) (tagbody (fset (fref iwk i) 0)))
  (setf i m)
  (fdo ((ii 1 (+ ii 1))) ((> ii m) nil)
   (tagbody (setf num (+ (+ (fref ia (+ i 1)) (- (fref ia i))) 1))
    (setf l (+ np1 i)) (fset (fref iwk l) (fref iwk num))
    (fset (fref iwk num) i) (setf i (+ i (- 1)))
  ))
  (setf num 1) (setf k (fref iwk num))
  (fdo ((i 1 (+ i 1))) ((> i m) nil)
   (tagbody label30 (if (/= k 0) (go label31)) (setf num (+ num 1))
    (setf k (fref iwk num)) (go label30) label31 (fset (fref r i) k)
    (setf l (+ np1 k)) (setf k (fref iwk l))
  ))
  (return (values m n ia r iwk))
))
