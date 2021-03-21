//Replication File for Experiment 2
//March 21st 2021
//Article: "Sector-Bias with Nonprofits: An Analysis of Religious Stereotyping"


*------------------Factor Analysis

factor q1 q2 q3 q4 q5
factor q1 q2 q3 q4 q5, factor(1)
rotate, varimax horst blanks(.3) 
predict effective

alpha effective q1 q2 q3 q4 q5, std item detail


*------------------Regression Analysis


reg effective catholic muslim
reg effective negativeperform positiveperform
reg effective catholic muslim negativeperform positiveperform
reg effective catholic muslim negativeperform positiveperform age2 ideology female white religiousattend
reg effective i.catholic##i.negativeperform  i.muslim##i.negativeperform  i.catholic##i.positiveperform  i.muslim##i.positiveperform



*------------------Balance across experimental groups

gen groupnumber=0
replace groupnumber=1 if group=="Group2"
replace groupnumber=2 if group=="Group3"
replace groupnumber=3 if group=="Group4"
replace groupnumber=4 if group=="Group5"
replace groupnumber=5 if group=="Group6"
replace groupnumber=6 if group=="Group7"
replace groupnumber=7 if group=="Group8"
replace groupnumber=8 if group=="Group9"

regress ideology i.groupnumber, robust
regress age2  i.groupnumber, robust
regress religiousattend i.groupnumber, robust
regress female  i.groupnumber, robust
regress white  i.groupnumber, robust

