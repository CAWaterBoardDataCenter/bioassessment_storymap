### StoryMap for SWAMP Bioassessment Program 
### Created by: Hannah Merges
### Created on: 9/29/2026
### Last Updated on: 9/29/2026



#### The goal of this R script is to tidy and process the CSCI score data from the SWAMP Physical Habitat dataset to make it usable and in the ideal format to bring into ArcGIS Pro and make a map



### Load libraries 
library(tidyverse)
library(readr)
library(magrittr)
library(janitor)
library(here)
library(ggplot2)



### Import the data 
#CSCI_scores <- read_csv(here::here("Data", "HabitatData_2026-09-02.csv")) ## load but then delete for right now so can push to GitHub, maybe pull in via link in the future?
refstatus <- read_csv(here::here("Data", "bioassessment_ref_sites_2026-09-21.csv"))
refstatus_edited <- read_csv(here::here("Data", "Statewide_CSCI_refstat_dataset.csv")) ## this dataset was previously filtered and saved by FW to re-name columns to be the same as CSCI score datasheet and filter out unnecessary columns
## FW already joined with reference status dataset and filtered 


refstatus_edited_CSCIonly <- refstatus_edited %>% 
  dplyr::filter(Analyte=="CSCI")

write_csv(refstatus_edited_CSCIonly, here("Data", "refstatus_edited_CSCIonly.csv")) ##save this new df to work with in ArcPro


#### so # all the previous data tidying here b/c as of `0/15/26 don't need to do this and FW has separate script for joining and tidying datasets`
### Tidy the data 
#head(CSCI_scores) ##viewing only part of the dataset bc it is so large, just to make sure everything loaded correctly

#unique(CSCI_scores$Analyte) ## viewing the unique names within the Analyte column to determine which CSCI score values to filter out

#CSCI_scores_edited <- CSCI_scores %>% 
 # dplyr::select("Program", "ParentProject", "Project", "StationName", "StationCode", "SampleDate", "Analyte", "Result", "Latitude", "Longitude") %>% ## these are the columns we want to save in the edited df
 # dplyr::filter(Analyte=="CSCI") ## these are the specific CSCI score analytes we want to filter for

#CSCI_scores_edited %>% print(n=100) ## want to view the first 100 rows to double check the df

#View(CSCI_scores_edited)

#write_csv(CSCI_scores_edited, here("Data", "CSCI_scores_edited.csv")) ##save this new df to work with in ArcPro

### Join with SCCWRP dataset to bring in reference status of sites

#View(refstatus_edited)

##CSCI_w_refstatus <- CSCI_scores %>% 
##full_join(refstatus_edited, by= "StationCode") ## currently an error