(proclaim
 '(special npardm kntdim nbreak edist level smooth degree dbreak bright bleft
   xbreak charf norm accur b a knots error buffer discrd right nstack npar
   maxstk maxpar maxknt maxaux left interp ibreak factor both break xright
   xleft errori dsctol rightx nintrp leftx xintrp xdd fright fleft fintrp
   ddtemp
) )
(declare (type fixnum npardm))
(declare (type fixnum kntdim))
(declare (type fixnum nbreak))
(declare (type fixnum edist))
(declare (type fixnum level))
(declare (type fixnum smooth))
(declare (type fixnum degree))
(declare (type (simple-array double-float (20)) dbreak))
(declare (type (simple-array double-float (20)) bright))
(declare (type (simple-array double-float (20)) bleft))
(declare (type (simple-array double-float (20)) xbreak))
(declare (type double-float charf))
(declare (type double-float norm))
(declare (type double-float accur))
(declare (type double-float b))
(declare (type double-float a))
(declare (type fixnum knots))
(declare (type double-float error))
(declare (type double-float buffer))
(declare (type t discrd))
(declare (type fixnum right))
(declare (type fixnum nstack))
(declare (type fixnum npar))
(declare (type fixnum maxstk))
(declare (type fixnum maxpar))
(declare (type fixnum maxknt))
(declare (type fixnum maxaux))
(declare (type fixnum left))
(declare (type fixnum interp))
(declare (type fixnum ibreak))
(declare (type (simple-array double-float (20)) factor))
(declare (type fixnum both))
(declare (type fixnum break))
(declare (type (simple-array double-float (50)) xright))
(declare (type (simple-array double-float (50)) xleft))
(declare (type double-float errori))
(declare (type double-float dsctol))
(declare (type fixnum rightx))
(declare (type fixnum nintrp))
(declare (type fixnum leftx))
(declare (type (simple-array double-float (18)) xintrp))
(declare (type (simple-array double-float (20)) xdd))
(declare (type (simple-array double-float (10)) fright))
(declare (type (simple-array double-float (10)) fleft))
(declare (type (simple-array double-float (18)) fintrp))
(declare (type (simple-array double-float (20 20)) ddtemp))

(defun adset (xknots coefs kdimen kmax ndimen ierr)
 (declare (type (simple-array double-float (*)) xknots))
 (declare (type (simple-array double-float (* *)) coefs))
 (declare (type fixnum kdimen)) (declare (type fixnum kmax))
 (declare (type fixnum ndimen)) (declare (type fixnum ierr))
 (prog
  ((dpmpar 0.0d0) (akmax 0.0d0) (eps 0.0d0) (eps0 0.0d0) (km1 0.0d0)
   (ratio 0.0d0) (zero 0.0d0) (one 0.0d0) (two 0.0d0) (three 0.0d0)
   (c100 0.0d0) (k 0) (limsm 0) (j 0)
  )
  (declare (type double-float dpmpar)) (declare (type double-float akmax))
  (declare (type double-float eps)) (declare (type double-float eps0))
  (declare (type double-float km1)) (declare (type double-float ratio))
  (declare (type double-float zero)) (declare (type double-float one))
  (declare (type double-float two)) (declare (type double-float three))
  (declare (type double-float c100)) (declare (type fixnum k))
  (declare (type fixnum limsm)) (declare (type fixnum j))
  (setq eps0 (+ |1.0D| (- 30))) (setq zero 0.0d0) (setq kleft 1)
  (setf eps (dpmpar 1)) (setf buffer (* c100 (dmax1 eps eps0)))
  (setf left kleft) (setf right kright) (setf both kboth) (setf kntdim kdimen)
  (setf npardm ndimen) (setf maxknt kntdim) (setf maxstk 50)
  (setf maxpar (min0 20 npardm)) (setf maxaux 20) (setf ierr 0)
  (if (or (>= a b) (<= accur zero)) (go label200))
  (if (or (>= degree maxpar) (>= (* 2 smooth) degree)) (go label200))
  (setf akmax kmax) (setf ratio (/ (+ b (- a)) (+ (dabs a) (dabs b))))
  (if (<= ratio (* (* two buffer) akmax)) (go label210))
  (if (< charf (/ (+ b (- a)) akmax)) (go label220))
  (if
   (and (>= norm zero)
    (/= (* (* (+ norm (- one)) (+ norm (- two))) (+ norm (- three))) zero)
   )
   (go label200)
  )
  (if (/= (* (* edist (+ edist (- 1))) (+ edist (- 2))) 0) (go label200))
  (if (or (< nbreak 0) (> nbreak maxaux)) (go label200))
  (if (= nbreak 0) (go label150)) (setf j 1)
  (if (or (< (fref xbreak 1) a) (> (fref xbreak nbreak) b)) (go label230))
  (if (= nbreak 1) (go label110))
  (fdo ((j 2 (+ j 1))) ((> j nbreak) nil)
   (tagbody (if (>= (fref xbreak (+ j (- 1))) (fref xbreak j)) (go label230)))
  )
  label110 (setf limsm (/ (+ degree (- 1)) 2))
  (fdo ((j 1 (+ j 1))) ((> j nbreak) nil)
   (tagbody
    (if (or (< (fref dbreak j) 0) (> (fref dbreak j) limsm)) (go label240))
  ))
  label150 (setf nstack 1) (fset (fref xleft 1) a) (fset (fref xright 1) b)
  (setf error zero) (setf dsctol (expt accur (dabs norm)))
  (if (= edist 0) (setf dsctol (/ dsctol (+ b (- a)))))
  (if (= norm three) (setf dsctol accur)) (setf ibreak 1) (setf knots 1)
  (setf interp (+ (+ degree 2) (* (* -1 2) smooth))) (fset (fref xknots 1) a)
  (setf npar (+ degree 1)) (fset (fref factor 1) one)
  (fset (fref factor 2) one)
  (fdo ((k 3 (+ k 1))) ((> k npar) nil)
   (tagbody (setf km1 (+ k (- 1)))
    (fset (fref factor k) (* km1 (fref factor (+ k (- 1)))))
  ))
  (go end_label) label200 (setf ierr (- 1)) (go end_label) label210
  (setf ierr (- 2)) (go end_label) label220 (setf ierr (- 3)) (go end_label)
  label230 (setf ierr (- 4)) (go end_label) label240 (setf ierr (- 5))
  (go end_label) end_label
  (return (values xknots coefs kdimen kmax ndimen ierr))
))
