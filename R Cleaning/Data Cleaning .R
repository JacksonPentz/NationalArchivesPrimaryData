

library(readxl)
library('tidyr')
library('ggplot2')
library(dplyr)
library(sf)
library(rgdal)


US_county_1940_conflated <- read_excel("~/Desktop/US_county_1940_conflated.xlsm", col_types = c("numeric", "text", "numeric", 
        "numeric", "numeric", "numeric", 
        "text", "text", "numeric", "numeric", 
        "numeric", "text", "numeric", "numeric", 
        "numeric", "numeric", "numeric", 
        "numeric", "date", "text", "numeric", "numeric", "numeric", "numeric"))


        
load("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0013/35206-0013-Data.rda")
load("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0015/35206-0015-Data.rda")
load("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0016/35206-0016-Data.rda")
load("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0020/35206-0020-Data.rda")
load("/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0021/35206-0021-Data.rda")
load('/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0011/35206-0011-Data.rda')
load('/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0012/35206-0012-Data.rda')
load('/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0025/35206-0025-Data.rda')
load('/Users/jacksonpentz/Desktop/Thesis/Data/ICPSR Data/ICPSR_35206/DS0027/35206-0027-Data.rda')



Data1920 <- da35206.0011 %>% select(STATE, COUNTY, VAR1, VAR4A, VAR6, VAR18B, VAR18C, VAR27, VAR26A, VAR26B, VAR26C, VAR7, VAR8, VAR9, VAR10, VAR11, VAR12, VAR13, VAR14, VAR15, VAR15A, VAR15B)
Data1925 <- da35206.0012 %>% select(STATE, COUNTY, VAR2, VAR15, VAR16, VAR39, VAR41, VAR43, VAR45, VAR40, VAR42, VAR44, VAR46, VAR17, VAR20, VAR125, VAR54, VAR56, VAR58, VAR60, VAR55, VAR57, VAR59, VAR61, VAR137, VAR140, VAR143, VAR146, VAR138, VAR141, VAR144, VAR147, VAR3, VAR4, VAR5, VAR6, VAR7, VAR8, VAR9, VAR10, VAR11, VAR12, VAR13)
Data1930 <- da35206.0013 %>% select(STATE, COUNTY, VAR2, VAR4, VAR5, VAR9, VAR10, VAR22, VAR23, VAR120, VAR71, VAR73, VAR75, VAR77, VAR72, VAR74, VAR76, VAR78, VAR126, VAR127, VAR85, VAR86, VAR87, VAR88, VAR89, VAR90, VAR91, VAR92, VAR93, VAR94, VAR95)
Data1935 <- da35206.0015 %>% select(STATE, COUNTY, VAR2, VAR3, VAR4, VAR13, VAR14, VAR5, VAR6, VAR19, VAR73, VAR74, VAR75, VAR76, VAR77, VAR78, VAR79, VAR80, VAR81, VAR82, VAR22, VAR23, VAR200, VAR201, VAR202, VAR203, VAR204, VAR205, VAR206, VAR207, VAR208, VAR209, VAR210, VAR211, VAR212, VAR213, VAR214, VAR215, VAR216)
Data1940 <- da35206.0016 %>% select(STATE, COUNTY, VAR4, VAR34, VAR35, VAR36, VAR37, VAR40, VAR41, VAR29, VAR38, VAR39, VAR112, VAR114, VAR115, VAR116, VAR117, VAR118, VAR119, VAR120, VAR121, VAR122, VAR123, VAR124, VAR125, VAR126, VAR127, VAR128, VAR129)
Data1945 <- da35206.0020 %>% select(STATE, COUNTY, VAR2, VAR67, VAR68, VAR618, VAR624, VAR556, VAR557, VAR39, VAR630, VAR642, VAR654, VAR660, VAR667, VAR668, VAR669, VAR670, VAR671, VAR672, VAR673, VAR674, VAR675, VAR676, VAR677, VAR678, VAR679, VAR680, VAR681)
Data1950 <- da35206.0021 %>% select(STATE, COUNTY, VAR1, VAR127, VAR128, VAR185, VAR191, VAR129, VAR130, VAR10, VAR198, VAR210, VAR101, VAR102, VAR103, VAR104, VAR105, VAR106, VAR107, VAR108, VAR109, VAR110, VAR111, VAR112, VAR113)
Data1954 <- da35206.0025 %>% select(STATE, COUNTY, VAR1, VAR138, VAR144, VAR150, VAR156, VAR103, VAR104, VAR10, VAR163, VAR175, VAR188, VAR189, VAR190, VAR191, VAR192, VAR193, VAR194, VAR195, VAR196, VAR197, VAR198, VAR199, VAR200)
Data1959 <- da35206.0027 %>% select(STATE, COUNTY, VAR1, VAR209, VAR215, VAR221, VAR226, VAR189, VAR190, VAR3, VAR8, VAR232, VAR240, VAR137, VAR138, VAR139, VAR140, VAR141, VAR142, VAR143, VAR144, VAR145, VAR146, VAR147)

