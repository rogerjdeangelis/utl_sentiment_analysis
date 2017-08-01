SOLUTION
========
*____    _    ____    ______
/ ___|  / \  / ___|  / /  _ \
\___ \ / _ \ \___ \ / /| |_) |
 ___) / ___ \ ___) / / |  _ <
|____/_/   \_\____/_/  |_| \_\

;

Full WPS/SAS/R Solution


%macro utl_sentiment(time=,sentences=c('I love it.', 'I am happy.', 'Beautiful Day.', 'SAS, R and WPS are fun.'));

 %*let sentences=%sysfunc(dequote(&sentences));

 %utl_submit_r64("
   source('c:/Program Files/R/R-3.3.2/etc/Rprofile.site',echo=T);
   library(syuzhet);
   sentence <- &sentences;
   sentiment<-syuzhet::get_nrc_sentiment(syuzhet::get_sentences(sentence));
   sentiment<-cbind(time=c('&time'),sentence=c(1:4),sentiment);
   sentiment;
   run;quit;
 ");

%mend utl_setiment;

%utl_sentiment(time=today,sentences=c('I am lonely.', 'I lost.', 'I am tired.', 'I am crying.'));
%utl_sentiment(time=tomorrow);


 .libPaths(c(.libPaths(), "d:/3.3.2", "d:/3.3.2_usr"))


   time sentence anger anticipation disgust fear joy sadness surprise trust
1 today        1     1            0       1    1   0       1        0     0
2 today        2     0            0       0    0   0       1        0     0
3 today        3     0            0       0    0   0       0        0     0
4 today        4     0            0       0    0   0       1        0     0
  negative positive
1        1        0
2        1        0
3        1        0
4        1        0
        ===
       100 % negative


 options(help_type = "html")
     time sentence anger anticipation disgust fear joy sadness surprise trust
 tomorrow        1     0            0       0    0   1       0        0     0
 tomorrow        2     0            1       0    0   1       0        0     1
 tomorrow        3     0            0       0    0   1       0        0     0
 tomorrow        4     0            1       0    0   1       0        0     0
 negative positive
        0        1
        0        1
        0        1
        0        1
              100% positive


*_        ______  ____    ______
\ \      / /  _ \/ ___|  / /  _ \
 \ \ /\ / /| |_) \___ \ / /| |_) |
  \ V  V / |  __/ ___) / / |  _ <
   \_/\_/  |_|   |____/_/  |_| \_\

;


%macro utl_sentiment(time=,sentences=c('I love it.', 'I am happy.', 'Beautiful Day.', 'SAS, R and WPS are fun.'));

 %*let sentences=%sysfunc(dequote(&sentences));

 %utl_submit_wps64("
   options set=R_HOME 'C:/Program Files/R/R-3.3.2';
   libname sd1 'd:/sd1';
   proc r;
   submit;
   source('c:/Program Files/R/R-3.3.2/etc/Rprofile.site',echo=T);
   library(syuzhet);
   sentence <- &sentences;
   sentiment<-syuzhet::get_nrc_sentiment(syuzhet::get_sentences(sentence));
   sentiment<-cbind(time=c('&time'),sentence=c(1:4),sentiment);
   endsubmit;
   import r=sentiment data=sd1.&time;
   run;quit;
 ");

%mend utl_setiment;

%utl_sentiment(time=today,sentences=c('I am lonely.', 'I lost.', 'I am tired.', 'I am crying.'));
%utl_sentiment(time=tomorrow);

data time;
  length time $10;
  set sd1.today sd1.tomorrow;
run;quit;

proc freq data=time;
 by time;
 tables time*positive*negative/list;
run;quit;
%macro gith / cmd;
   store;note;notesubmit '%githa;';
   run;
%mend gith;

%macro githa;
   filename clp clipbrd ;
   data _null_;
     retain git 0;
     infile clp end=dne;
     input;
     putlog "    ```  " _infile_ "  ```";
     if dne then put git=;
   run;
%mend githa;



