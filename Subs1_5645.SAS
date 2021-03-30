* This program is called Subs1_5645.SAS. ;

* The next block of code cleans the windows each time you run this program. ;
ODS HTML CLOSE ;
ODS HTML ;
DM 'LOG; CLEAR; ODSRESULTS; CLEAR;' ;

* The next block of code reads the data file from the D drive. ;
PROC IMPORT DATAFILE = ' F:Subs1_5645.CSV ' 
   OUT = SUBS1
   DBMS = CSV
   REPLACE ;
   GETNAMES = YES ;
   RUN ;

TITLE 'All Observations';
TITLE 'Miriam Garcia';

* The next block of code sorts Sales and prints sales, store ID and year_open ;
PROC SORT;
   BY SALES;
   RUN;

PROC PRINT;
   VAR Store_ID SALES YEAR_OPEN;
   RUN;

* The next block of code computes the 5 basic summary statistics for sales, to two decimals ;
PROC MEANS MAXDEC=2;
   VAR SALES;
   RUN;

TITLE 'After Removing Unreasonable Observations';

* The next block of code deletes observation for sales that take on values of zero ;
DATA SUBS2;
   SET SUBS1;
   IF SALES=0 THEN DELETE;
   RUN;

* The next block of code computes the 5 basic summary statistics for non-zero sales, to two decimals ;
PROC MEANS MAXDEC=2;
   VAR SALES;
   RUN;

TITLE 'After Removing Unreasonable & Outlier Observations'; 

* The next block of code deletes sales values in excess of 1,939,159 ;
DATA SUBS3;
   SET SUBS2;
   IF SALES > 1939160 THEN DELETE;
   RUN;
* The next block of code computes the 5 basic summary statistics and the CV for "cleaned up" Sales, to two decimals ;
PROC MEANS MAXDEC=2 N MEAN STDDEV MIN MAX CV;
   VAR SALES;
   RUN;

TITLE 'Miriam Garcia ';
* The next block of code computes summary statistis, to 2 decimals, for all variables in the data set. ;
PROC MEANS N MEAN STDDEV MIN MAX CV MAXDEC=2;
   RUN;
PROC CORR;
  VAR Sales Food_away_3R Food_away_5T ;
  RUN;

PROC CORR;
  VAR Sales Likely_customers_1R Likely_customers_5T ;
  RUN;


PROC CORR;
  VAR Sales Pop_GE_18_3R Pop_GE_18_5T Pop_18_21_3R ;
  RUN;

PROC CORR;
  VAR Sales Pop_18_21_5T Pop_21_39_3R Pop_21_39_5T;
  RUN;


PROC CORR;
  VAR Sales Pop_40_49_3R Pop_40_49_5T Pop_50_69_3R ;
  RUN;

PROC CORR;
  VAR Sales Pop_50_69_5T Pop_70_85_3R Pop_70_85_5T;
  RUN;

PROC CORR;
  VAR Sales Competitor_A_index Competitor_B_index;
  RUN;

 PROC CORR;
  VAR Sales Competitor_C_index Competitor_D_index;
  RUN;

PROC CORR;
  VAR Sales Casual_dining_index_1R Fast_food_index_1R ;
  RUN;

PROC CORR;
  VAR Sales Bakeries_index_1R Low_grocery_index_1R Mid_grocery_index_1R ;
  Run;

PROC CORR;
  VAR Sales Big_box_index_1R Sandwich_shop_index_1R;
  RUN;

PROC CORR;
  VAR Sales Pop_Associates_3R Pop_Associates_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_Bachelors_3R Pop_Bachelors_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_Doctorate_3R Pop_Doctorate_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_grades_9_12_3R Pop_grades_9_12_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_grad_school_3R Pop_grad_school_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_in_school_3R Pop_in_school_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_undergrads_3R Pop_undergrads_5T ;
  RUN;

PROC CORR;
  VAR Sales Pop_Masters_3R Pop_Masters_5T;
  RUN;

PROC CORR;
  VAR Sales Pop_some_college_3R Pop_some_college_5T ;
  RUN;

PROC CORR;
  VAR Sales Tot_HH_expend_3R Tot_HH_expend_5T;
  RUN;

PROC CORR;
  VAR Sales Cust_value Cust_value_per_cap Cust_value_region;
  RUN;

PROC CORR;
  VAR Sales Cust_value_per_cap_region HHinc_LT_25K_3R ;
  RUN;

PROC CORR;
  VAR Sales  HHinc_LT_25K_5T HHinc_25_49K_3R HHinc_25_49K_5T;
  RUN;

PROC CORR;
  VAR Sales HHinc_50_74K_3R HHinc_50_74K_5T HHinc_75_99K_3R HHinc_75_99K_5T;
  RUN;

