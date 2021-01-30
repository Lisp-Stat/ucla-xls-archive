;;;;---  file xlispstat-s-script.lsp ------ tested examples for use: 
;;;;---
;;;;

;;; Example initialization - substitute your path info here
;;; First, make sure you have the   userhome.lsp   file set up in
;;; the directory which you are running LispStat in.  The file should
;;; contain the parameter assignment for your home directory, for 
;;; example: (defparameter *HOME* "/belgica-2g/kilroy/")
;;;
;;; Then load the XLispStat code

(load "/belgica-2g/kilroy/xlisp.S/xlisp-s")

;;; Then initialize.  The optional argument is a path to a directory 
;;; to receive S variable assignments.  
;;; The default directory is "/your home directory/.Data/.CL.data".

(S-CL-initialize)
(S-CL-initialize "/belgica-2g/kilroy/xlisp.S/.Data/.CL.data")


(eval-in-S-running "ls" nil) ;;-- the first time: should start itself a new S
	       ;; is <==> to    (eval-in-S-running "ls" nil :NEW-S-process T)

(eval-in-S-running "search" nil)

(eval-in-S-running "ls" (list (cons "pos" 3)))
	;;==  ls(pos = 3)

(setf i10 (eval-in-S-running "seq" (list 10)))
	;; -> #(1 2 3 4 5 6 7 8 9 10) 

(eval-in-S-running "'^'" '(2 6))		; 2 ^ 6  -->  #(64)

(eval-in-S-running "sin" (list
			  (map 'vector
			    '(lambda (x) (* (/ pi 4) x))
			    '#(0 1 2 3 4 5))))
;; -> #(0 0.70710677 1 0.70710677 1.2246064e-16 -0.70710677) 

;;;----------------------------

; Sine plot using S graphics window type X11()

(let* ( (xp (coerce (sort (coerce
			   (eval-in-S-running "runif" (list 100 (cons "max" (* 2 pi))))
				   'list)
		  '<) 'vector))
	(eps (eval-in-S-running "rnorm" (list 100 '("sd" . 0.1))))
	(fx (eval-in-S-running "sin" (list xp)))
	(yp (eval-in-S-running "'+'" (list fx eps)))
	scr)

  (setf scr (eval-in-S-running "X11" nil))
  (setf scr (eval-in-S-running "plot" 
		     (list xp yp '("xlab" . "x") '("ylab" . "")
			   '("main" . "SIN(x) + Random noise 0.1 * N(0,1)")
  )))
  (setf scr (eval-in-S-running "lines" (list xp fx)))
)




;;;- Assign some variables in S, and later use them by using the name "S-<name>"

(assign-in-S-running (list
		      (list "v.ls" "ls" nil)
		      (list "pr7"  "c" '(2 5 7 11 13 17 19))
		      (list "v.mat"  "matrix" (list '#(1 2 3 4 5 6)  2  3))))

(eval-in-S-running "ls" '("v*"))
(setf v.mat 
  (get-S-value "v.mat")) ;;-- assigns from S to CL
;;	the same as (setf v.mat (eval-in-S-running "" (list '("S-"."v.mat")))

(eval-in-S-running "length" (list '("S-"."v.ls")))
;; is more flexible, but less easy than the equivalent:
(get-S-value "length(v.ls)")


;;;--- Use the 'S-<name>' technique to do NESTING of S-functions:

(eval-in-S-running "sum" (list '("S-"."seq(100)"))) ;; --> #(5050) = 1+2+...+100

(eval-in-S-running "X11" nil)   ;;---- start device !
(eval-in-S-running "plot" (list '("S-"."runif(100)")
				'("S-"."runif(100)")))

(defvar ls-pos) 
(setf ls-pos NIL)
;;-- a NIL argument works perfectly :
(eval-in-S-running "ls" (list "[a-e]*" ls-pos))
(setf ls-pos 3)
(eval-in-S-running "ls" (list "[a-e]*" ls-pos))

;;;===========================================================================
;;;
;;; Plot the Multivariate Planing Points for the Minimal Spanning Tree of the
;;; Iris data.
;;;
;;; Use Lisp-Stat graphics window.
;;;

(load-data "iris") ; Standard XLispStat data set

(defun convert-data-list-to-array (data-set)

"Arg (x) x: a list of length p whose every element is a list of
length n, i.e. a standard XLispStat dataset of p variables and n observations."

  (transpose (make-array (list (length data-set) (length (first data-set)))
	      :initial-contents data-set)))

(setq iris-array (convert-data-list-to-array iris))

;;; Create S variable and transfer iris data to S
(assign-in-S-running (list (list "iris.data" "" (list iris-array))))

;;; Call mstree() function.  The command in S would be:
;;; iris.mstree.p<-mstree(iris.data,plane=TRUE)
;;;
;;; Here we use the "assign-in-S-running-and-wait" function
;;; which checks for the final S assignment to the S symbol
;;; iris.mstree.p before exiting.  If you want to perform several
;;; assignments in S in which later assignments depend on earlier
;;; assignments, use this function rather than "assign-in-S-running"
;;; which does NOT wait for S to make its final assignment before
;;; exiting.  Thus the "assign-in-S-running" function can notify S
;;; to evaluate a variable before the variable has had its S assignment
;;; completed.  The (assign-in-S-running-and-wait   ) function
;;; avoids this nasty glitch.
;;;

(assign-in-S-running-and-wait (list (list "iris.mstree.p" "mstree"
				 (list '("S-"."iris.data")
                                       '("plane".("S-"."TRUE"))))))

;;; Retrieve the S result structure
(setq iris-mst-plane-data (get-s-value "iris.mstree.p"))

;;; Extract x-coordinates
(setq iris-mst-plane-x
  (coerce (rest (assoc 'x iris-mst-plane-data)) 'list))

;;;Extract y-coordinates
(setq iris-mst-plane-y
  (coerce (rest (assoc 'y iris-mst-plane-data)) 'list))

;;; plot the multivariate planing points
(plot-points iris-mst-plane-x iris-mst-plane-y) 


;;;
;;; To stop the background S process
;;;

(stop-S-running)


