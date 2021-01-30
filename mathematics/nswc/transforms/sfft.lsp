(defun sfft (a b ntot n nspan isn ierr)
 (declare (type (simple-array double-float (*)) a))
 (declare (type (simple-array double-float (*)) b))
 (declare (type fixnum ntot)) (declare (type fixnum n))
 (declare (type fixnum nspan)) (declare (type fixnum isn))
 (declare (type fixnum ierr))
 (prog
  ((at (make-array '(23) :element-type 'double-float))
   (ck (make-array '(23) :element-type 'double-float))
   (bt (make-array '(23) :element-type 'double-float))
   (sk (make-array '(23) :element-type 'double-float))
   (nfac (make-array '(15) :element-type 'fixnum))
   (np (make-array '(209) :element-type 'fixnum)) (ii 0) (bb 0.0d0) (aa 0.0d0)
   (k4 0) (s3 0.0d0) (c3 0.0d0) (s2 0.0d0) (c2 0.0d0) (bjm 0.0d0) (bjp 0.0d0)
   (bkm 0.0d0) (bkp 0.0d0) (ajm 0.0d0) (ajp 0.0d0) (akm 0.0d0) (akp 0.0d0)
   (k3 0) (kspnn 0) (bj 0.0d0) (aj 0.0d0) (v 0.0d0) (u 0.0d0) (s1 0.0d0)
   (c1 0.0d0) (bk 0.0d0) (ak 0.0d0) (k2 0) (k1 0) (kk 0) (cd 0.0d0) (sd 0.0d0)
   (num 0) (kt 0) (jj 0) (j 0) (l 0) (k 0) (m 0) (jf 0) (radf 0.0d0) (jc 0)
   (nn 0) (kspan 0) (ks 0) (nt 0) (inc 0) (s120 0.0d0) (c72 0.0d0) (s72 0.0d0)
   (rad 0.0d0) (maxp 0) (maxf 0) (maxn 0) (i 0)
  )
  (declare (type (simple-array double-float (*)) at))
  (declare (type (simple-array double-float (*)) ck))
  (declare (type (simple-array double-float (*)) bt))
  (declare (type (simple-array double-float (*)) sk))
  (declare (type (simple-array fixnum (*)) nfac))
  (declare (type (simple-array fixnum (*)) np)) (declare (type fixnum ii))
  (declare (type double-float bb)) (declare (type double-float aa))
  (declare (type fixnum k4)) (declare (type double-float s3))
  (declare (type double-float c3)) (declare (type double-float s2))
  (declare (type double-float c2)) (declare (type double-float bjm))
  (declare (type double-float bjp)) (declare (type double-float bkm))
  (declare (type double-float bkp)) (declare (type double-float ajm))
  (declare (type double-float ajp)) (declare (type double-float akm))
  (declare (type double-float akp)) (declare (type fixnum k3))
  (declare (type fixnum kspnn)) (declare (type double-float bj))
  (declare (type double-float aj)) (declare (type double-float v))
  (declare (type double-float u)) (declare (type double-float s1))
  (declare (type double-float c1)) (declare (type double-float bk))
  (declare (type double-float ak)) (declare (type fixnum k2))
  (declare (type fixnum k1)) (declare (type fixnum kk))
  (declare (type double-float cd)) (declare (type double-float sd))
  (declare (type fixnum num)) (declare (type fixnum kt))
  (declare (type fixnum jj)) (declare (type fixnum j))
  (declare (type fixnum l)) (declare (type fixnum k)) (declare (type fixnum m))
  (declare (type fixnum jf)) (declare (type double-float radf))
  (declare (type fixnum jc)) (declare (type fixnum nn))
  (declare (type fixnum kspan)) (declare (type fixnum ks))
  (declare (type fixnum nt)) (declare (type fixnum inc))
  (declare (type double-float s120)) (declare (type double-float c72))
  (declare (type double-float s72)) (declare (type double-float rad))
  (declare (type fixnum maxp)) (declare (type fixnum maxf))
  (declare (type fixnum maxn)) (declare (type fixnum i)) ---->
  (equivalence (i |,| ii)) (setf maxn 15) (setf maxf 23) (setf maxp 209)
  (setf rad 6.2831855) (setf s72 0.95105654) (setf c72 0.309017)
  (setf s120 0.8660254) (setf ierr 0)
  (arithmetic-if (+ n (- 1)) (go label1000) (go label960) (go label5)) label5
  (setf inc isn) (if (>= isn 0) (go label10)) (setf s72 (- s72))
  (setf s120 (- s120)) (setf rad (- rad)) (setf inc (- inc)) label10
  (setf nt (* inc ntot)) (setf ks (* inc nspan)) (setf kspan ks)
  (setf nn (+ nt (- inc))) (setf jc (/ ks n))
  (setf radf (* (* rad (float jc)) 0.5)) (setf i 0) (setf jf 0) (setf m 0)
  (setf k n) (setf max (/ maxn 2)) (go label20) label15
  (if (= m max) (go label1001)) (setf m (+ m 1)) (fset (fref nfac m) 4)
  (setf k l) label20 (setf l (/ k 16)) (if (= k (* l 16)) (go label15))
  (setf j 3) (setf jj 9) (go label30) label25 (if (= m max) (go label1001))
  (setf m (+ m 1)) (fset (fref nfac m) j) (setf k (/ k jj)) label30
  (if (= (mod k jj) 0) (go label25)) (setf j (+ j 2)) (setf jj (expt j 2))
  (if (and (<= j maxf) (<= jj k)) (go label30)) (if (> k 4) (go label40))
  (setf kt m) (fset (fref nfac (+ m 1)) k) (if (/= k 1) (setf m (+ m 1)))
  (go label80) label40 (setf l (/ k 4)) (if (/= k (* l 4)) (go label50))
  (if (= m max) (go label1001)) (setf m (+ m 1)) (fset (fref nfac m) 2)
  (setf k l) (setf kt m) (if (= k 1) (go label85)) label50 (setf kt m)
  (if (> (+ k (- 1)) maxp) (go label1002))
  (setf num (+ (+ maxn (- kt)) (- kt))) (setf j 2) label60
  (if (/= (mod k j) 0) (go label70)) (setf m (+ m 1)) (fset (fref nfac m) j)
  (setf num (+ num (- 1))) (setf k (/ k j)) (if (= k 1) (go label80))
  (if (<= num 0) (go label1001)) label70 (setf l (/ (+ j 1) 2))
  (setf j (+ (+ l l) 1)) (if (<= j maxf) (go label60)) (go label1002) label80
  (if (= kt 0) (go label100)) label85 (setf j kt) label90 (setf m (+ m 1))
  (fset (fref nfac m) (fref nfac j)) (setf j (+ j (- 1)))
  (if (/= j 0) (go label90)) label100 (setf sd (/ radf (float kspan)))
  (setf cd (* 2.0 (expt (sin sd) 2))) (setf sd (sin (+ sd sd))) (setf kk 1)
  (setf i (+ i 1)) (if (/= (fref nfac i) 2) (go label400))
  (setf kspan (/ kspan 2)) (setf k1 (+ kspan 2)) label210
  (setf k2 (+ kk kspan)) (setf ak (fref a k2)) (setf bk (fref b k2))
  (fset (fref a k2) (+ (fref a kk) (- ak)))
  (fset (fref b k2) (+ (fref b kk) (- bk)))
  (fset (fref a kk) (+ (fref a kk) ak)) (fset (fref b kk) (+ (fref b kk) bk))
  (setf kk (+ k2 kspan)) (if (<= kk nn) (go label210)) (setf kk (+ kk (- nn)))
  (if (<= kk jc) (go label210)) (if (> kk kspan) (go label800)) label220
  (setf c1 (+ 1.0 (- cd))) (setf s1 sd) label230 (setf k2 (+ kk kspan))
  (setf ak (+ (fref a kk) (- (fref a k2))))
  (setf bk (+ (fref b kk) (- (fref b k2))))
  (fset (fref a kk) (+ (fref a kk) (fref a k2)))
  (fset (fref b kk) (+ (fref b kk) (fref b k2)))
  (fset (fref a k2) (+ (* c1 ak) (* (* -1 s1) bk)))
  (fset (fref b k2) (+ (* s1 ak) (* c1 bk))) (setf kk (+ k2 kspan))
  (if (< kk nt) (go label230)) (setf k2 (+ kk (- nt))) (setf c1 (- c1))
  (setf kk (+ k1 (- k2))) (if (> kk k2) (go label230))
  (setf u (+ (* sd s1) (* cd c1))) (setf v (+ (* sd c1) (* (* -1 cd) s1)))
  (setf ak (+ c1 (- u))) (setf s1 (+ s1 v))
  (setf c1 (+ 1.5 (* (* -1 0.5) (+ (* ak ak) (* s1 s1))))) (setf s1 (* c1 s1))
  (setf c1 (* c1 ak)) (setf kk (+ kk jc)) (if (< kk k2) (go label230))
  (setf k1 (+ (+ k1 inc) inc)) (setf kk (+ (/ (+ k1 (- kspan)) 2) jc))
  (if (<= kk (+ jc jc)) (go label220)) (go label100) label320
  (setf k1 (+ kk kspan)) (setf k2 (+ k1 kspan)) (setf ak (fref a kk))
  (setf bk (fref b kk)) (setf aj (+ (fref a k1) (fref a k2)))
  (setf bj (+ (fref b k1) (fref b k2))) (fset (fref a kk) (+ ak aj))
  (fset (fref b kk) (+ bk bj)) (setf ak (+ (* (* -1 0.5) aj) ak))
  (setf bk (+ (* (* -1 0.5) bj) bk))
  (setf aj (* (+ (fref a k1) (- (fref a k2))) s120))
  (setf bj (* (+ (fref b k1) (- (fref b k2))) s120))
  (fset (fref a k1) (+ ak (- bj))) (fset (fref b k1) (+ bk aj))
  (fset (fref a k2) (+ ak bj)) (fset (fref b k2) (+ bk (- aj)))
  (setf kk (+ k2 kspan)) (if (< kk nn) (go label320)) (setf kk (+ kk (- nn)))
  (if (<= kk kspan) (go label320)) (go label700) label400
  (if (/= (fref nfac i) 4) (go label600)) (setf kspnn kspan)
  (setf kspan (/ kspan 4)) label410 (setf c1 1.0) (setf s1 0.0) label420
  (setf k1 (+ kk kspan)) (setf k2 (+ k1 kspan)) (setf k3 (+ k2 kspan))
  (setf akp (+ (fref a kk) (fref a k2)))
  (setf akm (+ (fref a kk) (- (fref a k2))))
  (setf ajp (+ (fref a k1) (fref a k3)))
  (setf ajm (+ (fref a k1) (- (fref a k3)))) (fset (fref a kk) (+ akp ajp))
  (setf ajp (+ akp (- ajp))) (setf bkp (+ (fref b kk) (fref b k2)))
  (setf bkm (+ (fref b kk) (- (fref b k2))))
  (setf bjp (+ (fref b k1) (fref b k3)))
  (setf bjm (+ (fref b k1) (- (fref b k3)))) (fset (fref b kk) (+ bkp bjp))
  (setf bjp (+ bkp (- bjp))) (if (< isn 0) (go label450))
  (setf akp (+ akm (- bjm))) (setf akm (+ akm bjm)) (setf bkp (+ bkm ajm))
  (setf bkm (+ bkm (- ajm))) (if (= s1 0.0) (go label460)) label430
  (fset (fref a k1) (+ (* akp c1) (* (* -1 bkp) s1)))
  (fset (fref b k1) (+ (* akp s1) (* bkp c1)))
  (fset (fref a k2) (+ (* ajp c2) (* (* -1 bjp) s2)))
  (fset (fref b k2) (+ (* ajp s2) (* bjp c2)))
  (fset (fref a k3) (+ (* akm c3) (* (* -1 bkm) s3)))
  (fset (fref b k3) (+ (* akm s3) (* bkm c3))) (setf kk (+ k3 kspan))
  (if (<= kk nt) (go label420)) label440 (setf u (+ (* sd s1) (* cd c1)))
  (setf v (+ (* sd c1) (* (* -1 cd) s1))) (setf c2 (+ c1 (- u)))
  (setf s1 (+ s1 v)) (setf c1 (+ 1.5 (* (* -1 0.5) (+ (* c2 c2) (* s1 s1)))))
  (setf s1 (* c1 s1)) (setf c1 (* c1 c2))
  (setf c2 (+ (* c1 c1) (* (* -1 s1) s1))) (setf s2 (* (* 2.0 c1) s1))
  (setf c3 (+ (* c2 c1) (* (* -1 s2) s1))) (setf s3 (+ (* c2 s1) (* s2 c1)))
  (setf kk (+ (+ kk (- nt)) jc)) (if (<= kk kspan) (go label420))
  (setf kk (+ (+ kk (- kspan)) inc)) (if (<= kk jc) (go label410))
  (if (= kspan jc) (go label800)) (go label100) label450 (setf akp (+ akm bjm))
  (setf akm (+ akm (- bjm))) (setf bkp (+ bkm (- ajm))) (setf bkm (+ bkm ajm))
  (if (/= s1 0.0) (go label430)) label460 (fset (fref a k1) akp)
  (fset (fref b k1) bkp) (fset (fref a k2) ajp) (fset (fref b k2) bjp)
  (fset (fref a k3) akm) (fset (fref b k3) bkm) (setf kk (+ k3 kspan))
  (if (<= kk nt) (go label420)) (go label440) label510
  (setf c2 (+ (expt c72 2) (- (expt s72 2)))) (setf s2 (* (* 2.0 c72) s72))
  label520 (setf k1 (+ kk kspan)) (setf k2 (+ k1 kspan)) (setf k3 (+ k2 kspan))
  (setf k4 (+ k3 kspan)) (setf akp (+ (fref a k1) (fref a k4)))
  (setf akm (+ (fref a k1) (- (fref a k4))))
  (setf bkp (+ (fref b k1) (fref b k4)))
  (setf bkm (+ (fref b k1) (- (fref b k4))))
  (setf ajp (+ (fref a k2) (fref a k3)))
  (setf ajm (+ (fref a k2) (- (fref a k3))))
  (setf bjp (+ (fref b k2) (fref b k3)))
  (setf bjm (+ (fref b k2) (- (fref b k3)))) (setf aa (fref a kk))
  (setf bb (fref b kk)) (fset (fref a kk) (+ (+ aa akp) ajp))
  (fset (fref b kk) (+ (+ bb bkp) bjp))
  (setf ak (+ (+ (* akp c72) (* ajp c2)) aa))
  (setf bk (+ (+ (* bkp c72) (* bjp c2)) bb))
  (setf aj (+ (* akm s72) (* ajm s2))) (setf bj (+ (* bkm s72) (* bjm s2)))
  (fset (fref a k1) (+ ak (- bj))) (fset (fref a k4) (+ ak bj))
  (fset (fref b k1) (+ bk aj)) (fset (fref b k4) (+ bk (- aj)))
  (setf ak (+ (+ (* akp c2) (* ajp c72)) aa))
  (setf bk (+ (+ (* bkp c2) (* bjp c72)) bb))
  (setf aj (+ (* akm s2) (* (* -1 ajm) s72)))
  (setf bj (+ (* bkm s2) (* (* -1 bjm) s72))) (fset (fref a k2) (+ ak (- bj)))
  (fset (fref a k3) (+ ak bj)) (fset (fref b k2) (+ bk aj))
  (fset (fref b k3) (+ bk (- aj))) (setf kk (+ k4 kspan))
  (if (< kk nn) (go label520)) (setf kk (+ kk (- nn)))
  (if (<= kk kspan) (go label520)) (go label700) label600
  (setf k (fref nfac i)) (setf kspnn kspan) (setf kspan (/ kspan k))
  (if (= k 3) (go label320)) (if (= k 5) (go label510))
  (if (= k jf) (go label640)) (setf jf k) (setf s1 (/ rad (float k)))
  (setf c1 (cos s1)) (setf s1 (sin s1)) (fset (fref ck jf) 1.0)
  (fset (fref sk jf) 0.0) (setf j 1) label630
  (fset (fref ck j) (+ (* (fref ck k) c1) (* (fref sk k) s1)))
  (fset (fref sk j) (+ (* (fref ck k) s1) (* (* -1 (fref sk k)) c1)))
  (setf k (+ k (- 1))) (fset (fref ck k) (fref ck j))
  (fset (fref sk k) (- (fref sk j))) (setf j (+ j 1))
  (if (< j k) (go label630)) label640 (setf k1 kk) (setf k2 (+ kk kspnn))
  (setf aa (fref a kk)) (setf bb (fref b kk)) (setf ak aa) (setf bk bb)
  (setf j 1) (setf k1 (+ k1 kspan)) label650 (setf k2 (+ k2 (- kspan)))
  (setf j (+ j 1)) (fset (fref at j) (+ (fref a k1) (fref a k2)))
  (setf ak (+ (fref at j) ak)) (fset (fref bt j) (+ (fref b k1) (fref b k2)))
  (setf bk (+ (fref bt j) bk)) (setf j (+ j 1))
  (fset (fref at j) (+ (fref a k1) (- (fref a k2))))
  (fset (fref bt j) (+ (fref b k1) (- (fref b k2)))) (setf k1 (+ k1 kspan))
  (if (< k1 k2) (go label650)) (fset (fref a kk) ak) (fset (fref b kk) bk)
  (setf k1 kk) (setf k2 (+ kk kspnn)) (setf j 1) label660
  (setf k1 (+ k1 kspan)) (setf k2 (+ k2 (- kspan))) (setf jj j) (setf ak aa)
  (setf bk bb) (setf aj 0.0) (setf bj 0.0) (setf k 1) label670 (setf k (+ k 1))
  (setf ak (+ (* (fref at k) (fref ck jj)) ak))
  (setf bk (+ (* (fref bt k) (fref ck jj)) bk)) (setf k (+ k 1))
  (setf aj (+ (* (fref at k) (fref sk jj)) aj))
  (setf bj (+ (* (fref bt k) (fref sk jj)) bj)) (setf jj (+ jj j))
  (if (> jj jf) (setf jj (+ jj (- jf)))) (if (< k jf) (go label670))
  (setf k (+ jf (- j))) (fset (fref a k1) (+ ak (- bj)))
  (fset (fref b k1) (+ bk aj)) (fset (fref a k2) (+ ak bj))
  (fset (fref b k2) (+ bk (- aj))) (setf j (+ j 1)) (if (< j k) (go label660))
  (setf kk (+ kk kspnn)) (if (<= kk nn) (go label640)) (setf kk (+ kk (- nn)))
  (if (<= kk kspan) (go label640)) label700 (if (= i m) (go label800))
  (setf kk (+ jc 1)) label710 (setf c2 (+ 1.0 (- cd))) (setf s1 sd) label720
  (setf c1 c2) (setf s2 s1) (setf kk (+ kk kspan)) label730
  (setf ak (fref a kk))
  (fset (fref a kk) (+ (* c2 ak) (* (* -1 s2) (fref b kk))))
  (fset (fref b kk) (+ (* s2 ak) (* c2 (fref b kk)))) (setf kk (+ kk kspnn))
  (if (<= kk nt) (go label730)) (setf ak (* s1 s2))
  (setf s2 (+ (* s1 c2) (* c1 s2))) (setf c2 (+ (* c1 c2) (- ak)))
  (setf kk (+ (+ kk (- nt)) kspan)) (if (<= kk kspnn) (go label730))
  (setf u (+ (* sd s1) (* cd c1))) (setf v (+ (* sd c1) (* (* -1 cd) s1)))
  (setf c2 (+ c1 (- u))) (setf s1 (+ s1 v))
  (setf c1 (+ 1.5 (* (* -1 0.5) (+ (* c2 c2) (* s1 s1))))) (setf s1 (* c1 s1))
  (setf c2 (* c1 c2)) (setf kk (+ (+ kk (- kspnn)) jc))
  (if (<= kk kspan) (go label720)) (setf kk (+ (+ (+ kk (- kspan)) jc) inc))
  (if (<= kk (+ jc jc)) (go label710)) (go label100) label800
  (fset (fref np 1) ks) (if (= kt 0) (go label890)) (setf k (+ (+ kt kt) 1))
  (if (< m k) (setf k (+ k (- 1)))) (setf j 1) (fset (fref np (+ k 1)) jc)
  label810 (fset (fref np (+ j 1)) (/ (fref np j) (fref nfac j)))
  (fset (fref np k) (* (fref np (+ k 1)) (fref nfac j))) (setf j (+ j 1))
  (setf k (+ k (- 1))) (if (< j k) (go label810)) (setf k3 (fref np (+ k 1)))
  (setf kspan (fref np 2)) (setf kk (+ jc 1)) (setf k2 (+ kspan 1)) (setf j 1)
  (if (/= n ntot) (go label850)) label820 (setf ak (fref a kk))
  (fset (fref a kk) (fref a k2)) (fset (fref a k2) ak) (setf bk (fref b kk))
  (fset (fref b kk) (fref b k2)) (fset (fref b k2) bk) (setf kk (+ kk inc))
  (setf k2 (+ kspan k2)) (if (< k2 ks) (go label820)) label830
  (setf k2 (+ k2 (- (fref np j)))) (setf j (+ j 1))
  (setf k2 (+ (fref np (+ j 1)) k2)) (if (> k2 (fref np j)) (go label830))
  (setf j 1) label840 (if (< kk k2) (go label820)) (setf kk (+ kk inc))
  (setf k2 (+ kspan k2)) (if (< k2 ks) (go label840))
  (if (< kk ks) (go label830)) (setf jc k3) (go label890) label850
  (setf k (+ kk jc)) label860 (setf ak (fref a kk))
  (fset (fref a kk) (fref a k2)) (fset (fref a k2) ak) (setf bk (fref b kk))
  (fset (fref b kk) (fref b k2)) (fset (fref b k2) bk) (setf kk (+ kk inc))
  (setf k2 (+ k2 inc)) (if (< kk k) (go label860))
  (setf kk (+ (+ kk ks) (- jc))) (setf k2 (+ (+ k2 ks) (- jc)))
  (if (< kk nt) (go label850)) (setf k2 (+ (+ k2 (- nt)) kspan))
  (setf kk (+ (+ kk (- nt)) jc)) (if (< k2 ks) (go label850)) label870
  (setf k2 (+ k2 (- (fref np j)))) (setf j (+ j 1))
  (setf k2 (+ (fref np (+ j 1)) k2)) (if (> k2 (fref np j)) (go label870))
  (setf j 1) label880 (if (< kk k2) (go label850)) (setf kk (+ kk jc))
  (setf k2 (+ kspan k2)) (if (< k2 ks) (go label880))
  (if (< kk ks) (go label870)) (setf jc k3) label890
  (if (>= (+ (* 2 kt) 1) m) (go end_label)) (setf kspnn (fref np (+ kt 1)))
  (setf j (+ m (- kt))) (fset (fref nfac (+ j 1)) 1) label900
  (fset (fref nfac j) (* (fref nfac j) (fref nfac (+ j 1))))
  (setf j (+ j (- 1))) (if (/= j kt) (go label900)) (setf kt (+ kt 1))
  (setf nn (+ (fref nfac kt) (- 1))) (setf jj 0) (setf j 0) (go label906)
  label902 (setf jj (+ jj (- k2))) (setf k2 kk) (setf k (+ k 1))
  (setf kk (fref nfac k)) label904 (setf jj (+ kk jj))
  (if (>= jj k2) (go label902)) (fset (fref np j) jj) label906
  (setf k2 (fref nfac kt)) (setf k (+ kt 1)) (setf kk (fref nfac k))
  (setf j (+ j 1)) (if (<= j nn) (go label904)) (setf j 0) (go label914)
  label910 (setf k kk) (setf kk (fref np k)) (fset (fref np k) (- kk))
  (if (/= kk j) (go label910)) (setf k3 kk) label914 (setf j (+ j 1))
  (setf kk (fref np j)) (if (< kk 0) (go label914))
  (if (/= kk j) (go label910)) (fset (fref np j) (- j))
  (if (/= j nn) (go label914)) (setf maxf (* inc maxf)) (go label950) label924
  (setf j (+ j (- 1))) (if (< (fref np j) 0) (go label924)) (setf jj jc)
  label926 (setf kspan jj) (if (> jj maxf) (setf kspan maxf))
  (setf jj (+ jj (- kspan))) (setf k (fref np j))
  (setf kk (+ (+ (* jc k) ii) jj)) (setf k1 (+ kk kspan)) (setf k2 0) label928
  (setf k2 (+ k2 1)) (fset (fref at k2) (fref a k1))
  (fset (fref bt k2) (fref b k1)) (setf k1 (+ k1 (- inc)))
  (if (/= k1 kk) (go label928)) label932 (setf k1 (+ kk kspan))
  (setf k2 (+ k1 (* (* -1 jc) (+ k (fref np k))))) (setf k (- (fref np k)))
  label936 (fset (fref a k1) (fref a k2)) (fset (fref b k1) (fref b k2))
  (setf k1 (+ k1 (- inc))) (setf k2 (+ k2 (- inc)))
  (if (/= k1 kk) (go label936)) (setf kk k2) (if (/= k j) (go label932))
  (setf k1 (+ kk kspan)) (setf k2 0) label940 (setf k2 (+ k2 1))
  (fset (fref a k1) (fref at k2)) (fset (fref b k1) (fref bt k2))
  (setf k1 (+ k1 (- inc))) (if (/= k1 kk) (go label940))
  (if (/= jj 0) (go label926)) (if (/= j 1) (go label924)) label950
  (setf j (+ k3 1)) (setf nt (+ nt (- kspnn))) (setf ii (+ (+ nt (- inc)) 1))
  (if (>= nt 0) (go label924)) label960 (go end_label) label1000 (setf ierr 1)
  (go end_label) label1001 (setf ierr 2) (go end_label) label1002 (setf ierr 3)
  (go end_label) end_label (return (values a b ntot n nspan isn ierr))
))

