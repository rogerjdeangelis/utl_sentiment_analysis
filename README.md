# utl_sentiment_analysis
Was the antidepressant effective

     SAS Forum: Pulling themes from a qualitative variable (sentiment analysis)

     WPS/SAS/R Innovation: AI: Was the antidepressant effective.


        WORKING CODE

            Was the antidepressant effective

             before_treatment=c('I am lonely.', 'I lost.', 'I am tired.', 'I am crying.')
             after_treatement=c('I love it.', 'I am happy.', 'Beautiful Day.', 'SAS, R and WPS are fun.')

             sentiment<-syuzhet::get_nrc_sentiment(syuzhet::get_sentences(before_treatment));
             sentiment<-cbind(time=c('&time'),sentence=c(1:4),sentiment);


             sentiment<-syuzhet::get_nrc_sentiment(syuzhet::get_sentences(after_treatement));
             sentiment<-cbind(time=c('&time'),sentence=c(1:4),sentiment);


     WPS/SAS/R Innovation: AI: Was the treatment effective?

     HAVE   These sentiments
     =======================

       Today

             I am lonely.
             I lost.
             I am tired.
             I am crying.

        Tomorrow

             I love it.
             I am happy.
             Beautiful Day.
             SAS, R and WPS are fun.



     WANT to know if the outlook is good (think stock market)
     =========================================================

     Looks like things are looking up

     Today has 100% negative sentiments

     TIME     POSITIVE    NEGATIVE    Frequency     Percent
     -------------------------------------------------------
     today           0           1           4      100.00      100% negative

     Tomorrow has 100% positive sentiments


     TIME        POSITIVE    NEGATIVE    Frequency     Percent
     ----------------------------------------------------------
     tomorrow           1           0           4      100.00   100 percent positive

     Detail

     Up to 40 obs WORK.TIME total obs=8

     Obs    TIME        SENTENCE    ANGER    ANTICIPATION    DISGUST    FEAR    JOY    SADNESS    SURPRISE    TRUST

      1     today           1         1            0            1         1      0        1           0         0
      2     today           2         0            0            0         0      0        1           0         0
      3     today           3         0            0            0         0      0        0           0         0
      4     today           4         0            0            0         0      0        1           0         0

      5     tomorrow        1         0            0            0         0      1        0           0         0
      6     tomorrow        2         0            1            0         0      1        0           0         1
      7     tomorrow        3         0            0            0         0      1        0           0         0
      8     tomorrow        4         0            1            0         0      1        0           0         0


     Up to 40 obs WORK.TIME total obs=8

     Obs    TIME        SENTENCE   NEGATIVE    POSITIVE

      1     today           1          1           0
      2     today           2          1           0
      3     today           3          1           0
      4     today           4          1           0

      5     tomorrow        1          0           1
      6     tomorrow        2          0           1
      7     tomorrow        3          0           1
      8     tomorrow        4          0           1



