(def city-state
     '("Abilene,TX" "Akron,OH" "Albany,GA" "Albany,NY" "Albuquerque,NM" 
       "Alexandria,LA" "Allentown,PA" "Alton,IL" "Altoona,PA" 
       "Amarillo,TX" "Anaheim,CA" "Anchorage,AK" "Anderson,IN" 
       "Anderson,SC" "Ann Arbor,MI" "Anniston,AL" "Appleton,WI" 
       "Asheville,NC" "Athens,GA" "Atlanta,GA" "Atlantic City,NJ" 
       "Augusta,GA" "Aurora,IL" "Austin,TX" "Bakersfield,CA" 
       "Baltimore,MD" "Bangor,ME" "Baton Rouge,LA" "Battle Creek,MI" 
       "Beaumont,TX" "Beaver,PA" "Bellingham,WA" "Benton Harbor,MI" 
       "Passaic,NJ" "Billings,MT" "Biloxi,MS" "Binghamton,NY" 
       "Birmingham,AL" "Bismarck,ND" "Bloomington,IN" "Bloomington,IL"
       "Boise City,ID" "Boston,MA" "Boulder,CO" "Bradenton,FL" 
       "Brazoria,TX" "Bremerton,WA" "Bridgeport,CT" "Bristol,CT" 
       "Brockton,MA" "Brownsville,TX" "Bryan,TX" "Buffalo,NY" 
       "Burlington,NC" "Burlington,VT" "Canton,OH" "Casper,WY" 
       "Cedar Rapids,IA" "Champaign,IL" "Charleston,SC" "Charleston,WV"
       "Charlotte,NC" "Charlottesville,VA" "Chattanooga,TN" "Chicago,IL"
       "Chico,CA" "Cincinnati,OH" "Clarksville,TN" "Cleveland,OH" 
       "Colorado Springs,CO" "Columbia,MO" "Columbia,SC" "Columbus,GA"
       "Columbus,OH" "Corpus Christi,TX" "Cumberland,MD" "Dallas,TX" 
       "Danbury,CT" "Danville,VA" "Moline,IL" "Dayton,OH" 
       "Daytona Beach,FL" "Decatur,IL" "Denver,CO" "Des Moines,IA" 
       "Detroit,MI" "Dothan,AL" "Dubuque,IA" "Duluth,MN" "Belleville,IL"
       "Eau Claire,WI" "El Paso,TX" "Elkhart,IN" "Elmira,NY" "Enid,OK"
       "Erie,PA" "Eugene,OR" "Evansville,IN" "Fall River,MA" "Fargo,ND"
       "Fayetteville,NC" "Fayetteville,AR" "Fitchburg,MA" "Flint,MI" 
       "Florence,AL" "Florence,SC" "Fort Collins,CO" "Fort Lauderdale,FL"
       "Fort Myers,FL" "Fort Pierce,FL" "Fort Smith,AR" 
       "Fort Walton Beach,FL" "Fort Wayne,IN" "Arlington,TX" "Fresno,CA"
       "Gadsden,AL" "Gainesville,FL" "Galveston,TX" "Gary,IN" 
       "Glens Falls,NY" "Grand Forks,ND" "Grand Rapids,MI" "Great Falls,MT"
       "Greeley,CO" "Green Bay,WI" "Greensboro,NC" "Greenville,SC" 
       "Hagerstown,MD" "Hamilton,OH" "Harrisburg,PA" "Hartford,CT" 
       "Hickory,NC" "Honolulu,HI" "Houma,LA" "Houston,TX" "Huntington,WV"
       "Huntsville,AL" "Indianapolis,IN" "Iowa City,IA" "Jackson,MI" 
       "Jackson,MS" "Jacksonville,FL" "Jacksonville,NC" "Janesville,WI"
       "Jersey City,NJ" "Johnson City,TN" "Johnstown,PA" "Joliet,IL" 
       "Joplin,MO" "Kalamazoo,MI" "Kankakee,IL" "Kansas City,KS" 
       "Kansas City,MO" "Kenosha,WI" "Killeen,TX" "Knoxville,TN" 
       "Kokomo,IN" "La Crosse,WI" "Lafayette,IN" "Lafayette,LA" 
       "Lake Charles,LA" "Lake City,IL" "Lakeland,FL" "Lancaster,PA" 
       "Lansing,MI" "Laredo,TX" "Las Cruces,NM" "Las Vegas,NV" 
       "Lawrence,KS" "Lawrence,MA" "Lawton,OK" "Lewiston,ME" 
       "Lexington,KY" "Lima,OH" "Lincoln,NE" "Little Rock,AR" 
       "Longview,TX" "Lorain,OH" "Los Angeles,CA" "Louisville,KY" 
       "Lowell,MA" "Lubbock,TX" "Lynchburg,VA" "Macon,GA" "Madison,WI"
       "Manchester,NH" "Mansfield,OH" "Edinburg,TX" "Medford,OR" 
       "Melbourne,FL" "Memphis,TN" "Miami,FL" "Middlesex,NJ" 
       "Middletown,CT" "Midland,TX" "Milwaukee,WI" "Minneapolis,MN" 
       "Mobile,AL" "Modesto,CA" "Red Bank,NJ" "Monroe,LA" "Montgomery,AL"
       "Muncie,IN" "Muskegon,MI" "Nashua,NH" "Nashville,TN" 
       "Lindenhurst,NY" "New Bedford,MA" "New Britain,CT" "New Haven,CT"
       "New London,CT" "New Orleans,LA" "New York,NY" "Newark,NJ" 
       "Niagara Falls,NY" "Norfolk,VA" "Norwalk,CT" "Oakland,CA" 
       "Ocala,FL" "Odessa,TX" "Oklahoma City,OK" "Olympia,WA" "Omaha,NE"
       "Middletown,NY" "Orlando,FL" "Owensboro,KY" "Oxnard,CA" 
       "Panama City,FL" "Marietta,OH" "Pascagoula,MS" "Pawtucket,RI" 
       "Pensacola,FL" "Peoria,IL" "Philadelphia,PA" "Phoenix,AZ" 
       "Pine Bluff,AR" "Pittsburgh,PA" "Pittsfield,MA" "Portland,ME" 
       "Portland,OR" "Portsmouth,NH" "Poughkeepsie,NY" "Providence,RI"
       "Provo,UT" "Pueblo,CO" "Racine,WI" "Raleigh,NC" "Reading,PA" 
       "Redding,CA" "Reno,NV" "Richland,WA" "Richmond,VA" "Riverside,CA"
       "Roanoke,VA" "Rochester,MN" "Rochester,NY" "Rockford,IL" 
       "Sacramento,CA" "Saginaw,MI" "St Cloud,MN" "St Joseph,MO" 
       "St Louis,MO" "Salem,OR" "Gloucester,MA" "Salinas,CA" 
       "Salt Lake City,UT" "San Angelo,TX" "San Antonio,TX" "San Diego,CA"
       "San Francisco,CA" "San Jose,CA" "Santa Barbara,CA" "Santa Cruz,CA"
       "Santa Rosa,CA" "Sarasota,FL" "Savannah,GA" "Scranton,PA" 
       "Seattle,WA" "Sharon,PA" "Sheboygan,WI" "Sherman,TX" 
       "Shreveport,LA" "Sioux City,IA" "Sioux Falls,SD" "South Bend,IN"
       "Spokane,WA" "Springfield,IL" "Springfield,MA" "Springfield,MO"
       "Stamford,CT" "State College,PA" "Steubenville,OH" "Stockton,CA"
       "Syracuse,NY" "Tacoma,WA" "Tallahassee,FL" "Tampa,FL" 
       "Terre Haute,IN" "Texarkana,TX" "Toledo,OH" "Topeka,KS" 
       "Trenton,NJ" "Tucson,AZ" "Tulsa,OK" "Tuscaloosa,AL" "Tyler,TX"
       "Utica,NY" "Vallejo,CA" "Vancouver,WA" "Victoria,TX" "Vineland,NJ"
       "Visalia,CA" "Waco,TX" "Washington,DC" "Waterbury,CT" "Waterloo,IA"
       "Wausau,WI" "West Palm Beach,FL" "Wheeling,WV" "Wichita,KS" 
       "Wichita Falls,TX" "Williamsport,PA" "Wilmington,DE" "Wilmington,NC"
       "Worcester,MA" "Yakima,WA" "York,PA" "Youngstown,OH" "Yuba City,CA"
       ))
