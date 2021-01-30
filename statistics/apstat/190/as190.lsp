;;;
;;; @(#)$Header$
;;;
;;; Studentized Range distribution. 
;;; 
;;; Brutal translation of Applied Statistics Algorithm AS190 from
;;; the FORTRAN program.
;;;
;;; Translated by B. Narasimhan, naras@euler.bd.psu.edu
;;; Report any problems to me.
;;;
;;; You can freely use and distribute this code provided you don't remove
;;; this notice. 
;;; NO WARRANTIES, EXPLICIT or IMPLIED!!!!!
;;;

(defun prtrng (q v r)
  "Args: (q v r)
Computes the probability of a studentized range being <= q with v
degrees of freedom from r samples. Applied Statistics AS190."
  (if (< v 1)
      (error "The degrees of freedom must be 1 or more"))
  (if (< r 2)
      (error "You must have at least 2 samples"))
  (if (< q 0.0)
      0.0
    (let ((result 0.0)
	  (vw (make-array 30))
	  (qw (make-array 30))
	  (pcutj 0.00003)
	  (pcutk 0.00001) 
	  (step 0.45)
	  (vmax 120.0)
          (cv1 0.193064705)
	  (cv2 0.293525326)
	  (cvmax 0.39894228)
	  (cv-1 0.318309886)
	  (cv-2 -0.268132716e-2)
	  (cv-3 0.347222222e-2)
	  (cv-4 0.833333333e-1)
	  (g nil)
	  (gmid nil)
	  (r1 nil)
	  (c nil)
	  (h nil)
	  (v2 nil)
	  (gstep nil)
	  (pk1 nil)
	  (pk2 nil)
	  (gk nil)
	  (pk nil)
	  (w0 nil)
	  (pz nil)
	  (x nil)
	  (hj nil)
	  (ehj nil)
	  (pj nil)
	  (jj nil)
          (jmin 3)
	  (jmax 15)
	  (kmin 7)
	  (kmax 15))
      (setf g (* step (^ r -.2)))
      (setf gmid (* 0.5 (log r)))
      (setf r1 (- r 1.0))
      (setf c (log (* r g cvmax)))
      (when (<= v vmax)
	(setf h (* step (^ v -0.5)))
	(setf v2 (* v 0.5))
	(cond 
	 ((= v 1.0) (setf c cv1))
	 ((= v 2.0) (setf c cv2))
	 (t (setf c (/ (* (sqrt v2) cv-1)
		       (+ 1.0 (/ (+ (/ (+ (/ cv-2 v2) cv-3) v2) cv-4) v2))))))
	(setf c (log (* c r g h))))
      (setf gstep g)
      (setf (aref qw 0) -1.0)
      (setf (aref qw jmax) -1.0)
      (setf pk1 1.0)
      (setf pk2 1.0)
      (catch 'label-99
	(dotimes (k kmax)
	  (setf gstep (- gstep g))
	  (loop
	   (setf gstep (- gstep))	 
	   (setf gk (+ gmid gstep))
	   (setf pk 0.0)
	   (when (or (> pk2 pcutk) (<= (1+ k) kmin))
	     (setf w0 (- c (* gk gk 0.5)))
	     (setf pz (- 1 (normal-cdf gk)))
	     (setf x (- 1 (normal-cdf (- gk q)) pz))
	     (if (> x 0)
		 (setf pk (exp (+ w0 (* r1 (log x))))))
	     (when (<= v vmax)
	       (setf jump (- jmax))
	       (loop
		(setf jump (+ jump jmax))
		(dotimes (j jmax)
		  (setf jj (+ j jump))
		  (when (<= (aref qw jj) 0)
		    (setf hj (* h (1+ j)))
		    (if (< (1+ j) jmax)
			(setf (aref qw (1+ jj)) -1.0))
		    (setf ehj (exp hj))
		    (setf (aref qw jj) (* q ehj))
		    (setf (aref vw jj)
			  (* v (+ hj 0.5 (* ehj ehj -0.5)))))
		  (setf pj 0.0)
		  (setf x (- 1 (normal-cdf (- gk (aref qw jj))) pz))
		  (if (> x 0.0)
		      (setf pj (exp (+ w0 (aref vw jj) (* r1 (log x))))))
		  (setf pk (+ pk pj))
		  (if (<= pj pcutj)
		      (if (or (> (1+ jj) jmin) (> (1+ k) kmin))
			  (return))))
		(setf h (- h))
		(if (>= h 0.0)
		    (return))))
	     (setf result (+ result pk)))
	   (if (and (> (1+ k) kmin) (<= pk pcutk) (<= pk1 pcutk))
	       (throw 'label-99 nil))
	   (setf pk2 pk1)
	   (setf pk1 pk)
	   (if (<= gstep 0.0) 
	       (return)))))
      result)))

	
(defun qtrng0 (p v r)
  "Args: (p v r)
Calculates an initial quantile p for a studentized range distribution
having v degrees of freedom from r samples; p must be between 0.8 and .995.
Applied Statistics AS190."
  (let ((q nil)
	(tt nil)
	(vmax 120.0)
	(c1 .8843)
	(c2 .2368)
	(c3 1.214)
	(c4 1.208)
	(c5 1.4142))
    (setf tt (normal-cdf (+ 0.5 (* 0.5 p))))
    (if (< v vmax)
	(setf tt (+ tt (/ (+ (* tt tt tt) tt) (* v 4)))))
    (setf q (- c1 (* c2 tt)))
    (if (< v vmax)
	(setf q (+ q (- (/ c3 v)) (/ (* c4 tt) v))))
    (* tt (+ (* q (log (1- r))) c5))))

(defun qrtrng (p v r)
  "Args: (p v r)
Approximates the quantile p for a studentized range distribution having v
degrees of freedom from r samples; p must be between 0.9 and .99. 
Applied Statistics 190."
  (if (< v 1)
      (error "The degrees of freedom must be 1 or more"))
  (if (< r 2)
      (error "You must have at least 2 samples"))
  (if (or (< p .90) (> p .99))
      (error "P must be between .90 and .99"))
  (let ((result nil)
	(jmax 8)
	(pcut .001)
	(d nil)
	(q1 nil)
	(p1 nil)
	(q2 nil)
	(p2 nil)
	(e1 nil)
	(e2 nil)
	(eps 1e-4))
    (setf q1 (qtrng0 p v r))
    (setf p1 (prtrng q1 v r))
    (setf result q1)
    (catch 'label-99
      (if (< (abs (- p1 p)) pcut)
	  (throw 'label-99 nil))
      (if (> p1 p)
	  (setf p1 (- (* 1.75 p) (* p1 0.75))))
      (if (< p1 p)
	  (setf p2 (+ p (/ (* (- p p1) (1- p) 0.75) (1- p1)))))
      (if (< p2 .80)
	  (setf p2 .8)
	(if (> p2 .995)
	    (setf p2 .995)))
      (setf q2 (qtrng0 p2 v r))
      (dotimes (j (1- jmax))
	(setf p2 (prtrng q2 v r))
	(setf e1 (- p1 p))
	(setf e2 (- p2 p))
	(setf result (* 0.5 (+ q1 q2)))
	(setf d (- e2 e1))
	(if (> (abs d) eps)
	    (setf result (/ (- (* e2 q1) (* e1 q2)) d)))
	(when (>= (abs e1) (abs e2))
	  (setf q1 q2)
	  (setf p1 p2))
	(if (< (abs (- p1 p)) (* pcut 5))
	    (throw 'label-99 nil))
	(setf q2 result)))
    result))
		 
	     
		       
	      
	    
					  
					    
				    
	      

	      
	          

    
    
    