#1920 Data 
Data1920 <- rename(Data1920, "1920_number_farms" = "VAR1", "1920_white_operators" = "VAR4A", "1920_colored_operators" = "VAR6", 
                   "1920_white_land" = "VAR18B", "1920_colored_land" = "VAR18C", "1920_full_owners" = "VAR27", "1920_value" = "VAR26A", 
                   "1920_white_farm_value" = "VAR26B", "1920_colored_farm_value" = "VAR26C")
Data1920$"1920_farms_0-9" = Data1920$VAR7+Data1920$VAR8
Data1920$"1920_farms_10-99" = Data1920$VAR9+Data1920$VAR10+Data1920$VAR11
Data1920$"1920_farms_100-499" = Data1920$VAR12+Data1920$VAR13+Data1920$VAR14
Data1920$"1920_farms_500-999" = Data1920$VAR15
Data1920$"1920_farms_1000+" = Data1920$VAR15A+Data1920$VAR15B
  Data1920 <- Data1920 %>% select(STATE, COUNTY, '1920_number_farms', '1920_white_operators', '1920_colored_operators', '1920_white_land','1920_colored_land',
                                 '1920_full_owners', '1920_value', '1920_white_farm_value', '1920_colored_farm_value', '1920_farms_0-9', '1920_farms_10-99', 
                                 '1920_farms_100-499', '1920_farms_500-999', '1920_farms_1000+')

#1925 Data
Data1925 <- rename(Data1925, "1925_number_farms" = "VAR2", "1925_white_operators" = "VAR15", "1925_colored_operators" = "VAR16",
                  "1925_full_owners" = "VAR17", "1925_part_owners" = "VAR20", 
                   "1925_value" = "VAR125")
Data1925$"1925_white_land" = Data1925$VAR39+Data1925$VAR41+Data1925$VAR43+Data1925$VAR45
Data1925$"1925_colored_land" = Data1925$VAR40+Data1925$VAR42+Data1925$VAR44+Data1925$VAR46
Data1925$"1925_white_cropland" = Data1925$VAR54+Data1925$VAR56+Data1925$VAR58+Data1925$VAR60
Data1925$"1925_colored_cropland" = Data1925$VAR55+Data1925$VAR57+Data1925$VAR59+Data1925$VAR61
Data1925$"1925_white_farm_value" = Data1925$VAR137+Data1925$VAR140+Data1925$VAR143+Data1925$VAR146
Data1925$"1925_colored_farm_value" = Data1925$VAR138+Data1925$VAR141+Data1925$VAR144+Data1925$VAR147
Data1925$"1925_farms_0-9" = Data1925$VAR3+Data1925$VAR4
Data1925$"1925_farms_10-99" = Data1925$VAR5+Data1925$VAR6+Data1925$VAR7
Data1925$"1925_farms_100-499" = Data1925$VAR8+Data1925$VAR9+Data1925$VAR10
Data1925$"1925_farms_500-999" = Data1925$VAR11
Data1925$"1925_farms_1000+" = Data1925$VAR12+Data1925$VAR13
Data1925 <- Data1925 %>% select(STATE, COUNTY, '1925_number_farms', '1925_white_operators', '1925_colored_operators', '1925_white_land','1925_colored_land',
                                '1925_full_owners', '1925_part_owners', '1925_value', "1925_white_cropland", "1925_colored_cropland", '1925_white_farm_value', '1925_colored_farm_value', 
                                '1925_farms_0-9', '1925_farms_10-99', '1925_farms_100-499', '1925_farms_500-999', '1925_farms_1000+')

