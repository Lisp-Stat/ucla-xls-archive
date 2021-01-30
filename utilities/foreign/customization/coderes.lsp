;;;;;;;;     Code-resources;;;;#|  Changes   3 Dec 91 ... Created.|#;;;;(require "utils");;;;(provide "coderes");;;;  _____  Globals  _____(defproto *code-manager*  '(dict)  );;     _____  Initialization  _____(defmeth *code-manager* :ISNEW ()  (let* ((wd (get-working-directory))         (dir (if (member :macintosh *features*)                  "Dave:Work:Customization:"                  (if (eq #\h (select wd 1))                      "/hilbert/users/bob/CODERES/"                      "/users/bob/CODERES/")                  ))   )    (setf (slot-value 'dict)          (list           (list 'poisson    (concatenate 'string dir "poisson.shlb"))           ))    t))  (defmeth *code-manager* :PRINT-FILES (&optional (stream t))  (format stream "~%  Key        File            Loaded~%")  (dolist (entry (send self :dict))          (format stream "  ~a --> ~a ~%" (first entry) (rest entry))          ))          ;;     _____  Slot management  _____(defmeth *code-manager* :DICT ()  (slot-value 'dict))(defmeth *code-manager* :DICT-ENTRY (sym)  (rest (assoc sym (send self :dict)))  )(defmeth *code-manager* :RESFILE (sym)  (first (send self :dict-entry sym)))(defmeth *code-manager* :RESNUM (sym)  (first (rest (send self :dict-entry sym))))(defmeth *code-manager* :RESNUM-IS (sym num)  (replace-if #'(lambda (x) (eql (car x) sym)) ; in-place!!!                    (send self :dict)                    (list sym (send self :resfile sym) num))  );;     _____  Resource File  _____(defmeth *code-manager* :LOADED? (sym)  (if (send self :resnum sym) t nil))(defmeth *code-manager* :LOAD (sym)  (if (send self :loaded? sym)      (format t "File for ~a is already loaded.~%" sym)      (let* ((file (send self :resfile sym))             (resnum  (if (member :macintosh *features*)                          (open-resource-file file :verbose t)                          (dyn-load           file)))   )        (format t "Loading code resources for ~a from ~a.~%" sym file)        (if (< 0 resnum)            (send self :resnum-is sym resnum)            (format t "Could not load resource ~a. Error ~d~%"                    sym resnum))        )))           (defmeth *code-manager* :UNLOAD (sym)  (when (and (member :macintosh *features*) (send self :loaded? sym))        (format t "Unloading resources for ~a.~%" sym)        (close-resource-file (send self :resnum sym))        (send self :resnum-is sym nil)        ));;     _____  Create the sole object  _____(send *code-manager* :isnew)