(def climate-terrain
     '(521 575 468 476 659 520 559 537 561 609 885 195 530 591 546
	   560 396 694 601 696 615 534 474 435 560 567 451 427 527
	   423 586 772 566 559 452 584 550 612 149 558 487 592 623
	   459 440 423 808 648 516 575 440 383 571 637 383 575 401
	   434 525 569 627 644 618 576 514 603 584 544 579 526 541
	   526 517 558 362 591 544 569 545 440 544 561 480 521 444
	   536 336 419 193 537 257 592 521 467 461 605 741 550 643
	   148 561 549 507 540 546 552 490 572 342 602 482 536 509
	   528 559 526 402 727 483 476 105 513 410 490 367 626 655
	   568 542 556 516 623 717 427 424 636 600 557 434 518 412
	   457 564 466 601 663 547 479 580 527 483 549 549 496 365
	   670 512 352 494 429 469 514 307 559 480 424 552 556 513
	   548 479 490 635 522 398 497 500 579 885 616 526 604 642
	   447 378 404 558 238 611 582 514 634 559 593 603 460 293
	   442 639 615 455 483 530 580 538 600 656 643 516 583 583
	   498 638 601 554 632 648 910 333 603 554 726 440 509 457
	   524 890 536 617 584 586 536 491 630 536 463 586 482 483
	   768 469 488 586 500 497 496 647 614 664 535 664 585 615
	   652 308 536 466 576 515 195 475 537 716 644 843 541 488
	   398 903 910 850 855 843 732 391 542 575 808 570 442 524
	   508 385 276 545 574 524 453 544 648 575 542 625 548 808
	   404 440 557 467 518 501 636 589 530 470 500 548 821 768
	   336 615 543 412 631 569 347 308 509 542 494 456 558 597
	   564 562 535 540 570 608))
