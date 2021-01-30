(provide "log-n")
(require "dist")
(require "mu-si2")
(require "slid-win")

;-------------------------------------------------------------------------
; log-normal distribution class.
; histogram data is fitted using E[x] && Var[x] parameters.
;-------------------------------------------------------------------------

( defproto log-n 

; slots
  '() 

; shared slots
  '()

; ancestor
  (list dist mu-si2)

; documentation
  nil
)

;-------------------------- implementation -------------------------------

;-------------------------------------------------------------------------
; overridden methods
;-------------------------------------------------------------------------

( defmeth log-n :update-graph ()
  ( send self :guessed-mu (send (send self :mu-slider) :value) )
  ( send self :guessed-si2 (send (send self :si2-slider) :value) )
  ( call-next-method )
) ; method

( defmeth log-n :close-all-windows ()
  ( send (send self :mu-slider) :close t )
  ( send (send self :si2-slider) :close t )
  ( call-next-method )
) ; method

( defmeth log-n :do-command(command)
  (
    cond
    ( (eq command 'show-solution) (call-method mu-si2 :show-solution) )
    ( t (call-next-method command) )
  )
)

( defmeth log-n :make-x ()
  (
    let
    (
      ( min-range (min (send self :sample)) )
      ( max-range (max (send self :sample)) )
    )
    ( rseq min-range max-range 200 )
  ) ; let
) ; method

( defmeth log-n :make-y ()
  (
    let*
    ( 
      ( mu (send self :guessed-mu) )
      ( si (sqrt (send self :guessed-si2)) )
      ( x (send self :make-x) )
      ( x1 (/ 1 x) )
    ) ; end of local declarations
    ( * x1 (/ (normal-dens (/ (- (log (abs x)) mu) si)) si) )
  ) ; let
) ; method

( defmeth log-n :isnew ()
  (call-next-method)
; some local declarations
    (
      let*
      ( 
        ( graph-name "Log normal" )
        ( mu-slider-name "Mu")
        ( si2-slider-name "Si2" )
        ( mu (log (* (random 15) (abs (first (normal-rand 1))))) )

        ( si2 (log (first (gamma-rand 1 25))) )
        ( rand-seq (abs (+ mu (exp (normal-rand 200)))) )
        ( mu-range (* 1.3 (abs mu)) )
        ( si2-range (* 1.3 si2) )
        ( est-mu (mean rand-seq) )
        ( est-si2 (mean (^ (- rand-seq est-mu) 2)) )
      ) ; end of local declarations

      (send self :sample rand-seq)
      (send self :real-mu mu)
      (send self :real-si2 si2)
      (send self :estimated-mu est-mu)
      (send self :estimated-si2 est-si2)

; set up histogram window
      ( send (send self :graph) :size 384 384)
      ( send (send self :graph) :title graph-name )
      ( send (send self :graph) :add-points rand-seq )
      ( send (send self :graph) :adjust-to-data )
      ( send (send self :graph) :num-bins 25 )

; create mu-slider
      ( send self :mu-slider
        ( send slid-win :new
          self
          (list (- mu-range) mu-range)
          :points 500
          :action #'(lambda(x) (send self :do-command 'update-graph))
          :title mu-slider-name
        )
      )
      ( send (send self :mu-slider) :location 450 100 ) 

; create si2-slider
      ( send self :si2-slider
        ( send slid-win :new
          self
          (list 0.1 si2-range)
          :points 500
          :action #'(lambda(x) (send self :do-command 'update-graph))
          :title si2-slider-name
        )
      )
      ( send (send self :si2-slider) :location 450 210 )
    ) ; let*

; give a random default value to mu && si2 sliders
  ( send (send self :mu-slider) :value (/ (send self :real-mu) 2) )
  ( send (send self :si2-slider) :value (/ (send self :real-si2) 2) )
  ( send self :guessed-mu (send (send self :mu-slider) :value) )
  ( send self :guessed-si2 (send (send self :si2-slider) :value) )
  ( send self :update-graph )
) ; method
