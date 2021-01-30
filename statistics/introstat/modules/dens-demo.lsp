;;;;
;;;;  This file contains programs to run demonstrations of plots of density
;;;;  and probability functions.  Where there are enough similarities
;;;;  between plots, these  have been consolidated into and object or function
;;;;

(defproto density-proto '(dens-fun dist-fun quant-fun xrange yvals title
                          cont parm-names parm-values parm-ranges xcompact)
			() scatterplot-proto)

(defproto distribution-proto () () density-proto)

(defproto new-slider-proto '(old-x old-value) () sequence-scroll-item-proto)

(defmeth new-slider-proto :old-x (&optional (val nil set))
 (if set (setf (slot-value 'old-x) val)
 (slot-value 'old-x)))

(defmeth new-slider-proto :old-value (&optional (val nil set))
 (if set (setf (slot-value 'old-value) val)
 (slot-value 'old-value)))


(defmeth density-proto :isnew (&key title dens-fun dist-fun quant-fun cont
                                    parm-names parm-values parm-ranges
                                    xcompact)
  (setf (slot-value 'title) title)
  (setf (slot-value 'dens-fun) dens-fun)
  (setf (slot-value 'dist-fun) dist-fun)
  (setf (slot-value 'quant-fun) quant-fun)
  (setf (slot-value 'cont) cont)
  (setf (slot-value 'parm-names) parm-names)
  (setf (slot-value 'parm-values) parm-values)
  (setf (slot-value 'parm-ranges) parm-ranges)
  (setf (slot-value 'xcompact) xcompact)

  (call-next-method 2 :show nil))

(defmacro normal-assessor (key slot prototype)
`(defmeth ,prototype ,key (&optional (content nil set))
   (when set (setf (slot-value ',slot) content))
   (slot-value ',slot)))

(defmacro replot-assessor (key slot prototype)
`(defmeth ,prototype ,key (&optional (content nil set))
   (when set (setf (slot-value ',slot) content)
             (send self :replot))
   (slot-value ',slot)))


(defmeth density-proto :check-range ()
 (let* (
        (parm-values (send self :parm-values))
        (quant (send self :quant-fun))
        (dens-fun (send self :dens-fun))
        (p .001)
        (top (apply #'funcall quant (- 1 p) parm-values))
        (bottom (apply #'funcall quant p parm-values))
       )
   (list bottom top)))
#|
   (loop
      (if (< (- top bottom) 100) (return (list bottom top))
          (setf p (+ p .01)))
      (setf top (apply #'funcall quant (- 1 p) parm-values))
      (setf bottom (apply #'funcall quant p parm-values)))))
|#          
              
(defmeth density-proto :xrange (&optional (val nil set))
(if set (setf (slot-value 'xrange) val))
 (let* (
        (range (send self :check-range))
        (bottom (first range)) 
        (top (second range))
        (xcompact (combine (mapcar #'eval (send self :xcompact))))
        (xbot (first xcompact))
        (xtop (second xcompact))
        (cont (send self :cont))
        (xlist (list (if xbot xbot bottom) (if xtop xtop top)))
       )
    (if cont (setf (slot-value 'xrange) 
               (apply #'rseq (append (+ xlist (list -1 1)) (list 200))))
             (setf (slot-value 'xrange) (apply #'iseq (+ (list -1 1) xlist))))
(unless set (slot-value 'xrange))
 )
)

(normal-assessor :parm-names parm-names density-proto)
(replot-assessor :parm-values parm-values density-proto)
(replot-assessor :parm-ranges parm-ranges density-proto)
(normal-assessor :dens-fun dens-fun density-proto)
(normal-assessor :dist-fun dist-fun density-proto)
(normal-assessor :quant-fun quant-fun density-proto)
(normal-assessor :cont cont density-proto)
(normal-assessor :xcompact xcompact density-proto)

;;
;;  This method causes the graph to replot itself with the current
;;  parameter argument
;;  The uniform distribution and the discrete probability functions are
;;  different from the others: as a result, the replot method is slightly
;;  different for these	.
;;  The uniform-density  and pmf-profile functions are called explicitly	

(defmeth distribution-proto :replot ()
    (let* (
           (parm-names (send self :parm-names))
           (parm-values (send self :parm-values))
           (parm-ranges (send self :parm-ranges))
           (dist-fun (send self :dist-fun))
           (x (send self :xrange))
#|
           (x (case dist-fun
                       (uniform-cdf (sort-data (append parm-values
                                                   (send self :xrange))))
                       (t (send self :xrange))))
|#
           (xy (case dist-fun
                 (binomial-cdf (discrete-cdf dist-fun parm-values x))
                 (poisson-cdf (discrete-cdf dist-fun parm-values x))
                 (t (list x (apply #'funcall dist-fun x parm-values)))))
          )
      (if (eql dist-fun 't-cdf)
                (let ((x (select xy 0))
                      (y (select xy 1)))
                 (if ( > 201 (send self :num-lines))
                                (send self :add-lines xy))
                        (send self :linestart-coordinate 0 (iseq 200 399) x )
                        (send self :linestart-coordinate 1 (iseq 200 399) y )

                        (send self :redraw))
          (progn
           (send self :clear-lines)
           (send self :add-lines xy)))
     )
)

(defmeth density-proto :replot ()
    (let* (
           (parm-names (send self :parm-names))
           (parm-values (send self :parm-values))
           (parm-ranges (send self :parm-ranges))
           (dens-fun (send self :dens-fun))
#|
           (x (case dens-fun
                       (rectangular-cdf (sort-data (append parm-values
                                                   (send self :xrange))))
                       (t (send self :xrange))))
|#
           (x (send self :xrange))
; define xy as the co-ordinate list for lines to be drawn
; it is slightly different for the uniform and probability functions
	   (xy (case dens-fun
		(uniform-dens (apply #'uniform-dens x parm-values))
		(poisson-pmf (discrete-pmf dens-fun parm-values x))
		(binomial-pmf (discrete-pmf dens-fun parm-values x))
                (t (list x (apply #'funcall dens-fun x parm-values))))))
; The redraw method is slightly different for t-distribution,
; as it has a reference line which slows things down if it too is redrawn
; This procedure redraws only the t-distribution, not the reference.
	(if (eql dens-fun 't-dens)
		(let ((x (select xy 0))
		      (y (select xy 1)))
; the first time through (only 200 pts), add the lines for the t-distribution
			(if ( > 201 (send self :num-lines))
      				(send self :add-lines xy))
; once the lines are in place, adjust their linestarts to the current x and y values
			(send self :linestart-coordinate 0 (iseq 200 399) x )
      			(send self :linestart-coordinate 1 (iseq 200 399) y )
      			(send self :redraw))
; For other distributions, simply clear and redraw the lines each time
		(let ((x (select xy 0))
		      (y (select xy 1)))
      			(send self :clear-lines)
      			(send self :add-lines xy)))))
;;;
;;;  This follows the code in Tierney for adding a mouse mode that shows
;;;  co-ordinates on a graph when the mouse is clicked there.
;;;
(send density-proto :add-mouse-mode 'show-coords
        :title "Show Co-ordinates"
        :click :do-show-coordinates
        :cursor 'finger)

(defmeth density-proto :do-show-coordinates (x y m1 m2)
  (let* ((xy (send self :canvas-to-real x y))
    (s (format nil "(~5,3f ~5,3f)" (first xy) (second xy)))
    (mode (send self :draw-mode)))
  (send self :draw-mode 'xor)
  (send self :draw-string s x y)
  (send self :while-button-down #'(lambda (x y ) nil))
  (send self :draw-string s x y)
  (send self :draw-mode mode)))


(defun distribution-demo (&key pdf-title cdf-title 
                               dens-fun dist-fun quant-fun cont xcompact
                               parm-names parm-values parm-ranges
                               dialog-title)
(let* ( 
       (w (if dist-fun (send density-proto :new
                  :title pdf-title
                  :dens-fun dens-fun
                  :dist-fun dist-fun
                  :quant-fun quant-fun
                  :cont cont
                  :xcompact xcompact
                  :parm-names parm-names
                  :parm-values parm-values
                  :parm-ranges parm-ranges
                  :show nil)))
       (u (if dens-fun (send distribution-proto :new 
                  :title cdf-title
                  :dens-fun dens-fun
                  :dist-fun dist-fun
                  :quant-fun quant-fun
                  :cont cont
                  :xcompact xcompact
                  :parm-names parm-names
                  :parm-values parm-values
                  :parm-ranges parm-ranges
                  :show nil)))
       (plots (if (and dist-fun dens-fun) (list u w)
                   (if dist-fun w u))))
;;
;;  For the t-dist'b'n, these lines add a reference graph of the 
;; standard normal to the plot in a thicker line type.
;; The lines representing the reference have linestarts 0 to 199
;;
                (when (eql 't-dens (send w :dens-fun))
                      (send w :draw-normal-dens)
                      (send u :draw-normal-cdf))
                (map-elements #'send plots :replot)
                (map-elements #'send plots :adjust-to-data)
                (map-elements #'send plots :mouse-mode 'show-coordinates)
                (map-elements #'send plots :show-window)
                (send u :location 500 50)
		(let* (
                       (parm-labels (mapcar #'(lambda (x) 
                           (send text-item-proto :new x)) parm-names))
                       (parm-display (mapcar #'(lambda (x) 
                           (send text-item-proto :new (format nil "~a" x)
                            :text-length 5))
                             parm-values))
                       (parm-scrolls (mapcar #'(lambda (label range display 
                                                        values)
                         (send new-slider-proto :new
                                        range
                                        :action
                                        #'(lambda (x)
                            (let* ((ind (position label parm-labels))
                                   (parm-values (send u :parm-values))
                                   (seq (send self :slot-value 'sequence))
                                   (diff (- x (send self :old-x)))
                                   (value (send self :value))
                                   (old-value (send self :old-value))
                                   (valuediff (- value old-value))
;                                   (bounds (send self :bounds))
                                   )
                                (send display :text (format nil "~5,3f" x))
                                (setf (elt parm-values ind) x)
                                (map-elements #'send plots :parm-values 
                                     (repeat (list parm-values) (length plots)))
                                (send self :slot-value 'sequence (+ seq diff))
                                (send self :value (- value valuediff))
                                (send self :old-x x)))))
                             parm-labels parm-ranges parm-display parm-values))
                        (close-all (send button-item-proto :new "Close Plots"
                                :action
                                #'(lambda ()
                                        (send d :close)
                                        (map-elements #'send plots :close)
                                        (gc))))
                        (rescale (send button-item-proto :new "Rescale Plots"
                                :action
                                #'(lambda ()
                                     (send u :adjust-to-data)
                                     (send w :adjust-to-data))))
                        (d (send dialog-proto :new
                             (append (transpose (list parm-labels parm-scrolls 
                                           parm-display))
                               (list (list close-all rescale)))
                                        :title dialog-title)))
                     (mapcar #'(lambda (x y) 
                                  (send x :old-x
                                       (elt (send x :slot-value 'sequence) 3))
                                  (send x :old-value 3)
                                  (send x :value 3))
                         parm-scrolls parm-values))))
           




(defmeth density-proto :draw-normal-dens ()
  (let ((x (send self :xrange)))
   (send self :add-lines x (normal-dens x))
   (send self :linestart-width (iseq 200) (repeat 2 200))))

(defmeth density-proto :draw-normal-cdf ()
  (let ((x (send self :xrange)))
    (send self :add-lines x (normal-cdf x))
    (send self :linestart-width (iseq 200) (repeat 2 200))))



(defun vec-gamma (x exponent scale)
  (/ (* (^ scale exponent) (^ x (- exponent 1)) (exp (* -1 scale x)))
	(exp (log-gamma exponent))))


(defun vec-gamma-cdf (x exponent scale)
  (let (
        (l1 (cumsum (mapcar #'(lambda (u v) (* (- v u) 
                                    (vec-gamma (list (mean (list u v)))
                                                exponent scale)))
                        (butlast x) (rest x))))
       )
    (combine (append l1 (last l1)))
  )
)



;;;; UNIFORM FUNCTION
;;
;;	The unif-dens function returns the x and y co-ordinates necessary
;;	to draw the rectangle representing the uniform density 
;;	on [a,b] over the range xrange
;;
(defun uniform-dens (xrange &optional (a 0) (b 10))

	(let (	(lowx  (min xrange))
		(highx (max xrange)))
	(list 	(list lowx a a b b highx)
		(list 0 0 (/ 1 (- b a)) (/ 1 (- b a)) 0 0))))

(defun uniform-cdf (xrange &optional (a 0) (b 10))
 (let (
       (l1 (/ (- xrange a) (- b a)))
      )
  (setf l1 (map-elements #'max l1 0))
  (setf l1 (map-elements #'min l1 1))
  l1))


  
;;
;; These functions (yvals-top-***) calculate the y-values for the tops of the bars
;; of the probability function (f) and return 2 values for each x value
;; One takes 2 arguments and the other 3.

(defun yvals-top-pmf (function parms x)
 (map 'list #'(lambda (z) (repeat (apply #'funcall function z parms) 2))
       (iseq (min x) (max x))))

(defun yvals-top-cdf (function parms x)
  (map 'list #'(lambda (z) (repeat (apply #'funcall function z parms) 2))
       (iseq (min x) (max x))))


;;
;;
;; Yvals-all creates the correct pattern of y-values and zeroes
;; for the tops and bottoms of the bars.
;; The pattern is: (0,p(0),p(0),0,p(1),p(1),0,p(2),p(2),0,...p((max_x)).p((max_x)),0)
;;e.g
;;	p0------p0
;;	|	|
;;	|	|
;;	|	p1------p1
;;	|	|	p2------p2
;;	|	|	|	|
;;	0	0	0	0

(defun yvals-all-pmf (function parms x)
   (combine 0 (map 'list #'(lambda (z) (combine z 0))
          (yvals-top-pmf function parms x))))

(defun yvals-all-cdf (function parms x)
 (let ((top (yvals-top-cdf function parms x)))
   (combine 0 top 1)))
   

;;
;; The function xvals-all creates the correct pattern of x-values for the
;; lines needed to draw the probability function.
;; The pattern is: (0,0,1,1,1,2,2,2,3,3,...,(max_x),(max_x)+1,(max_x)+1)
;;
(defun xvals-all (max-x)
(combine (list 0 0
             (repeat (iseq 1 max-x) (repeat 3 max-x))
             (+ max-x 1) (+ max-x 1))))

;;
;; This function returns the vectors representing the plot of the
;; discrete probability function.
;;

(defun discrete-pmf (function parms x)
 (let* (
        (maxx (max x))
        (minx (min x))
        (xvals (combine minx minx (repeat (iseq (1+ minx) maxx) 
                             (repeat 3 (- maxx minx))) (1+ maxx) (1+ maxx)))
        (yvals (yvals-all-pmf function parms x))
       )
  (list xvals yvals)))


(defun discrete-cdf (function parms x)
 (let* (
        (maxx (max x))
        (xvals (combine (repeat x (repeat 2 (length x))) maxx maxx))
        (yvals (yvals-all-cdf function parms x))
       )
  (list xvals yvals)))

;;;
;;;	This section defines menu items and their actions
;;;	Each menu item has an action which calls the "density-demo"
;;;	function with parameters appropriate for a reasonable
;;;	demonstration of the density or probability function
;;;


(defun start-density ()
  (require "probability-functions.lsp")
  (let* (
         (ask-dist (send text-item-proto :new "Pick a Distribution:"))
         (dist-list (send list-item-proto :new dist :columns 2))
         (ok (send button-item-proto :new "Ok" :action #'(lambda ()
               (let* (
                      (choice (elt dist (send dist-list :selection)))
                      (dist-fun (find-symbol (string-upcase
                                   (concatenate 'string choice "-cdf"))))
                      (dens-fun (find-symbol (string-upcase
                                   (concatenate 'string choice "-dens"))))
                      (pmf-fun (find-symbol (string-upcase
                                   (concatenate 'string choice "-pmf"))))
                      (quant-fun (find-symbol (string-upcase
                                   (concatenate 'string choice "-quant"))))
                      (cont (if dens-fun t nil))
                     )
                 (funcall (find-symbol (string-upcase choice))
                          (if dens-fun
                           (concatenate 'string choice " Density Function")
                           (concatenate 'string choice " Mass Function"))
                          (concatenate 'string choice " Distribution Function")
                          (if dens-fun dens-fun pmf-fun) 
                           dist-fun quant-fun cont)))))
 
       )
    (send dialog-proto :new (list ask-dist dist-list ok))))


(def dist (list "GAUSSIAN" "RECTANGULAR" "EXPONENTIAL" "F" "BETA" "CHISQ"
"RAYLEIGH" "PARETO" "LOGISTIC" "LAPLACE" "WEIBULL" "TRIANGULAR"
"INVERSE-GAUSSIAN" "SUM-OF-UNIFORMS" "POWER" "PERKS" "T"
"HYPERBOLIC-SECANT" "EXPONENTIAL-POWER" "EXTREME-VALUE"
"BINOMIAL" "POISSON" "MULTINOMIAL" "MULTIONORMAL"))



(defmacro make-dist (fun pdf-title cdf-title dens-fun dist-fun quant-fun cont
                     xcompact parm-names parm-values parm-ranges)
`(defun ,fun  (,pdf-title ,cdf-title ,dens-fun ,dist-fun ,quant-fun ,cont)
   (distribution-demo 
      :pdf-title ,pdf-title
      :cdf-title ,cdf-title
      :dens-fun ,dens-fun
      :dist-fun ,dist-fun
      :quant-fun ,quant-fun
      :cont ,cont
      :xcompact ,xcompact
      :parm-names ,parm-names
      :parm-values ,parm-values
      :parm-ranges ,parm-ranges)))


;;  
;;  Format for entering a distribution:
;;
;;  (make-dist name pdf-title cdf-title dens-fun dist-fun quant-fun cont
;;             XRANGE PARAMETER-NAMES PARAMETER-INITIAL-VALUES 
;;             INITIAL-RANGE-FOR-SCROLL-BAR
;;
;;  where XRANGE is either: 
;;  a) nil            if the domain of x is not bounded.
;;  b) (list LOW nil) where LOW is the lower bound for the domain of x
;;                    and there is no upper bound.
;;  c) (list nil UP)  where UP is the upper bound for the domain of x
;;                    and there is no lower bound.
;;  d) (list LOW UP)  where LOW is the lower bound for the domain of x
;;                    and UP is the upper bound for the domain of x.
;;
;;  PARAMETER-NAMES  is a list of strings for the names of the parameters.
;;
;;  PARAMETER-INITIAL-VALUES  is a list of read number for the initial
;;                            values of the parameters. 
;;
;;  INITIAL-RANGE-FOR-SCROLL-BAR  is a preliminary range for the 
;;                                scrolling of the parameters.  This range
;;                                can be extended by just scrolling on 
;;                                the scroll bar.
;;
;;
;;

(make-dist gaussian pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "Mu" "Sigma") 
           (list 0 2.5)
           (list (rseq -1 1 7) (rseq 0 5 7)))

(make-dist exponential pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list 0 nil)
           (list "Lambda")
           (list 1)
           (list (rseq 0.7 1.3 7)))

(make-dist rayleigh pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "Sigma")
           (list 1)
           (list (rseq 0 2 7)))

(make-dist F pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list 1 nil)
           (list "Numerator" "Denominator")
           (list 5 5)
           (list (iseq 2 8) (iseq 2 8)))

(make-dist chisq pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list 0 nil)
           (list "Df")
           (list 3)
           (list (iseq 0 6)))

(make-dist triangular pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list '(select (send self :parm-values) (list 0 2)))
           (list "Left" "Right" "Middle")
           (list 0 5 10)
           (list (iseq -3 3) (iseq 2 8) (iseq 7 13)))

(make-dist power pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list -1 2)
           (list "a")
           (list 3)
           (list (iseq 0 6)))

(make-dist binomial pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list 0 '(elt (send self :parm-values) 0))
           (list "n" "p")
           (list 10 0.5)
           (list (iseq 7 13) (rseq .4 .6 7)))

(make-dist poisson pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list 0 nil) 
           (list "Mean")
           (list 1)
           (list (rseq 0 2 7)))


(make-dist t pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list -4 4)
           (list "Df")
           (list 3)
           (list (iseq 0 6)))

(make-dist beta pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list .5 .5)
           (list "alpha" "beta")
           (list  1 1)
           (list (rseq .5 1.5 7) (rseq .5 1.5 7)))

(make-dist rectangular pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list '(send self :parm-values))
           (list "a" "b")
           (list 0 10)
           (list (rseq -3 3 7) (rseq 7 13 7)))

(make-dist pareto pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "a" "b")
           (list 1 1)
           (list (rseq .01 2 7) (rseq .01 2 7)))


(make-dist logistic pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "Mu" "Sigma")
           (list 0 5)
           (list (rseq -3 3 7) (rseq 2 8 7)))


(make-dist laplace pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "Mu" "Sigma")
           (list 0 5)
           (list (rseq -3 3 7) (rseq 4.5 5.5 7)))


(make-dist weibull pdf-title cdf-title dens-fun dist-fun quant-fun cont
           (list 1 nil)
           (list "a")
           (list 5)
           (list (rseq 4.5 5.5 7)))

(make-dist inverse-gaussian pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "Mu" "Lambda")
           (list 5 5)
           (list (rseq 4.5 5.5 7) (rseq 4.5 5.5 7)))

(make-dist sum-of-uniforms pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "n")
           (list 10)
           (list (iseq 7 13)))

(make-dist perks pdf-title cdf-title dens-fun dist-fun quant-fun cont
           nil
           (list "Mu" "Sigma" "a")
           (list 0 5 3)
           (list (rseq -3 3 7) (rseq 4.5 5.5 7) (iseq 0 6)))

(make-dist hyperbolic-secant pdf-title cdf-title dens-fun dist-fun quant-fun 
           cont 
           nil
           (list "Mu" "Sigma")
           (list 0 1)
           (list (rseq -1 1 7) (rseq 1 10 50)))

(make-dist exponential-power pdf-title cdf-title dens-fun dist-fun quant-fun
           cont
           nil
           (list "Mu" "Sigma" "a")
           (list 0 1 3)
           (list (rseq -.5 .5 7) (rseq 4.5 5.5 7) (iseq 0 6)))

(make-dist multinormal pdf-title cdf-title dens-fun dist-fun quant-fun
           cont
           nil
           (list "Mu" "Sigma")
           (list 0 1)
           (list (rseq -1 1 7) (rseq .5 1.5 7)))

(start-density)