(def housing
     '(6200 8138 7339 7908 8393 5819 8288 6487 6191 6546 16047 12175
	    5704 5725 11014 5530 7877 6722 6691 8316 11074 6292 10384
	    8831 8068 9148 7277 8083 6342 6288 7866 8329 6761 14607
	    8315 6458 8257 6811 8365 7056 8654 8221 11609 11914 8242
	    8394 9060 13429 10041 8263 5376 8228 8064 6179 9673 7332
	    9839 7774 8627 7402 7789 7169 9531 6189 10913 8587 8143
	    6007 9168 8509 7702 7519 5817 8093 6929 6054 9318 14420
	    5709 8083 7635 7203 7395 10789 8028 8525 5708 7993 6040
	    6501 7078 7343 6573 7078 6829 7715 9370 6743 9017 8168 6274
	    6686 8252 7204 5962 6508 9951 10810 9298 8842 5784 7554
	    6733 7956 9291 5382 7388 7767 7641 7120 7898 7780 7143 8218
	    8401 7064 6336 7763 8227 7891 11652 6760 17021 7094 9760
	    6632 6283 7012 9429 6794 7245 6626 6111 7447 8810 6119 6524
	    9327 5159 7919 7230 8126 7076 8516 6463 6692 6616 8310 7778
	    8572 6921 13282 6680 8631 7907 6152 6962 9906 7497 10414
	    5850 6876 8340 6986 8256 7270 6608 8309 13868 6812 9640
	    6990 6934 6235 9897 9860 6881 5345 9008 8721 7015 10267
	    12135 11652 8672 10176 9559 6704 8630 11660 6190 6754 5800
	    6391 10757 7800 11138 8087 10509 11460 10218 8515 13358 14220
	    7686 8568 20151 13135 6750 6689 7186 8263 7128 10173 8196
	    6760 14000 6373 6657 6248 9462 6479 8388 8310 8921 5674
	    8099 7807 8100 9912 9966 9981 9274 9321 6637 8943 8230 7614
	    8584 12449 8461 8343 9754 7476 9193 8609 7584 9855 7368
	    7235 5589 7605 8378 11622 13838 9466 6321 6898 14465 17158
	    16048 15547 14303 12931 9560 6896 6697 10183 6697 8121 5722
	    6534 6528 7983 5938 6927 7882 8039 6343 23640 8405 6578
	    8474 7670 7770 8029 7442 5527 5717 7767 7110 10616 8548
	    7498 6464 7298 6744 10503 9015 7143 7295 7778 6106 13724
	    10024 7881 7642 10512 6576 7061 6404 7284 7927 6858 8715
	    6440 8371 7021 7875))
