# Import Redcap Data
# Gabriel Odom
# 2018-08-20

# The following script is generated automatically by Redcap in order to import
#   the student response data in the form which preserves Redcap's metadata. Any
#   edits I made to the script are identified by the comment "ODOM EDIT". Also, 
#   before you run any of the code in the following script, you may need to
#   install the "Hmisc" R package. Do this by typing
install.packages("Hmsic")
#   into your R Console and pressing the Enter key.



###  BEGIN REDCAP IMPORT SCRIPT  ###

#Clear existing data and graphics
rm(list=ls())
graphics.off()
#Load Hmisc library
library(Hmisc)
#Read Data
# ODOM EDIT
data <- read.csv("data/BST625_class_survey.csv")
# ORIGINAL
# data=read.csv('ClassSurveyBST625201_DATA_2018-08-20_1226.csv')
#Setting Labels

label(data$participant_id)="Participant ID"
label(data$Continent_Born)="Where were you born?"
label(data$wednesday)="How many hours of sleep do you typically get on a Wednesday night?"
label(data$coffee)="Approximately how many ounces of caffeinated coffee do you drink on average per day?"
label(data$exercise)="Approximately how many hours of moderate to intense exercise do you get per week, in increments of .5 hours?"
label(data$math)="Rate your fear or love of math."
label(data$writing)="Rate your enjoyment of manuscript writing."
label(data$sports)="Did you play a varsity sport in high school?"
label(data$band)="Did you play a musical instrument in a high school group?"
label(data$sing)="Did you sing in a high school group?"
label(data$apstat)="Did you take AP Statistics in high school?"
label(data$bc)="Did you take AP Calculus BC In high school?"
label(data$hl)="Did you take IB HL math in high school?"
label(data$alevel)="Did you take GCE A level mathematics in high school?"
label(data$advanced)="Did you take highly advanced mathematics from a different high school curriculum? For example:  Alberta Diploma (Canada) Gāokăo (China)"
label(data$premed)="Did you have a pre-med undergraduate degree (without a double major)?"
label(data$majors___0)="What was your major(s)? (choice=Pre-med)"
label(data$majors___1)="What was your major(s)? (choice=Life sciences but not pre-med)"
label(data$majors___2)="What was your major(s)? (choice=Physical sciences (chemistry, physics, earth sciences, etc.))"
label(data$majors___3)="What was your major(s)? (choice=Engineering)"
label(data$majors___4)="What was your major(s)? (choice=Computer Science)"
label(data$majors___5)="What was your major(s)? (choice=Math/Statistics)"
label(data$majors___6)="What was your major(s)? (choice=Social Sciences)"
label(data$majors___7)="What was your major(s)? (choice=Arts (Music, Dance, Theater, Studio Arts, etc.))"
label(data$majors___8)="What was your major(s)? (choice=Humanities (History, English, Philosophy, etc.))"
label(data$majors___9)="What was your major(s)? (choice=Other)"
label(data$undergrad)="Did you take at least one statistics or research methods class as an undergraduate?"
label(data$pass)="How many years of statistics (not study design/research methods) did you pass as an undergraduate?"
label(data$methods)="How many years of study design/research methods (not statistics) did you pass as an undergraduate?"
label(data$highestmath)="What is highest level math class (not statistics) you have taken (undergrad or graduate level)?"
label(data$packages___1)="Which software packages have you used for analysis? (choice=Excel)"
label(data$packages___2)="Which software packages have you used for analysis? (choice=R)"
label(data$packages___3)="Which software packages have you used for analysis? (choice=SPSS)"
label(data$packages___4)="Which software packages have you used for analysis? (choice=SAS)"
label(data$packages___5)="Which software packages have you used for analysis? (choice=STATA)"
label(data$packages___6)="Which software packages have you used for analysis? (choice=Minitab)"
label(data$packages___7)="Which software packages have you used for analysis? (choice=Other(s))"
label(data$packages___9)="Which software packages have you used for analysis? (choice=I have never done an analysis)"
label(data$central)="Numeric summaries of central tendency (e.g., mean, median, mode)"
label(data$var)="Numeric summaries of variability (e.g., variance, IQR)"
label(data$prob)="Probability distributions"
label(data$dist)="Marginal and joint distributions"
label(data$freq)="Frequentist thinking"
label(data$bayes)="Bayesian thinking"
label(data$ho)="Hypothesis testing"
label(data$pval)="p-values"
label(data$df)="Degrees of freedom"
label(data$ci)="Confidence intervals"
label(data$cri)="Credible intervals (not confidence intervals)"
label(data$ttest)="Testing for differences in averages between two groups"
label(data$anova)="Testing for differences in averages between three or more groups"
label(data$reg)="Predicting a continuous outcome"
label(data$log)="Predicting a categorical outcome"
label(data$sur)="Predicting survival"
label(data$central_calc)="Numeric summaries of central tendency (e.g., mean, median, mode)"
label(data$var_calc)="Numeric summaries of variability (e.g., variance, IQR)"
label(data$prob_calc)="Probability distibutions"
label(data$dist_calc)="Marginal and joint distributions"
label(data$freq_calc)="Frequentist thinking"
label(data$bayes_calc)="Bayesian thinking"
label(data$ho_calc)="Hypothesis testing"
label(data$pval_calc)="p-values"
label(data$df_calc)="Degrees of freedom"
label(data$ci_calc)="Confidence intervals"
label(data$cri_calc)="Credible intervals (not confidence intervals)"
label(data$ttest_calc)="Testing for differences in averages between two groups"
label(data$anova_calc)="Testing for differences in averages between three or more groups"
label(data$reg_calc)="Predicting a continuous outcome"
label(data$log_calc)="Predicting a categorical outcome"
label(data$sur_calc)="Predicting survival"
label(data$hand)="Do statistical calculations by hand"
label(data$excel)="Do calculations with a spreadsheet (like Excel)"
label(data$computer)="Do calculations with statistical software (like R/SAS/STATA/SPSS)"
label(data$articles)="Critique statistics in scholarly articles"
label(data$descriptive)="Produce descriptive statistics (averages, percentages) for my own data"
label(data$graphics)="Produce graphics (bar charts, histograms etc) for my own data"
label(data$converse)="Converse with a statistician about my studies"
label(data$teach)="Teach statistics to my colleagues"
label(data$goal)="What are your goals for BST 625?"
label(data$hours)="How many hours do you think that UM expects students to spend studying outside of class for each hour of class time?"
label(data$grade)="What grade do you expect to get in this class?"
label(data$beach)="Do you like going to the beach?"
label(data$swim)="Do you know how to swim?"
label(data$diver)="Have you ever gone SCUBA diving?"
label(data$wantdiving)="Do you want to go SCUBA diving?"
label(data$student_details_complete)="Complete?"
#Setting Units