#1930 Data
Data1930 <- rename(Data1930, "1930_number_farms" = "VAR2", "1930_white_operators" = "VAR4", "1930_colored_operators" = "VAR5", 
       "1930_white_land" = "VAR9", "1930_colored_land" = "VAR10", "1930_full_owners" = "VAR22", "1930_part_owners" = "VAR23",
     "1930_value" = "VAR120", "1930_white_farm_value" = "VAR126",
      "1930_colored_farm_value" = "VAR127")
Data1930$"1930_white_cropland" = Data1930$VAR71+Data1930$VAR73+Data1930$VAR75+Data1930$VAR77
Data1930$"1930_colored_cropland" = Data1930$VAR72+Data1930$VAR74+Data1930$VAR76+Data1930$VAR78
Data1930$"1930_farms_0-9" = Data1930$VAR85+Data1930$VAR86
Data1930$"1930_farms_10-99" = Data1930$VAR87+Data1930$VAR88+Data1930$VAR89
Data1930$"1930_farms_100-499" = Data1930$VAR90+Data1930$VAR91+Data1930$VAR92
Data1930$"1930_farms_500-999" = Data1930$VAR93
Data1930$"1930_farms_1000+" = Data1930$VAR94+Data1930$VAR95
Data1930 <- Data1930 %>% select(STATE, COUNTY, '1930_number_farms', '1930_white_operators', '1930_colored_operators', '1930_white_land','1930_colored_land',
                                '1930_full_owners', '1930_part_owners', '1930_value', "1930_white_cropland", "1930_colored_cropland", '1930_white_farm_value', '1930_colored_farm_value', 
                                '1930_farms_0-9', '1930_farms_10-99', '1930_farms_100-499', '1930_farms_500-999', '1930_farms_1000+')

#1935 Data
Data1935 <- rename(Data1935, "1935_number_farms" = VAR2, "1935_white_operators" = VAR3, "1935_colored_operators" = VAR4, 
       "1935_white_land" = VAR13, "1935_colored_land" = VAR14, "1935_full_owners" = VAR5, "1935_part_owners" = VAR6,
       "1935_value" = VAR19, "1935_white_farm_value" = VAR22,
       "1935_colored_farm_value" = VAR23)
#cropland values from 1934
Data1935$"1935_white_cropland" = Data1935$VAR73+Data1935$VAR74+Data1935$VAR75+Data1935$VAR76+Data1935$VAR77
Data1935$"1935_colored_cropland" = Data1935$VAR78+Data1935$VAR79+Data1935$VAR80+Data1935$VAR81+Data1935$VAR82
Data1935$"1935_farms_0-9" = Data1935$VAR200+Data1935$VAR201
Data1935$"1935_farms_10-99" = Data1935$VAR202+Data1935$VAR203+Data1935$VAR204+Data1935$VAR205+Data1935$VAR206
Data1935$"1935_farms_100-499" = Data1935$VAR207+Data1935$VAR208+Data1935$VAR209+Data1935$VAR210+Data1935$VAR211+Data1935$VAR212+Data1935$VAR213
Data1935$"1935_farms_500-999" = Data1935$VAR214+Data1935$VAR215
Data1935$"1935_farms_1000+" = Data1935$VAR216
Data1935 <- Data1935 %>% select(STATE, COUNTY, '1935_number_farms', '1935_white_operators', '1935_colored_operators', '1935_white_land','1935_colored_land',
                                '1935_full_owners', '1935_part_owners', '1935_value', "1935_white_cropland", "1935_colored_cropland", '1935_white_farm_value', '1935_colored_farm_value', 
                                '1935_farms_0-9', '1935_farms_10-99', '1935_farms_100-499', '1935_farms_500-999', '1935_farms_1000+')