(def latitude
     '(32.559 41.085 31.575 42.7327 35.083 31.302 40.6155 38.794 40.515
	 35.383 33.799 61.218 40.167 34.51 42.283 33.655 44.158 35.593
	 33.957 33.763 39.367 33.47 41.8935 30.282 35.375 39.288 44.802
	 30.45 42.322 29.991 40.693 48.763 42.105 40.891 45.78 30.3975
	 42.098 33.512 46.807 39.165 40.495 43.613 42.362 40.0915 27.495
	 29.043 47.567 41.2075 41.673 42.085 25.919 30.644 42.887 36.097
	 44.475 40.798 42.847 41.975 40.1817 32.763 38.368 35.137 38.038
	 35.043 41.883 39.732 39.1 36.6945 41.497 38.833 38.957 33.993
	 32.462 39.962 27.776 39.65 32.777 41.393 36.592 41.5057 39.8385
	 29.215 39.843 39.74 41.587 42.442 31.223 42.503 46.783 38.512
	 44.866 31.755 41.6385 42.093 36.395 42.113 43.952 37.97 41.794
	 46.8765 35.055 36.146 42.555 43.022 34.8 34.197 40.49 26.121
	 26.642 27.447 35.385 30.762 41.072 32.737 36.732 34.018 29.66
	 29.3475 41.615 43.31 47.92 42.963 47.502 40.418 44.513 36.0417
	 34.895 39.645 39.4565 40.2683 41.767 35.737 21.313 29.696 
	 29.834 38.435 34.732 39.77 41.662 42.247 32.332 30.33 34.748
	 42.595 40.728 36.5155 40.325 41.527 37.083 42.29 41.117 39.117
	 39.043 42.585 31.11 35.968 40.487 43.819 40.42 30.225 30.228
	 39.636 28.0325 40.037 42.67 27.507 32.312 36.172 38.963 43.1757
	 34.612 44.097 38.048 40.735 40.823 34.751 32.521 41.415 33.9165
	 38.247 42.637 33.583 37.415 32.842 43.07 42.995 40.758 26.2585
	 42.323 28.2447 35.125 25.6465 40.58 41.562 31.995 43.033 44.965
	 30.688 37.643 40.352 32.5 32.382 40.192 43.228 42.757 36.161
	 40.678 41.637 41.668 41.4185 41.443 29.963 40.849 40.737 43.097
	 36.8897 41.123 37.808 29.185 31.858 35.296 47.045 41.283 41.453
	 28.553 37.768 34.2375 30.269 39.413 30.368 41.9433 30.661 
	 40.693 39.95 33.455 34.223 40.437 42.447 43.678 45.547 43.19
	 41.702 41.817 40.2725 38.24 42.727 35.8845 40.328 40.582 39.523
	 46.259 37.385 34.044 37.273 44.023 43.158 42.268 38.585 43.5513
	 45.566 39.767 38.617 44.917 42.5755 36.6343 40.8825 31.463
	 29.423 32.713 37.775 37.335 34.6707 36.972 38.3375 27.337 
	 32.077 41.3275 47.597 41.233 43.76 33.695 32.49 42.492 43.495
	 41.669 47.672 39.8 42.1 37.22 41.053 40.792 40.376 37.958
	 43.052 47.237 30.445 27.955 39.467 33.4325 41.591 39.052 40.225
	 32.217 36.16 33.205 32.345 43.1585 38.22 45.625 28.805 39.4377
	 36.2043 31.547 38.892 41.41 42.51 44.96 26.6553 40.07 37.692
	 33.91 41.245 39.747 34.237 42.272 46.595 39.96 41.17 39.128))
