* This program is called Subs3_5645.SAS. ;

* The next block of code cleans the windows each time you run this program. ;
ODS HTML CLOSE ;
ODS HTML ;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;' ;
TITLE ' Miriam Garcia ' ;
* The next block of code reads the data file from the D drive. ;
PROC IMPORT DATAFILE = ' E:Subs2_5645.CSV ' 
   OUT = SUBS1
   DBMS = CSV
   REPLACE ;
   GETNAMES = YES ;
   RUN ;
* The next block of code deletes sales values in excess of 1,939,159 (aka high outliers);
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

ODS GRAPHICS OFF;

PROC REG;
  A: MODEL Sales = HH_6person_3R Brady_Bunch_3R HH_5person_3R labor_blue_3R Black_HH_3R Black_pop_3R
Pop_50_69_3R HHinc_25_49K_3R Pop_70_85_3R HHinc_LT_25K_3R Pop_GE_18_3R Pop_some_college_3R Pop_married_3R
HH_3person_3R Pop_in_school_3R Pop_grades_9_12_3R Hispanic_pop_3R Black_pop_5T Brady_Bunch_5T Black_HH_5T
labor_farm_3R Pop_40_49_3R HHinc_50_74K_3R Hispanic_HH_3R HH_4person_3R HH_6person_5T Pop_21_39_3R
Tot_HH_Expend_3R Pop_Associates_3R Cust_value_per_cap_region Likely_customers_1R HH_2person_3R
HH_5person_5T HHinc_LT_25K_5T HH_1person_3R retail_3R labor_blue_5T restaurants_retail_3R Hispanic_pop_5T 
Food_away_3R HHinc_25_49K_5T Hispanic_HH_5T restaurants_3R Med_HHinc_3R Pop_grad_school_3R 
HHinc_75_99K_3R Big_box_index_1R Pop_50_69_5T labor_white_col_3R per_cap_inc_3R
labor_farm_5T Pop_GE_18_5T Pop_grades_9_12_5T Pop_40_49_5T HH_3person_5T HH_4person_5T Pop_some_college_5T
Pop_Doctorate_3R Pop_Bachelors_3R Pop_Masters_3R HH_1person_5T Pop_21_39_5T Pop_70_85_5T South Central West 
Free_standing Strip_mall Mid_grocery_1R Big_box_0_5R Malls_300K_0_5R_dum;  /* model with all variables*/
  B: MODEL Sales = restaurants_retail_3R Hispanic_pop_5T Food_away_3R HHinc_25_49K_5T Hispanic_HH_5T 
   restaurants_3R HHinc_75_99K_3R Big_box_index_1R;
  C: MODEL Sales = HH_3person_5T HH_4person_5T Pop_some_college_5T Pop_Doctorate_3R Pop_Bachelors_3R 
Pop_Masters_3R HH_1person_5T Pop_21_39_5T Pop_70_85_5T; 
  D: MODEL Sales = south central west free_standing strip_mall Mid_grocery_1R_dum Big_box_0_5R Malls_300K_0_5R_dum;
  E: MODEL Sales = Pop_21_39_5T per_cap_inc_3R Pop_grades_9_12_5T south central west Mid_grocery_1R Malls_300K_0_5R_dum;
  F: MODEL Sales = Food_away_3R Malls_300k_0_5R_dum per_cap_inc_3R HH_3person_5T HH_4person_5T south central west Mid_grocery_1R ;
  G: MODEL Sales = restaurants_retail_3R labor_white_col_3R restaurants_3R per_cap_inc_3R south central west Mid_grocery_1R ;
  H: MODEL Sales = HH_6person_3R Brady_Bunch_3R HH_5person_3R labor_blue_3R Black_HH_3R Black_pop_3R Pop_50_69_3R 
	HHinc_25_49K_3R Pop_70_85_3R HHinc_LT_25K_3R;
  I: MODEL Sales = HH_6person_3R Malls_300k_0_5R_dum Black_HH_3R Pop_70_85_3R Pop_GE_18_3R Pop_some_college_3R Pop_married_3R 
	Cust_value_per_cap_region ;
  J: MODEL Sales = HH_6person_3R Black_HH_3R Pop_70_85_3R Pop_GE_18_3R per_cap_inc_3R south central west Mid_grocery_1R ;
  K: MODEL Sales = HH_6person_3R restaurants_retail_3R HH_2person_3R Likely_customers_1R retail_3R 
		per_cap_inc_3R south  west Mid_grocery_1R ;
  L: MODEL Sales = Likely_customers_1R HHinc_LT_25K_5T HHinc_LT_25K_3R HHinc_25_49K_3R
		per_cap_inc_3R south  west Mid_grocery_1R_dum;
  M: MODEL Sales = Pop_some_college_3R HH_3person_3R Pop_in_school_3R Pop_grades_9_12_3R