#Setting Factors(will create new variable for factors)
data$sports.factor = factor(data$sports,levels=c("1","0"))
data$band.factor = factor(data$band,levels=c("1","0"))
data$sing.factor = factor(data$sing,levels=c("1","0"))
data$apstat.factor = factor(data$apstat,levels=c("1","0"))
data$bc.factor = factor(data$bc,levels=c("1","0"))
data$hl.factor = factor(data$hl,levels=c("1","0"))
data$alevel.factor = factor(data$alevel,levels=c("1","0"))
data$advanced.factor = factor(data$advanced,levels=c("1","0"))
data$premed.factor = factor(data$premed,levels=c("1","0"))
data$majors___0.factor = factor(data$majors___0,levels=c("0","1"))
data$majors___1.factor = factor(data$majors___1,levels=c("0","1"))
data$majors___2.factor = factor(data$majors___2,levels=c("0","1"))
data$majors___3.factor = factor(data$majors___3,levels=c("0","1"))
data$majors___4.factor = factor(data$majors___4,levels=c("0","1"))
data$majors___5.factor = factor(data$majors___5,levels=c("0","1"))
data$majors___6.factor = factor(data$majors___6,levels=c("0","1"))
data$majors___7.factor = factor(data$majors___7,levels=c("0","1"))
data$majors___8.factor = factor(data$majors___8,levels=c("0","1"))
data$majors___9.factor = factor(data$majors___9,levels=c("0","1"))
data$undergrad.factor = factor(data$undergrad,levels=c("1","0"))
data$packages___1.factor = factor(data$packages___1,levels=c("0","1"))
data$packages___2.factor = factor(data$packages___2,levels=c("0","1"))
data$packages___3.factor = factor(data$packages___3,levels=c("0","1"))
data$packages___4.factor = factor(data$packages___4,levels=c("0","1"))
data$packages___5.factor = factor(data$packages___5,levels=c("0","1"))
data$packages___6.factor = factor(data$packages___6,levels=c("0","1"))
data$packages___7.factor = factor(data$packages___7,levels=c("0","1"))
data$packages___9.factor = factor(data$packages___9,levels=c("0","1"))
data$central.factor = factor(data$central,levels=c("1","2","3","4","5"))
data$var.factor = factor(data$var,levels=c("1","2","3","4","5"))
data$prob.factor = factor(data$prob,levels=c("1","2","3","4","5"))
data$dist.factor = factor(data$dist,levels=c("1","2","3","4","5"))
data$freq.factor = factor(data$freq,levels=c("1","2","3","4","5"))
data$bayes.factor = factor(data$bayes,levels=c("1","2","3","4","5"))
data$ho.factor = factor(data$ho,levels=c("1","2","3","4","5"))
data$pval.factor = factor(data$pval,levels=c("1","2","3","4","5"))
data$df.factor = factor(data$df,levels=c("1","2","3","4","5"))
data$ci.factor = factor(data$ci,levels=c("1","2","3","4","5"))
data$cri.factor = factor(data$cri,levels=c("1","2","3","4","5"))
data$ttest.factor = factor(data$ttest,levels=c("1","2","3","4","5"))
data$anova.factor = factor(data$anova,levels=c("1","2","3","4","5"))
data$reg.factor = factor(data$reg,levels=c("1","2","3","4","5"))
data$log.factor = factor(data$log,levels=c("1","2","3","4","5"))
data$sur.factor = factor(data$sur,levels=c("1","2","3","4","5"))
data$central_calc.factor = factor(data$central_calc,levels=c("1","2","3","4","5"))
data$var_calc.factor = factor(data$var_calc,levels=c("1","2","3","4","5"))
data$prob_calc.factor = factor(data$prob_calc,levels=c("1","2","3","4","5"))
data$dist_calc.factor = factor(data$dist_calc,levels=c("1","2","3","4","5"))
data$freq_calc.factor = factor(data$freq_calc,levels=c("1","2","3","4","5"))
data$bayes_calc.factor = factor(data$bayes_calc,levels=c("1","2","3","4","5"))
data$ho_calc.factor = factor(data$ho_calc,levels=c("1","2","3","4","5"))
data$pval_calc.factor = factor(data$pval_calc,levels=c("1","2","3","4","5"))
data$df_calc.factor = factor(data$df_calc,levels=c("1","2","3","4","5"))
data$ci_calc.factor = factor(data$ci_calc,levels=c("1","2","3","4","5"))
data$cri_calc.factor = factor(data$cri_calc,levels=c("1","2","3","4","5"))
data$ttest_calc.factor = factor(data$ttest_calc,levels=c("1","2","3","4","5"))
data$anova_calc.factor = factor(data$anova_calc,levels=c("1","2","3","4","5"))
data$reg_calc.factor = factor(data$reg_calc,levels=c("1","2","3","4","5"))
data$log_calc.factor = factor(data$log_calc,levels=c("1","2","3","4","5"))
data$sur_calc.factor = factor(data$sur_calc,levels=c("1","2","3","4","5"))
data$hand.factor = factor(data$hand,levels=c("1","2","3","4","5","6","7"))
data$excel.factor = factor(data$excel,levels=c("1","2","3","4","5","6","7"))
data$computer.factor = factor(data$computer,levels=c("1","2","3","4","5","6","7"))
data$articles.factor = factor(data$articles,levels=c("1","2","3","4","5","6","7"))
data$descriptive.factor = factor(data$descriptive,levels=c("1","2","3","4","5","6","7"))
data$graphics.factor = factor(data$graphics,levels=c("1","2","3","4","5","6","7"))
data$converse.factor = factor(data$converse,levels=c("1","2","3","4","5","6","7"))
data$teach.factor = factor(data$teach,levels=c("1","2","3","4","5","6","7"))
data$hours.factor = factor(data$hours,levels=c("1","1.5","2","2.5","3","3.5","4","4.5","5"))
data$grade.factor = factor(data$grade,levels=c("1","2","3","4","5","6","7","8","9","10"))
data$beach.factor = factor(data$beach,levels=c("1","0"))
data$swim.factor = factor(data$swim,levels=c("1","0"))
data$diver.factor = factor(data$diver,levels=c("1","0"))
data$wantdiving.factor = factor(data$wantdiving,levels=c("1","0"))
data$student_details_complete.factor = factor(data$student_details_complete,levels=c("0","1","2"))

