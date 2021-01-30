(require "f2cl_macros")

(defun qtrap (func a b s &key (eps 1.0E-6) (jmax 20))
 (declare (type double-float func)) (declare (type double-float a))
 (declare (type double-float b)) (declare (type double-float s))
 (declare (type double-float eps)) (declare (type fixnum jmax))
 (prog ((j 0) (olds 0.0d0)) (declare (type fixnum j))
  (declare (type double-float olds)) (setf olds (- 1.0E30))
  (fdo ((j 1 (+ j 1))) ((> j jmax) nil)
   (tagbody (multiple-value-setq (func a b s j) (trapzd func a b s j))
    (if (< (abs (+ s (- olds))) (* eps (abs olds))) (go end_label))
    (setf olds s)
  ))
end_label
  (return (values func a b s))
))

(defun qsimp (func a b s &key (eps 1.0E-6) (jmax 20))
 (declare (type double-float func)) (declare (type double-float a))
 (declare (type double-float b)) (declare (type double-float s))
 (declare (type double-float eps)) (declare (type fixnum jmax))
 (prog ((st 0.0d0) (j 0) (os 0.0d0) (ost 0.0d0))
  (declare (type double-float st)) (declare (type fixnum j))
  (declare (type double-float os)) (declare (type double-float ost))
  (setf ost (- 1.0E30)) (setf os (- 1.0E30))
  (fdo ((j 1 (+ j 1))) ((> j jmax) nil)
   (tagbody (multiple-value-setq (func a b st j) (trapzd func a b st j))
    (setf s (/ (+ (* 4.0 st) (- ost)) 3.0))
    (if (< (abs (+ s (- os))) (* eps (abs os))) (go end_label)) (setf os s)
    (setf ost st)
  ))
  end_label
  (return (values func a b s))
))

(defun trapzd (func a b s n) (declare (type double-float a))
 (declare (type double-float b)) (declare (type double-float s))
 (declare (type fixnum n))
 (prog ((j 0) (sum 0.0d0) (x 0.0d0) (del 0.0d0) (tnm 0.0d0) (it 0))
  (declare (type fixnum j)) (declare (type double-float sum))
  (declare (type double-float x)) (declare (type double-float del))
  (declare (type double-float tnm)) (declare (type fixnum it))
  (cond
   ((= n 1)
    (setf s (* (* 0.5 (+ b (- a))) (+ (funcall func a) (funcall func b))))
   )
   (t (setf it (^ 2 (- n 2)))
      (setf tnm it) (setf del (/ (+ b (- a)) tnm)) (setf x (+ a (* 0.5 del)))
    (setf sum 0.0)
    (fdo ((j 1 (+ j 1))) ((> j it) nil)
     (tagbody (setf sum (+ sum (funcall func x))) (setf x (+ x del)))
    )
    (setf s (* 0.5 (+ s (/ (* (+ b (- a)) sum) tnm))))
  ))
  (return (values func a b s n))
))