#1940 Data
Data1940 <- rename(Data1940, "1940_number_farms" = VAR4, "1940_white_operators" = VAR34, "1940_colored_operators" = VAR35, 
       "1940_white_land" = VAR36, "1940_colored_land" = VAR37, "1940_full_owners" = VAR40, "1940_part_owners" = VAR41,
       "1940_value" = VAR29, "1940_white_farm_value" = VAR38,
       "1940_colored_farm_value" = VAR39)
Data1940$"1940_farms_0-9" = Data1940$VAR112+Data1940$VAR114
Data1940$"1940_farms_10-99" = Data1940$VAR115+Data1940$VAR116+Data1940$VAR117+Data1940$VAR118+Data1940$VAR119
Data1940$"1940_farms_100-499" = Data1940$VAR120+Data1940$VAR121+Data1940$VAR122+Data1940$VAR123+Data1940$VAR124+Data1940$VAR125+Data1940$VAR126
Data1940$"1940_farms_500-999" = Data1940$VAR127+Data1940$VAR128
Data1940$"1940_farms_1000+" = Data1940$VAR129
Data1940 <- Data1940 %>% select(STATE, COUNTY, '1940_number_farms', '1940_white_operators', '1940_colored_operators', '1940_white_land','1940_colored_land',
                                '1940_full_owners', '1940_part_owners', '1940_value', '1940_white_farm_value', '1940_colored_farm_value', 
                                '1940_farms_0-9', '1940_farms_10-99', '1940_farms_100-499', '1940_farms_500-999', '1940_farms_1000+')
Data1940 <- Data1940 %>% drop_na(`1940_number_farms`)

#1945 Data
Data1945 <- rename(Data1945, "1945_number_farms" = VAR2, "1945_white_operators" = VAR67, "1945_colored_operators" = VAR68, 
       "1945_white_land" = VAR618, "1945_colored_land" = VAR624, "1945_full_owners" = VAR556, "1945_part_owners" = VAR557,
       "1945_value" = VAR39, "1945_white_cropland" = VAR630, "1945_colored_cropland" = VAR642, "1945_white_farm_value" = VAR654,
       "1945_colored_farm_value" = VAR660)
Data1945$"1945_farms_0-9" = Data1945$VAR667+Data1945$VAR668
Data1945$"1945_farms_10-99" = Data1945$VAR669+Data1945$VAR670+Data1945$VAR671+Data1945$VAR672
Data1945$"1945_farms_100-499" = Data1945$VAR673+Data1945$VAR674+Data1945$VAR675+Data1945$VAR676+Data1945$VAR677+Data1945$VAR678
Data1945$"1945_farms_500-999" = Data1945$VAR679+Data1945$VAR680
Data1945$"1945_farms_1000+" = Data1945$VAR681
Data1945 <- Data1945 %>% select(STATE, COUNTY, '1945_number_farms', '1945_white_operators', '1945_colored_operators', '1945_white_land','1945_colored_land',
                                '1945_full_owners', '1945_part_owners', '1945_value', "1945_white_cropland", "1945_colored_cropland", '1945_white_farm_value', '1945_colored_farm_value', 
                                '1945_farms_0-9', '1945_farms_10-99', '1945_farms_100-499', '1945_farms_500-999', '1945_farms_1000+')

#1950 Data
Data1950 <- rename(Data1950, "1950_number_farms" = VAR1, "1950_white_operators" = VAR127, "1950_colored_operators" = VAR128, 
       "1950_white_land" = VAR185, "1950_colored_land" = VAR191, "1950_full_owners" = VAR129, "1950_part_owners" = VAR130,
       "1950_white_cropland" = VAR198, "1950_colored_cropland" = VAR210)
