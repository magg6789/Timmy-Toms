* This program is called Subs2_5645.SAS. ;

* The next block of code cleans the windows each time you run this program. ;
ODS HTML CLOSE ;
ODS HTML ;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;' ;

* The next block of code reads the data file from the D drive. ;
PROC IMPORT DATAFILE = ' E:Subs2_5645.CSV ' 
   OUT = SUBS1
   DBMS = CSV
   REPLACE ;
   GETNAMES = YES ;
   RUN ;
* The next block of code deletes sales values in excess of 1,939,159 our high outlier and with sales equal to zero ;
DATA SUBS2;
   SET SUBS1;
   IF SALES = 0 or SALES > 1939159 THEN DELETE;
   RUN;

DATA SUBS3;
  SET SUBS2;
  high_visibility=0;
  IF HV=1 THEN high_visibility=1;
  high_density=0;
  IF HD=1 then high_density=1;
  RUN;
* The next block of code computes the 5 basic summary statistics for the new variables ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX;
   VAR high_visibility south central west high_density free_standing strip_mall
   Big_box_0_5R Sandwich_shop_8T All_malls_1R 
   Competitor_A_0_5R Competitor_A_1R Competitor_B_0_5R Competitor_B_1R  
   Competitor_C_0_5R Competitor_C_1R Competitor_D_0_5R Competitor_D_1R  
   Bakeries_0_5R Bakeries_1R Low_grocery_0_5R Low_grocery_1R 
   Mid_grocery_0_5R Mid_grocery_1R Malls_300K_0_5R Malls_300K_1R 
   Universities_0_5R Universities_1R Universities_3R Universities_5T Universities_8T  ;
   RUN;
* The next block of code computes the 5 basic summary statistics for the dummy and multi-trait dummy variables ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX;
   VAR HD HV south central west free_standing strip_mall;
   RUN;
   * The next block of code computes the 5 basic summary statistics for the dummy and multi-trait dummy variables ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX;
   VAR high_visibility south central west high_density free_standing strip_mall;
   RUN;
   * The next block of code computes the 5 basic summary statistics for the dummy and multi-trait 
   dummy variables minus high_visibility ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX;
   VAR high_density south central west free_standing strip_mall;
   RUN;
*Here we get our correlation coefficients with the appropriate/adjusted dummy variables;
   PROC CORR;
  VAR Sales high_density south central west free_standing strip_mall ;
  RUN; 

* The next block of code generates frequency tables for the potential LIV variables;
PROC FREQ;
  TABLES Big_box_0_5R Sandwich_shop_8T All_malls_1R Competitor_A_0_5R Competitor_A_1R
   Competitor_B_0_5R Competitor_B_1R Bakeries_0_5R Bakeries_1R Low_grocery_1R Mid_grocery_0_5R
   Mid_grocery_1R Malls_300K_0_5R Malls_300K_1R Universities_3R Universities_5T Universities_8T;
   RUN;

* The following block of code converts improper LIV variables into 0/1 dummy variables;
DATA SUBS4;
   SET SUBS3;
   Competitor_A_0_5R_dum = 0;
   IF Competitor_A_0_5R > 0 THEN Competitor_A_0_5R_dum = 1;
   Competitor_A_1R_dum = 0;
   IF Competitor_A_1R > 0 THEN Competitor_A_1R_dum = 1;
   Bakeries_0_5R_dum = 0;
   IF Bakeries_0_5R > 0 THEN Bakeries_0_5R_dum = 1;
   Bakeries_1R_dum = 0;
   IF Bakeries_1R > 0 THEN Bakeries_1R_dum = 1;
   Low_grocery_1R_dum = 0;
   IF Low_grocery_1R > 0 THEN Low_grocery_1R_dum = 1;
   Mid_grocery_0_5R_dum = 0;
   IF Mid_grocery_0_5R > 0 THEN Mid_grocery_0_5R_dum = 1;
   Mid_grocery_1R_dum = 0;
   IF Mid_grocery_1R > 0 THEN Mid_grocery_1R_dum = 1;
   Malls_300K_0_5R_dum = 0;
   IF Malls_300K_0_5R > 0 THEN Malls_300K_0_5R_dum = 1;
   Malls_300K_1R_dum = 0;
   IF Malls_300K_1R > 0 THEN Malls_300K_1R_dum = 1;
   Universities_3R_dum = 0;
   IF Universities_3R > 0 THEN Universities_3R_dum = 1;
   Universities_8T_dum = 0;
   IF Universities_8T > 0 THEN Universities_8T_dum = 1;
   RUN;

* The next block of code generates summary statistics for the newly created dummy variables;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX;
   VAR Competitor_A_0_5R_dum Competitor_A_1R_dum Bakeries_0_5R_dum Bakeries_1R_dum Low_grocery_1R_dum 
   Mid_grocery_0_5R_dum Malls_300K_0_5R_dum Malls_300K_1R_dum Universities_3R_dum Universities_8T_dum;
   RUN;

* The next blocks of code generate correlation coefficients between sales and all proper variables;
PROC CORR;
  VAR Sales high_visibility south central west  ;
  RUN;

PROC CORR;
  VAR Sales high_density free_standing strip_mall ;
  RUN; 

PROC CORR;
  VAR Sales Big_box_0_5R Sandwich_shop_8T All_malls_1R  ;
  RUN;

PROC CORR;
  VAR Sales Competitor_C_1R Competitor_D_1R ;
  RUN;

PROC CORR;
  VAR Sales Competitor_A_0_5R_dum Competitor_A_1R_dum ;
  RUN;

PROC CORR;
  VAR Sales Bakeries_0_5R_dum Bakeries_1R_dum ;
  RUN;

PROC CORR;
  VAR Sales Low_grocery_1R_dum Mid_grocery_0_5R_dum ;
  RUN; 

PROC CORR;
  VAR Sales Mid_grocery_1R_dum ;
  RUN;

PROC CORR;
  VAR Sales Malls_300K_0_5R_dum Malls_300K_1R_dum ;
  RUN; 

PROC CORR;
  VAR Sales Universities_3R_dum Universities_8T_dum ;
  RUN; 


* End with a QUIT statement, even though Jeff Banister says NEVER EVER QUIT! ;
QUIT;