(def longitude
     '(-99.68899999999999 -81.518 -84.158 -73.7983 -106.65 -92.453 -75.4405
	  -90.1615 -78.395 -101.849 -117.889 -149.892 -85.685 -82.655
	  -83.75 -85.827 -88.46729999999999 -82.557 -83.383 -84.319 -74.438
	  -81.967 -88.2805 -97.742 -119.022 -76.617 -68.77200000000001
	  -91.185 -85.182 -94.0125 -80.315 -122.483 -86.447 -74.059 
	  -108.505
	  -88.9695 -75.913 -86.807 -100.778 -86.52800000000001 
	  -88.98999999999999 -116.218 -71.05800000000001 -105.193 -82.572
	  -95.56999999999999 -122.63 -73.12649999999999 -72.95 -71.017 
	  -97.482
	  -96.3575 -78.875 -79.43300000000001 -73.20699999999999 -81.378
	  -106.313 -91.673 -88.1983 -79.93000000000001 -81.645 
	  -81.01730000000001 -78.50700000000001 -85.31 -87.625 -121.838
	  -84.51300000000001 -87.41800000000001 -81.7 -104.82 -92.33 -81.045
	  -84.982 -83.002 -97.621 -78.76300000000001 -96.812 
	  -73.45999999999999 -79.38800000000001 -90.5493 -84.0025 -81.023
	  -88.953 -104.988 -93.618 -83.128 -85.393 -90.675 -92.113 -89.983
	  -91.471 -106.48 -85.9015 -76.807 -97.875 -80.07299999999999 
	  -122.981
	  -87.575 -71.101 -96.777 -78.877 -94.15049999999999 -71.7775
	  -83.68300000000001 -87.675 -79.768 -105.08 -80.1373 -81.873 
	  -80.327
	  -94.41800000000001 -86.651 -85.142 -97.113 -119.783 -86.018
	  -82.33 -94.84399999999999 -87.419 -73.645 -97.03700000000001 
	  -85.67
	  -111.285 -104.693 -88.00700000000001 -80.0127 -82.1725 -77.72
	  -84.48099999999999 -76.8343 -72.675 -81.337 -157.863 -90.77 
	  -95.003
	  -82.524 -86.587 -86.155 -91.535 -84.40000000000001 
	  -90.19499999999999 -81.657 -77.43000000000001 -89.026 
	  -74.06699999999999 -82.3335 -78.92 -88.08 -94.467 -85.583 -87.867
	  -94.625 -94.54300000000001 -87.82299999999999 -97.53400000000001
	  -83.91800000000001 -86.133 -91.23699999999999 -86.893 -92.02 
	  -93.217
	  -88.618 -81.8425 -76.30800000000001 -84.4295 -99.503 -106.778
	  -115.147 -95.238 -71.43899999999999 -98.41200000000001 -70.223
	  -84.497 -84.105 -96.685 -92.27249999999999 -94.55800000000001
	  -82.14400000000001 -118.217 -85.762 -71.313 -101.843 -79.143
	  -83.63500000000001 -89.393 -71.462 -82.517 -98.2435 -122.867
	  -80.6687 -90.057 -80.21850000000001 -74.503 -72.655 -102.078
	  -87.982 -93.179 -88.04300000000001 -121.002 -74.075 -92.117 
	  -86.30800000000001
	  -85.387 -86.26000000000001 -71.462 -86.764 -73.375 
	  -70.93000000000001 -72.783 -72.851 -72.095 -90.063 -73.88 -74.172
	  -79.057 -76.22669999999999 -73.36499999999999 -122.268 
	  -82.13500000000001 -102.375 -97.304 -122.89 -96.008 -74.413 
	  -81.377
	  -87.113 -119.203 -85.697 -81.45 -88.54900000000001 
	  -71.39530000000001 -87.40600000000001 -89.592 -75.163 -112.073
	  -92.017 -80.008 -73.253 -70.23 -122.365 -70.8707 
	  -73.93000000000001 -71.407 -111.678 -104.605 -87.8 -78.765 
	  -75.928
	  -122.4 -119.807 -119.195 -77.4255 -117.338 -79.937 
	  -92.46299999999999 -77.608 -89.098 -121.49 -84.018 
	  -94.16200000000001 -94.83799999999999 -90.193 -123.028 
	  -70.78149999999999 -121.801 -111.935 -100.437 -98.495 -117.153
	  -122.417 -121.883 -120.196 -122.022 -122.679 -82.532 -81.093
	  -75.77549999999999 -122.33 -80.517 -87.748 -96.57599999999999
	  -93.758 -96.392 -96.702 -86.215 -117.405 -89.648 
	  -72.58799999999999 -93.29000000000001 -73.54000000000001 -77.867
	  -80.59699999999999 -121.285 -76.15000000000001 -122.433 -84.282
	  -82.664 -87.408 -94.05249999999999 -83.52800000000001 -95.67 
	  -74.767
	  -110.968 -95.902 -87.56699999999999 -95.30200000000001 
	  -75.34099999999999 -122.194 -122.67 -97.005 -75.0993 -119.219
	  -97.142 -77.033 -73.048 -92.39700000000001 -89.64 
	  -80.21769999999999 -80.723 -97.337 -98.51300000000001 -77.003
	  -75.55 -77.923 -71.795 -120.513 -76.72799999999999 -80.729 
	  -121.622
	  ))