Data1950$"1950_value" = Data1950$VAR10*Data1950$'1950_number_farms'
Data1950$"1950_farms_0-9" = Data1950$VAR101+Data1950$VAR102
Data1950$"1950_farms_10-99" = Data1950$VAR103+Data1950$VAR104+Data1950$VAR105+Data1950$VAR106
Data1950$"1950_farms_100-499" = Data1950$VAR107+Data1950$VAR108+Data1950$VAR109+Data1950$VAR110+Data1950$VAR111
Data1950$"1950_farms_500-999" = Data1950$VAR112
Data1950$"1950_farms_1000+" = Data1950$VAR113
Data1950 <- Data1950 %>% select(STATE, COUNTY, '1950_number_farms', '1950_white_operators', '1950_colored_operators', '1950_white_land','1950_colored_land',
                                '1950_full_owners', '1950_part_owners', '1950_value', "1950_white_cropland", "1950_colored_cropland", 
                                '1950_farms_0-9', '1950_farms_10-99', '1950_farms_100-499', '1950_farms_500-999', '1950_farms_1000+')

#1954 Data
Data1954 <- rename(Data1954, "1954_number_farms" = VAR1, "1954_white_operators" = VAR138, "1954_colored_operators" = VAR144, 
                   "1954_white_land" = VAR150, "1954_colored_land" = VAR156, "1954_full_owners" = VAR103, "1954_part_owners" = VAR104,
                   "1954_white_cropland" = VAR163, "1954_colored_cropland" = VAR175)
  Data1954$"1954_value" = Data1954$VAR10*Data1954$"1954_number_farms"
# create 1954 farm value variable by multiple average value per acre by number of acres
  Data1954$"1954_farms_0-9" = Data1954$VAR188+Data1954$VAR189
  Data1954$"1954_farms_10-99" = Data1954$VAR190+Data1954$VAR191+Data1954$VAR192+Data1954$VAR193
  Data1954$"1954_farms_100-499" = Data1954$VAR194+Data1954$VAR195+Data1954$VAR196+Data1954$VAR197+Data1954$VAR198
  Data1954$"1954_farms_500-999" = Data1954$VAR199
  Data1954$"1954_farms_1000+" = Data1954$VAR200
  Data1954 <- Data1954 %>% select(STATE, COUNTY, "1954_number_farms", '1954_white_operators', "1954_colored_operators", "1954_white_land", "1954_colored_land",
                                  "1954_full_owners", "1954_part_owners", "1954_white_cropland", "1954_colored_cropland", "1954_value",  '1954_farms_0-9', '1954_farms_10-99',
                                  '1954_farms_100-499', '1954_farms_500-999', '1954_farms_1000+')
# Eliminate Var8 and Var11

#1959 Data
Data1959 <- rename(Data1959, "1959_number_farms" = VAR1, "1959_white_operators" = VAR209, "1959_colored_operators" = VAR215, 
                     "1959_white_land" = VAR221, "1959_colored_land" = VAR226, "1959_full_owners" = VAR189, "1959_part_owners" = VAR190,
                     "1959_white_cropland" = VAR232, "1959_colored_cropland" = VAR240)  
Data1959$"1959_value" = Data1959$VAR3*Data1959$VAR8
# Create 1959 farm value by multiple average value per acre by number of acres,  Eliminate Var3 and Var8
Data1959$"1959_farms_0-9" = Data1959$VAR137
Data1959$"1959_farms_10-99" = Data1959$VAR138+Data1959$VAR139+Data1959$VAR140
Data1959$"1959_farms_100-499" = Data1959$VAR141+Data1959$VAR142+Data1959$VAR143+Data1959$VAR144+Data1959$VAR145
Data1959$"1959_farms_500-999" = Data1959$VAR146
Data1959$"1959_farms_1000+" = Data1959$VAR147
Data1959 <- Data1959 %>% select(STATE, COUNTY, "1959_number_farms", '1959_white_operators', "1959_colored_operators", "1959_white_land", "1959_colored_land",
                                "1959_full_owners", "1959_part_owners", "1959_white_cropland", "1959_colored_cropland", "1959_value", '1959_farms_0-9', '1959_farms_10-99',
                                '1959_farms_100-499', '1959_farms_500-999', '1959_farms_1000+')





