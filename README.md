# NationalArchivesPrimaryData
JPEG Files of pictures taken at National Archives in Atlanta used in TVA TFP Paper

The Timing_of_TFP_Data set contains data on the date the first farm from counties in 19 states either applied to be in,
had their contract approved, or received their first phosphate from the Tennessee Valley Test Farm Program. The dates were
pulled from orginal documentation which was gathered in person at the National Archives in Atlanta, Georgia. Pictures of the
original documents are stored in the "Counties" folder. 

Date_of_entry: This is a date variable that give the month, day, and year listed under either the "Contract Approved," "First Phosphate," 
or "Farm Plan or Reg. Received" columns as documented in the "Counties" folder. NA indicates that there was no date recorded for the county. 


In_TV: This is a binary, Yes/No variable that reads Yes if the county is in the Tennessee Valley region as defined by the original maps stored
stored in the "Photos" folder, and No if the county was not. 

Farm_Plan: This is a Yes, No, NA variable that reads Y when the value in the "Date_of_entry" column represents the date the
first farm in the county's farm plan and registration for the TFP were received by the TVA, N when the value represents another milestone, and NA when 
there is no date from the county. 


Contract_approved: This is a Yes, No, NA variable that reads Y when the value in the "Date_of_entry" column represents the date the
first farm in the county's TFP contract was approved by the TVA, N when the value represents another milestone, and NA when 
there is no date from the county. 


First_Phosphate: This is a Yes, No, NA variable that reads Y when the value in the "Date_of_entry" column represents the date the
first farm in the county received their first phosphate from the TFP, N when the value represents another milestone, and NA when 
there is no date from the county. 


Year_received: This is a numeric variable that lists the year as recorded in the "FIrst Phosphate Shipped" column in the original 
documentation in the "States" folder the TVA first shipped phosphate to the state as part of the TFP. 


