(require "runkde")
(require "kde")
(require "kdehisto")

;;;create the kde object
(setq chron
(make-kde :data '(20.77 22.56 22.71 22.99 26.39 27.08 27.32 27.33 27.57 27.81
             28.69 29.36 30.25 31.89 32.88 33.23 33.28 33.40 33.52 33.83 33.95 34.82)
	:title "Chrondite data"
	:x-values (rseq 15 40 100)
	:bandwidth 0.8
	:calc-method 'update
	:variable-bandwidth 'on-data-values
 :show-previous-estimate t
))
(send chron :pop-bw-slider)