Likely_customers_1R per_cap_inc_3R south central west Mid_grocery_1R_dum;
  N: MODEL Sales = retail_3R restaurants_retail_3R Pop_Doctorate_3R HHinc_25_49K_3R 
Pop_some_college_3R Likely_customers_1R per_cap_inc_3R south central west Mid_grocery_1R;
  O: MODEL Sales = Tot_HH_Expend_3R labor_blue_3R Pop_some_college_3R Pop_Doctorate_3R Pop_in_school_3R Pop_grades_9_12_3R
     per_cap_inc_3R south west Mid_grocery_1R_dum;

 P: MODEL Sales = Likely_customers_1R Pop_GE_18_3R Pop_Associates_3R Big_box_index_1R Malls_300k_0_5R_dum
 per_cap_inc_3R south  west Mid_grocery_1R_dum;
 Q: MODEL Sales = Likely_customers_1R Pop_GE_18_3R Pop_grades_9_12_3R restaurants_retail_3R Big_box_0_5R
    per_cap_inc_3R south  west Mid_grocery_1R_dum ;
 R: MODEL Sales = Likely_customers_1R Pop_GE_18_3R Pop_grades_9_12_3R  Malls_300K_0_5R_dum
    per_cap_inc_3R south  west Mid_grocery_1R_dum;
 S: MODEL Sales = Likely_customers_1R Pop_married_3R Pop_GE_18_3R Big_box_0_5R
restaurants_retail_3R  per_cap_inc_3R south  west Mid_grocery_1R_dum;
 T: MODEL Sales = Likely_customers_1R Pop_married_3R Pop_GE_18_3R restaurants_3R retail_3R 
 per_cap_inc_3R south west Mid_grocery_1R_dum;
RUN;

/*model P MC check*/
PROC CORR;   
VAR Likely_customers_1R Pop_GE_18_3R Pop_Associates_3R Big_box_index_1R Malls_300k_0_5R_dum
 per_cap_inc_3R south west Mid_grocery_1R_dum;
RUN;
/*model Q MC check*/
PROC CORR;   
VAR Likely_customers_1R Pop_GE_18_3R Pop_grades_9_12_3R restaurants_retail_3R Big_box_0_5R
    per_cap_inc_3R south west Mid_grocery_1R_dum ;
RUN;
/*model R MC check*/
PROC CORR;   
VAR Likely_customers_1R Pop_GE_18_3R Pop_grades_9_12_3R  Malls_300K_0_5R_dum Cust_value_per_cap_region
    per_cap_inc_3R south  west Mid_grocery_1R_dum;
RUN;
/*model S MC check*/
PROC CORR;   
VAR Likely_customers_1R pop_married_3R Pop_GE_18_3R Big_box_0_5R restaurants_retail_3R
   per_cap_inc_3R south west Mid_grocery_1R_dum;
RUN;
/*model T MC check*/
PROC CORR;   
VAR Likely_customers_1R pop_married_3R Pop_GE_18_3R restaurants_3R retail_3R 
Cust_value_per_cap_region per_cap_inc_3R south west Mid_grocery_1R_dum;
RUN;
*Final 5 Potential Models; 
PROC REG;
   P: MODEL Sales = Likely_customers_1R Pop_GE_18_3R Pop_Associates_3R Big_box_index_1R Malls_300k_0_5R_dum
 per_cap_inc_3R south  west Mid_grocery_1R_dum;
 Q: MODEL Sales = Likely_customers_1R Pop_GE_18_3R Pop_grades_9_12_3R restaurants_retail_3R Big_box_0_5R
    per_cap_inc_3R south  west Mid_grocery_1R_dum ;
 R: MODEL Sales = Likely_customers_1R Pop_GE_18_3R Pop_grades_9_12_3R  Malls_300K_0_5R_dum
    per_cap_inc_3R south  west Mid_grocery_1R_dum;
 S: MODEL Sales = Likely_customers_1R Pop_married_3R Pop_GE_18_3R Big_box_0_5R
