library(foreign)
library(dplyr)
#load control varibales from datasets

controls_1920 <- read.dta("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_02896_controls/DS0024/02896-0024-Data.dta")
controls_1930 <- read.dta("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_02896_controls/DS0026/02896-0026-Data.dta")
controls_1940 <- read.dta("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_02896_controls/DS0032/02896-0032-Data.dta")
controls_1950 <- read.dta("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_02896_controls/DS0035/02896-0035-Data.dta")

#select desired variables and rename 

controls_1920 <- controls_1920 %>% select(state, county, totpop, mtot, ftot, urb920, rural20, area)
controls_1930 <- controls_1930 %>% select(state, county, totpop, mtot, ftot, urb930, rural30, area)
controls_1940 <- controls_1940 %>% select(state, county, totpop, mtot, ftot, urb940, area)
controls_1950 <- controls_1950 %>% select(state, county, totpop, mtot, ftot, urb950, area)
  controls_1950$"1950_rural_population" = controls_1950$totpop - controls_1950$urb950

# rename variables
  
controls_1920 <- rename(controls_1920, "STATE" = "state", "COUNTY" = "county", "1920_total_population" = "totpop",  "1920_male_population" = "mtot",
                        "1920_female_population" = "ftot", "1920_urban_population" = "urb920", "1920_rural_population" = "rural20", "1920_area_square_miles" =  "area")

controls_1930 <- rename(controls_1930, "STATE" = "state", "COUNTY" = "county", "1930_total_population" = "totpop",  "1930_male_population" = "mtot",
                        "1930_female_population" = "ftot", "1930_urban_population" = "urb930", "1930_rural_population" = "rural30", "1930_area_square_miles" =  "area")

controls_1940 <- rename(controls_1940, "STATE" = "state", "COUNTY" = "county", "1940_total_population" = "totpop",  "1940_male_population" = "mtot",
                        "1940_female_population" = "ftot", "1940_urban_population" = "urb940", "1940_area_square_miles" =  "area")
  controls_1940$"1940_rural_population" = controls_1940$'1940_total_population' - controls_1940$'1940_urban_population'

controls_1950 <- rename(controls_1950, "STATE" = "state", "COUNTY" = "county", "1950_total_population" = "totpop",  "1950_male_population" = "mtot",
                          "1950_female_population" = "ftot", "1950_urban_population" = "urb950",  "1950_area_square_miles" =  "area")

# merge data 

control_20_30 <- inner_join(controls_1920, controls_1930, by = c("STATE", "COUNTY"))
control_20_40 <- inner_join(control_20_30, controls_1940, by = c("STATE", "COUNTY"))
Total_controls_wide <- inner_join(control_20_40, controls_1950, by = c("STATE", "COUNTY"))