PROC CORR;
  VAR Sales HHinc_GE_100K_3R HHinc_GE_100K_5T Avg_HHinc_3R Avg_HHinc_5T;
  RUN;

PROC CORR;
  VAR Sales Med_HHinc_3R Med_HHinc_5T med_home_value_adj_3R med_home_value_adj_5T;
  RUN;
PROC CORR;
	VAR Sales per_cap_inc_3R per_cap_inc_5T;
	RUN;
PROC CORR;
  VAR Sales HH_1person_3R HH_1person_5T HH_2person_3R HH_2person_5T;
  RUN;

PROC CORR;
  VAR Sales HH_3person_3R HH_3person_5T HH_4person_3R HH_4person_5T;
  RUN;

PROC CORR;
  VAR Sales HH_5person_3R HH_5person_5T HH_6person_3R HH_6person_5T;
  RUN;

PROC CORR;
  VAR Sales Brady_Bunch_3R Brady_Bunch_5T med_home_value_3R;
  RUN;

PROC CORR;
  VAR Sales med_home_value_5T med_home_value_adj_3R med_home_value_adj_5T;
  RUN;

PROC CORR;
  VAR Sales labor_blue_3R labor_blue_5T labor_farm_3R labor_farm_5T;
  RUN;

PROC CORR;
  VAR Sales labor_white_col_3R labor_white_col_5T avg_LOR_3R;
  RUN;

PROC CORR;
  VAR Sales pop_married_3R pop_married_5T distance_hwy;
  RUN;

PROC CORR;
  VAR Sales distance_hwy_interstate distance_interstate ;
  RUN;

PROC CORR;
  VAR Sales restaurants_3R retail_3R restaurants_retail_3R;
  RUN;

PROC CORR;
  VAR Sales Asian_HH_3R Asian_HH_5T Asian_pop_3R Asian_pop_5T;
  RUN;

PROC CORR;
  VAR Sales Black_HH_3R Black_HH_5T Black_pop_3R Black_pop_5T;
  RUN;

PROC CORR;
  VAR Sales Hispanic_HH_3R Hispanic_HH_5T Hispanic_pop_3R Hispanic_pop_5T;
  RUN;


* The next several blocks of code generate scatter plots for all the independent variables;
PROC PLOT;
PLOT SALES * Food_away_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Food_away_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_GE_18_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_GE_18_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_18_21_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_18_21_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_21_39_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_21_39_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_40_49_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_40_49_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_50_69_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_50_69_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_70_85_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_70_85_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Likely_customers_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Likely_customers_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_A_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_B_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_C_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Competitor_D_index = '*';
RUN;

PROC PLOT;
PLOT SALES * Bakeries_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Casual_dining_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Fast_food_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Low_grocery_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Mid_grocery_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Big_box_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Big_box_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Sandwich_shop_index_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Fast_food_8T = '*';
RUN;

PROC PLOT;
PLOT SALES * Big_box_1R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Associates_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Associates_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Bachelors_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Bachelors_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Doctorate_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Doctorate_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grades_9_12_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grades_9_12_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grad_school_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_grad_school_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_in_school_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_in_school_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_undergrads_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_undergrads_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Masters_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_Masters_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_some_college_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_some_college_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Tot_HH_Expend_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Tot_HH_Expend_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_per_cap = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_per_cap = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_region = '*';
RUN;

PROC PLOT;
PLOT SALES * Cust_value_per_cap_region = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_LT_25K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_LT_25K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_25_49K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_25_49K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_50_74K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_50_74K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_75_99K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_75_99K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_GE_100K_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HHinc_GE_100K_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Avg_HHinc_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Avg_HHinc_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Med_HHinc_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Med_HHinc_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_1person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_1person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_2person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_2person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_3person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_3person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_4person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_4person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_5person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_5person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_6person_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * HH_6person_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Brady_Bunch_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Brady_Bunch_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_adj_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * med_home_value_adj_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * per_cap_inc_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * per_cap_inc_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_blue_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_blue_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_farm_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_farm_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_white_col_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * labor_white_col_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * avg_LOR_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_married_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Pop_married_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Distance_hwy = '*';
RUN;

PROC PLOT;
PLOT SALES * Distance_hwy_interstate = '*';
RUN;

PROC PLOT;
PLOT SALES * Distance_interstate = '*';
RUN;

PROC PLOT;
PLOT SALES * restaurants_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * retail_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * restaurants_retail_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_HH_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_HH_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_pop_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Asian_pop_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_HH_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_HH_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_pop_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Black_pop_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_HH_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_HH_5T = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_pop_3R = '*';
RUN;

PROC PLOT;
PLOT SALES * Hispanic_pop_5T = '*';
RUN;

* End with a QUIT statement, even though Jeff Banister says NEVER EVER QUIT! ;
QUIT;
