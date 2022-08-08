library(tidyverse)
library(dplyr)

# Deliverable 1: Linear Regression to Predict MPG
MechaCar_mpg_data<- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
mecha_data_lm<-lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg_data)
summary(mecha_data_lm)

# Deliverable 2: Create Visualizations for the Trip Analysis 
Suspension_coil_data<- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F)

total_summary <-Suspension_coil_data %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')
total_summary

lot_summary <- Suspension_coil_data %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI),Median=median(PSI),Variance=var(PSI),SD=sd(PSI),.groups = 'keep')
lot_summary

# Deliverable 3: T-Tests on Suspension Coils
t.test(Suspension_coil_data$PSI, mu = 1500 )

Lot_1_Info <- Suspension_coil_data %>% filter(Manufacturing_Lot == "Lot1") 
t.test(Lot_1_Info$PSI, mu = 1500) #t.test for lot 1

Lot_2_Info <- Suspension_coil_data %>% filter(Manufacturing_Lot == "Lot2") 
t.test(Lot_2_Info$PSI, mu = 1500) #t.test for lot 2

Lot_3_Info <- Suspension_coil_data %>% filter(Manufacturing_Lot == "Lot3") 
t.test(Lot_3_Info$PSI, mu = 1500) 