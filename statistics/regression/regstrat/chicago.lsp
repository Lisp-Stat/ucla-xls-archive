;; Data from the chicago insurance dataset from "Data : a collection 
;; of problems from many fields for the student and research worker"
;; by Andrews D. &  Herzberg A (1985), New York, Springer-Verlag.

(def zip (list 60626 60640 60613 60657 60614 60610 60611 60625 60618 60647 60622 60631 60646 60656 60630 60634 60641 60635 60639 60651 60644 60624 60612 60607 60623 60608 60616 60632 60609 60653 60615 60638 60629 60636 60621 60637 60652 60620 60619 60649 60617 60655 60643 60628 60627 60633 60645))
(def minority (list 10 22.2 19.6 17.3 24.5 54 4.9 7.1 5.3 21.5 43.1 1.1 1 1.7 1.6 1.5 1.8 1 2.5 13.4 59.8 94.4 86.2 50.2 74.2 55.5 62.3 4.4 46.2 99.7 73.5 10.7 1.5 48.8 98.9 90.6 1.4 71.2 94.1 66.1 36.4 1 42.5 35.1 47.4 34 3.1))
(def fire (list 6.2 9.5 10.5 7.7 8.6 34.1 11 6.9 7.3 15.1 29.1 2.2 5.7 2 2.5 3 5.4 2.2 7.2 15.1 16.5 18.4 36.2 39.7 18.5 23.3 12.2 5.6 21.8 21.6 9 3.6 5 28.6 17.4 11.3 3.4 11.9 10.5 10.7 10.8 4.8 10.4 15.6 7 7.1 4.9))
(def theft (list 29 44 36 37 53 68 75 18 31 25 34 14 11 11 22 17 27 9 29 30 40 32 41 147 22 29 46 23 4 31 39 15 32 27 32 34 17 46 42 43 34 19 25 28 3 23 27))
(def age (list 60.4 76.5 73.5 66.9 81.4 52.6 42.6 78.5 90.1 89.8 82.7 40.2 27.9 7.7 63.8 51.2 85.1 44.4 84.2 89.8 72.7 72.9 63.1 83 78.3 79 48 71.5 73.1 65 75.4 20.8 61.8 78.1 68.6 73.4 2 57 55.9 67.5 58 15.2 40.8 57.8 11.4 49.2 46.6))
(def volact (list 5.3 3.1 4.8 5.7 5.9 4 7.9 6.9 7.6 3.1 1.3 14.3 12.1 10.9 10.7 13.8 8.9 11.5 8.5 5.2 2.7 1.2 0.8 5.2 1.8 2.1 3.4 8 2.6 0.5 2.7 9.1 11.6 4 1.7 1.9 12.9 4.8 6.6 3.1 7.8 13 10.2 7.5 7.7 11.6 10.9))
(def involact (list 0 0.1 1.2 0.5 0.7 0.3 0 0 0.4 1.1 1.9 0 0 0 0 0 0 0 0.2 0.8 0.8 1.8 1.8 0.9 1.9 1.5 0.6 0.3 1.3 0.9 0.4 0 0 1.4 2.2 0.8 0 0.9 0.9 0.4 0.9 0 0.5 1 0.2 0.3 0))
(def income (list 11744 9323 9948 10656 9730 8231 21480 11104 10694 9631 7995 13722 16250 13686 12405 12198 11600 12765 11084 10510 9784 7342 6565 7459 8014 8177 8212 11230 8330 5583 8564 12102 11876 9742 7520 7388 13842 11040 10332 10908 11156 13323 12960 11260 10080 11428 13731))
(setf x (list minority fire theft age (/ income 10000)))
(setf y volact)
(def varnames '("minority" "fire" "theft" "age" "income"))
(def respname "volact")