levels(data$sports.factor)=c("Yes","No")
levels(data$band.factor)=c("Yes","No")
levels(data$sing.factor)=c("Yes","No")
levels(data$apstat.factor)=c("Yes","No")
levels(data$bc.factor)=c("Yes","No")
levels(data$hl.factor)=c("Yes","No")
levels(data$alevel.factor)=c("Yes","No")
levels(data$advanced.factor)=c("Yes","No")
levels(data$premed.factor)=c("Yes","No")
levels(data$majors___0.factor)=c("Unchecked","Checked")
levels(data$majors___1.factor)=c("Unchecked","Checked")
levels(data$majors___2.factor)=c("Unchecked","Checked")
levels(data$majors___3.factor)=c("Unchecked","Checked")
levels(data$majors___4.factor)=c("Unchecked","Checked")
levels(data$majors___5.factor)=c("Unchecked","Checked")
levels(data$majors___6.factor)=c("Unchecked","Checked")
levels(data$majors___7.factor)=c("Unchecked","Checked")
levels(data$majors___8.factor)=c("Unchecked","Checked")
levels(data$majors___9.factor)=c("Unchecked","Checked")
levels(data$undergrad.factor)=c("Yes","No")
levels(data$packages___1.factor)=c("Unchecked","Checked")
levels(data$packages___2.factor)=c("Unchecked","Checked")
levels(data$packages___3.factor)=c("Unchecked","Checked")
levels(data$packages___4.factor)=c("Unchecked","Checked")
levels(data$packages___5.factor)=c("Unchecked","Checked")
levels(data$packages___6.factor)=c("Unchecked","Checked")
levels(data$packages___7.factor)=c("Unchecked","Checked")
levels(data$packages___9.factor)=c("Unchecked","Checked")
levels(data$central.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$var.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$prob.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$dist.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$freq.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$bayes.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$ho.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$pval.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$df.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$ci.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$cri.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$ttest.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$anova.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$reg.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$log.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$sur.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$central_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$var_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$prob_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$dist_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$freq_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$bayes_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$ho_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$pval_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$df_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$ci_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$cri_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$ttest_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$anova_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$reg_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$log_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$sur_calc.factor)=c("I have never heard of it","Not comfortable","I am reasonably comfortable","Comfortable","I could teach this")
levels(data$hand.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$excel.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$computer.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$articles.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$descriptive.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$graphics.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$converse.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$teach.factor)=c("Not at all important","Low importance","Slightly important","Neutral","Moderately important","Very important","Extremely important")
levels(data$hours.factor)=c("1","1.5","2","2.5","3","3.5","4","4.5","No more than 5")
levels(data$grade.factor)=c("A+","A","A-","B+","B","B-","C+","C","C-","Other")
levels(data$beach.factor)=c("Yes","No")
levels(data$swim.factor)=c("Yes","No")
levels(data$diver.factor)=c("Yes","No")
levels(data$wantdiving.factor)=c("Yes","No")
levels(data$student_details_complete.factor)=c("Incomplete","Unverified","Complete")


###  END REDCAP IMPORT SCRIPT  ###