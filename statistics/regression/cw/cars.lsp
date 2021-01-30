(DEF CARS (QUOTE ((16.9 15.5 19.2 18.5 30 27.5 27.2 30.9 20.3 17 21.6 16.2 20.6
20.8 18.6 18.1 17 17.6 16.5 18.2 26.5 21.9 34.1 35.1 27.4 31.5 29.5 28.4 28.8
26.8 33.5 34.2 31.8 37.3 30.5 22 21.5 31.9) (4.36 4.054 3.605 3.94 2.155 2.56
2.3 2.23 2.83 3.14 2.795 3.41 3.38 3.07 3.62 3.41 3.84 3.725 3.955 3.83 2.585
2.91 1.975 1.915 2.67 1.99 2.135 2.67 2.595 2.7 2.556 2.2 2.02 2.13 2.19 2.815
2.6 1.925) (2.73 2.26 2.56 2.45 3.7 3.05 3.54 3.37 3.9 3.5 3.77 3.58 2.73 3.08
2.71 2.73 2.41 2.26 2.26 2.45 3.08 3.08 3.73 2.97 3.08 3.78 3.05 2.53 2.69 2.84
2.69 3.37 3.7 3.1 3.7 3.7 3.64 3.78) (155 142 125 150 68 95 97 75 103 125 115
133 105 85 110 120 130 129 138 135 88 109 65 80 80 71 68 90 115 115 90 70 65 69
78 97 110 71) (350 351 267 360 98 134 119 105 131 163 121 163 231 200 225 258
305 302 351 318 140 171 86 98 121 89 98 151 173 173 151 105 85 91 97 146 121
89))))
(def car-names '("Buick Wgn" "Ford Wgn" "Chev Wgn" "Chrys Wgn" "Chevette"
                        "Toy Cor" "Dat 510" "Dodge Omni" "Audi 5000"
                        "Volvo240" "Saab99" "Peugeot694" "Buick Cent"
                        "Merc Zephyr" "Dodge Aspen" "AMC Concord"
                        "Chev Caprice" "Ford LTD" "Merc" "Dodge" "Mustang"
                        "Ford Ghia" "Mazda GLC" "Dodge colt" "AMC Sprint"
                        "VW Scirocco" "Honda Accord" "Buick Skylark" 
                        "Chevy Citation"
                        "Olds Omega" "Pontiac Phx" "ply Horiz" "Dat 210"
                        "Fiat Strada" "VW Dasher" "Dat 810" "BMW320i"
                        "VW Rabbit"))

(def car-vars '("MPG" "Weight" "DRAT" "Horsepower" "Displacement"))
(def car-reg (regression-model (select cars '(1 3 4))
                               (/ (select cars 0))
                               :predictor-names (select car-vars '(1 3 4))
                               :response-name "Gal/Mile"
                               :case-labels car-names))
(send car-reg :graphics-menu "Car-data")