data30_35<- inner_join(Data1930, Data1935, by = c("STATE", "COUNTY"))
data30_35_40<- inner_join(data30_35, Data1940, by = c("STATE", "COUNTY"))
data30_35_40_45<- inner_join(data30_35_40, Data1945, by = c("STATE", "COUNTY"))
data30_50 <- inner_join(data30_35_40_45, Data1950, by = c("STATE", "COUNTY"))
data30_54 <- inner_join(data30_50, Data1954, by = c("STATE", "COUNTY"))
data30_59 <- inner_join(data30_54, Data1959, by = c("STATE", "COUNTY"))
data25_59 <- inner_join(data30_59, Data1925, by = c("STATE", "COUNTY"))
data20_59 <- inner_join(data25_59, Data1920, by = c("STATE", "COUNTY"))
## Merged ICPSR data by county and state codes with new variable headings 


US_county_1940_conflated <- US_county_1940_conflated %>% select(ICPSRST, ICPSRCTY, GISJOIN, GISJOIN2, X_CENTROID, Y_CENTROID, Date_of_entry, In_TV,
                                                                Year_received, Farm_plan, Contract_approved, First_Phosphate)
US_county_1940_conflated <- rename(US_county_1940_conflated, "COUNTY" = ICPSRCTY, "STATE" = ICPSRST)
# Clean county data

Total_wide <- inner_join(data20_59, US_county_1940_conflated, by = c("STATE", "COUNTY"))
#Merge county TVA and GIS excel data with ICPSR demographic data 


### Stopped update HERE




## Format Data into wide format by making new year column, changing variable name to remove year, and 
## making all data have same variables 

Data_1920_wide <- Data1920
Data_1920_wide$YEAR = 1920
Data_1920_wide <- rename(Data_1920_wide, "number_farms" = "1920_number_farms", "white_operators" = "1920_white_operators", "colored_operators" = "1920_colored_operators", 
                   "white_land" = "1920_white_land", "colored_land" = "1920_colored_land", "full_owners" = "1920_full_owners", "value" = "1920_value", 
                   "white_farm_value" = "1920_white_farm_value", "colored_farm_value" = "1920_colored_farm_value", "farms_0-9" = '1920_farms_0-9', "farms_10-99" ='1920_farms_10-99', 
                   "farms_100-499" ='1920_farms_100-499', "farms_500-999" ='1920_farms_500-999', "farms_1000+" ='1920_farms_1000+')

Data_1920_wide$part_owners = NA
Data_1920_wide$white_cropland = NA
Data_1920_wide$colored_cropland = NA

