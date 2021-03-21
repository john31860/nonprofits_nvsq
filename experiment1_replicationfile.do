//Replication File for Experiment 1
//March 21st 2021
//Article: "Sector-Bias with Nonprofits: An Analysis of Religious Stereotyping"


*------------------Factor Analysis

factor q1 q2 q3 q4 q5
factor q1 q2 q3 q4 q5, factor(1)
rotate, varimax horst blanks(.3) 
predict effective

alpha effective q1 q2 q3 q4 q5, std item detail



*------------------Regression Analysis


reg effective church faithbased
reg effective negativeperform positiveperform
reg effective church faithbased negativeperform positiveperform 
reg effective church faithbased negativeperform positiveperform age ideology female white religiousattend
reg effective i.church##i.negativeperform  i.faithbased##i.negativeperform  i.church##i.positiveperform  i.faithbased##i.positiveperform


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
regress age  i.groupnumber, robust
regress religiousattend i.groupnumber, robust
regress female  i.groupnumber, robust
regress white  i.groupnumber, robust


