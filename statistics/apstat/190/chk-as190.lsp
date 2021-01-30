(require "as190")
(def ml (iseq 2 11))
(def vl '(5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 24 30 40 60 120))

(dolist (v vl)
  (format t "~%")
  (dolist (x (mapcar #'(lambda(x) (qrtrng .95 v x)) ml))
    (format t "~4,2f " x))
  (format t "~%")
  (dolist (x (mapcar #'(lambda(x) (qrtrng .99 v x)) ml))
    (format t "~4,2f " x)))