restaurants_retail_3R  per_cap_inc_3R south  west Mid_grocery_1R_dum;
 T: MODEL Sales = Likely_customers_1R Pop_married_3R Pop_GE_18_3R restaurants_3R retail_3R 
 per_cap_inc_3R south west Mid_grocery_1R_dum;
RUN;
* Forward Selection;
PROC REG;
   Forward: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R
HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R
restaurants_3R restaurants_retail_3R retail_3R cust_value_per_cap_region  per_cap_inc_3R
Big_box_index_1R  Big_box_0_5R Malls_300K_0_5R_dum
 / SELECTION=FORWARD SLENTRY=0.20  ;
 RUN;
* Forward Selection with multi-trait dummies;
PROC REG;
 U: MODEL Sales = HHinc_25_49K_3R HHinc_50_74K_3R Pop_married_3R Cust_value_per_cap_region
per_cap_inc_3R Big_box_index_1R;
  V: MODEL Sales = HHinc_25_49K_3R HHinc_50_74K_3R Pop_married_3R Cust_value_per_cap_region
per_cap_inc_3R Big_box_index_1R south west;
 RUN;
* Stepwise selection method;
PROC REG;
   STEPWISE: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R
HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R
restaurants_3R restaurants_retail_3R retail_3R cust_value_per_cap_region  per_cap_inc_3R
Big_box_index_1R  Big_box_0_5R Malls_300K_0_5R_dum
/ SELECTION=STEPWISE SLENTRY=0.20 SLSTAY=0.20;
   RUN;
* Backward selection method;
PROC REG;
   Backward: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R
HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R
restaurants_3R restaurants_retail_3R retail_3R cust_value_per_cap_region  per_cap_inc_3R
Big_box_index_1R  Big_box_0_5R Malls_300K_0_5R_dum
/ SELECTION=BACKWARD SLSTAY=0.20 ;
   RUN;
* Maximum R-square improvement selection method;
PROC REG;
   Max_R_square: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R
HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R
restaurants_3R restaurants_retail_3R retail_3R cust_value_per_cap_region  per_cap_inc_3R
Big_box_index_1R  Big_box_0_5R Malls_300K_0_5R_dum
/ SELECTION=MAXR;
   RUN;
 *15-variable best model with Maximum R-square improvement selection method;
   PROC REG;
  Z: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R
Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R restaurants_3R retail_3R Cust_value_per_cap_region
per_cap_inc_3R Big_box_index_1R Big_box_0_5R Malls_300K_0_5R_dum;
RUN;
 *15-variable best model with Maximum R-square improvement selection method with multi-trait dummy;
   PROC REG;
  ZZ: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R
Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R restaurants_3R retail_3R Cust_value_per_cap_region
per_cap_inc_3R Big_box_index_1R Big_box_0_5R Malls_300K_0_5R_dum south west;
RUN;
* Adjusted R-square selection method;
PROC REG;
   Adj_R_square: MODEL SALES = HHinc_LT_25K_3R HHinc_25_49K_3R
HHinc_50_74K_3R Pop_married_3R Pop_Associates_3R Pop_Bachelors_3R Pop_GE_18_3R Pop_grades_9_12_3R
restaurants_3R restaurants_retail_3R retail_3R cust_value_per_cap_region  per_cap_inc_3R
Big_box_index_1R  Big_box_0_5R Malls_300K_0_5R_dum / SELECTION=ADJRSQ BEST=20;
   RUN;
*Model AA will be based on the best Adjusted R-Square model and Model AB will be the same but with multi-trait dummy variables;
  PROC REG;
   AA: MODEL SALES = HHinc_50_74K_3R Pop_married_3R Cust_value_per_cap_region per_cap_inc_3R Malls_300K_0_5R_dum;
   AB: MODEL SALES = HHinc_50_74K_3R Pop_married_3R Cust_value_per_cap_region per_cap_inc_3R Malls_300K_0_5R_dum south west;
   RUN;
/*model AB MC check*/
PROC CORR;   
VAR HHinc_50_74K_3R Pop_married_3R Cust_value_per_cap_region per_cap_inc_3R Malls_300K_0_5R_dum south west;
RUN;

QUIT;