Data_1920_wide <- inner_join(Data_1920_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1925_wide <- Data1925
Data_1925_wide$YEAR = 1925
Data_1925_wide <- rename(Data_1925_wide, "number_farms" = "1925_number_farms", "white_operators" = "1925_white_operators", "colored_operators" = "1925_colored_operators", 
                                  "white_land" = "1925_white_land", "colored_land" = "1925_colored_land", "full_owners" = "1925_full_owners", "part_owners" = "1925_part_owners", 
                                  "value" = "1925_value",  "white_cropland" = "1925_white_cropland", "colored_cropland" = "1925_colored_cropland",
                                  "white_farm_value" = "1925_white_farm_value", "colored_farm_value" = "1925_colored_farm_value", "farms_0-9" = '1925_farms_0-9', "farms_10-99" ='1925_farms_10-99', 
                         "farms_100-499" ='1925_farms_100-499', "farms_500-999" ='1925_farms_500-999', "farms_1000+" ='1925_farms_1000+')

Data_1925_wide <- inner_join(Data_1925_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1930_wide <- Data1930
Data_1930_wide$YEAR = 1930
Data_1930_wide <- rename(Data_1930_wide,"number_farms" = "1930_number_farms", "white_operators" = "1930_white_operators", "colored_operators" = "1930_colored_operators", 
                         "white_land" = "1930_white_land", "colored_land" = "1930_colored_land", "full_owners" = "1930_full_owners", "part_owners" = "1930_part_owners", 
                         "value" = "1930_value",  "white_cropland" = "1930_white_cropland", "colored_cropland" = "1930_colored_cropland",
                         "white_farm_value" = "1930_white_farm_value", "colored_farm_value" = "1930_colored_farm_value", "farms_0-9" = '1930_farms_0-9', "farms_10-99" ='1930_farms_10-99', 
                         "farms_100-499" ='1930_farms_100-499', "farms_500-999" ='1930_farms_500-999', "farms_1000+" ='1930_farms_1000+')

Data_1930_wide <- inner_join(Data_1930_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1935_wide <- Data1935
Data_1935_wide$YEAR = 1935
Data_1935_wide <- rename(Data_1935_wide,"number_farms" = "1935_number_farms", "white_operators" = "1935_white_operators", "colored_operators" = "1935_colored_operators", 
                         "white_land" = "1935_white_land", "colored_land" = "1935_colored_land", "full_owners" = "1935_full_owners", "part_owners" = "1935_part_owners", 
                         "value" = "1935_value",  "white_cropland" = "1935_white_cropland", "colored_cropland" = "1935_colored_cropland",
                         "white_farm_value" = "1935_white_farm_value", "colored_farm_value" = "1935_colored_farm_value", "farms_0-9" = '1935_farms_0-9', "farms_10-99" ='1935_farms_10-99', 
                         "farms_100-499" ='1935_farms_100-499', "farms_500-999" ='1935_farms_500-999', "farms_1000+" ='1935_farms_1000+')

Data_1935_wide <- inner_join(Data_1935_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1940_wide <- Data1940
Data_1940_wide$YEAR = 1940
Data_1940_wide <- rename(Data_1940_wide,"number_farms" = "1940_number_farms", "white_operators" = "1940_white_operators", "colored_operators" = "1940_colored_operators", 
                         "white_land" = "1940_white_land", "colored_land" = "1940_colored_land", "full_owners" = "1940_full_owners", "part_owners" = "1940_part_owners", 
                         "value" = "1940_value", "white_farm_value" = "1940_white_farm_value", "colored_farm_value" = "1940_colored_farm_value", "farms_0-9" = '1940_farms_0-9', "farms_10-99" ='1940_farms_10-99', 
                         "farms_100-499" ='1940_farms_100-499', "farms_500-999" ='1940_farms_500-999', "farms_1000+" ='1940_farms_1000+')
Data_1940_wide$white_cropland = NA
Data_1940_wide$colored_cropland = NA

Data_1940_wide <- inner_join(Data_1940_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))


Data_1945_wide <- Data1945
Data_1945_wide$YEAR = 1945
Data_1945_wide <- rename(Data_1945_wide,"number_farms" = "1945_number_farms", "white_operators" = "1945_white_operators", "colored_operators" = "1945_colored_operators", 
                         "white_land" = "1945_white_land", "colored_land" = "1945_colored_land", "full_owners" = "1945_full_owners", "part_owners" = "1945_part_owners", 
                         "value" = "1945_value",  "white_cropland" = "1945_white_cropland", "colored_cropland" = "1945_colored_cropland",
                         "white_farm_value" = "1945_white_farm_value", "colored_farm_value" = "1945_colored_farm_value", "farms_0-9" = '1945_farms_0-9', "farms_10-99" ='1945_farms_10-99', 
                         "farms_100-499" ='1945_farms_100-499', "farms_500-999" ='1945_farms_500-999', "farms_1000+" ='1945_farms_1000+')


Data_1945_wide <- inner_join(Data_1945_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1950_wide <- Data1950
Data_1950_wide$YEAR = 1950
Data_1950_wide <- rename(Data_1950_wide,"number_farms" = "1950_number_farms", "white_operators" = "1950_white_operators", "colored_operators" = "1950_colored_operators", 
                         "white_land" = "1950_white_land", "colored_land" = "1950_colored_land", "full_owners" = "1950_full_owners", "part_owners" = "1950_part_owners", 
                         "value" = "1950_value",  "white_cropland" = "1950_white_cropland", "colored_cropland" = "1950_colored_cropland", "farms_0-9" = '1950_farms_0-9', "farms_10-99" ='1950_farms_10-99', 
                         "farms_100-499" ='1950_farms_100-499', "farms_500-999" ='1950_farms_500-999', "farms_1000+" ='1950_farms_1000+')
Data_1950_wide$white_farm_value <- NA
Data_1950_wide$colored_farm_value <- NA

Data_1950_wide <- inner_join(Data_1950_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1954_wide <- Data1954
Data_1954_wide$YEAR = 1954
Data_1954_wide <- rename(Data_1954_wide,"number_farms" = "1954_number_farms", "white_operators" = "1954_white_operators", "colored_operators" = "1954_colored_operators", 
                         "white_land" = "1954_white_land", "colored_land" = "1954_colored_land", "full_owners" = "1954_full_owners", "part_owners" = "1954_part_owners", 
                         "value" = "1954_value",  "white_cropland" = "1954_white_cropland", "colored_cropland" = "1954_colored_cropland", "farms_0-9" = '1954_farms_0-9', "farms_10-99" ='1954_farms_10-99', 
                         "farms_100-499" ='1954_farms_100-499', "farms_500-999" ='1954_farms_500-999', "farms_1000+" ='1954_farms_1000+')

Data_1954_wide$white_farm_value = NA
Data_1954_wide$colored_farm_value = NA

Data_1954_wide <- inner_join(Data_1954_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

Data_1959_wide <- Data1959
Data_1959_wide$YEAR = 1959
Data_1959_wide <- rename(Data_1959_wide,"number_farms" = "1959_number_farms", "white_operators" = "1959_white_operators", "colored_operators" = "1959_colored_operators", 
                         "white_land" = "1959_white_land", "colored_land" = "1959_colored_land", "full_owners" = "1959_full_owners", "part_owners" = "1959_part_owners", 
                         "value" = "1959_value",  "white_cropland" = "1959_white_cropland", "colored_cropland" = "1959_colored_cropland", "farms_0-9" = '1959_farms_0-9', "farms_10-99" ='1959_farms_10-99', 
                         "farms_100-499" ='1959_farms_100-499', "farms_500-999" ='1959_farms_500-999', "farms_1000+" ='1959_farms_1000+')
Data_1959_wide$white_farm_value = NA
Data_1959_wide$colored_farm_value = NA

Data_1959_wide <- inner_join(Data_1959_wide, US_county_1940_conflated, by = c("STATE", "COUNTY"))

## Vertical Merge 

Total_long <- rbind(Data_1920_wide, Data_1925_wide, Data_1930_wide, Data_1935_wide, Data_1940_wide, Data_1945_wide, Data_1950_wide, 
                    Data_1954_wide, Data_1959_wide)

Total_long <- Total_long[order(Total_long$STATE, Total_long$COUNTY, Total_long$YEAR), ]

#### Total Long and Total wide format Dataframes

### exporting long and wide versions
write.csv(Total_long, "/Users/jacksonpentz/Desktop/Thesis/Data/Exported_Dataframes//Total_Long.csv", row.names=FALSE)

  
write.csv(Total_wide, "/Users/jacksonpentz/Desktop/Thesis/Data/Exported_Dataframes//Total_Wide.csv", row.names=FALSE)



