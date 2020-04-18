library(dplyr)

# import Seattle Real Time Fire 911 Calls file downloaded from 
# "https://data.seattle.gov/Public-Safety/Seattle-Real-Time-Fire-911-Calls/kzjm-xkqj"
Seattle_Real_Time_Fire_911_Calls <- read.csv("data/Seattle_Real_Time_Fire_911_Calls.csv", stringsAsFactors = FALSE)

# filter out 911 responses specific to alder hall from 1460139 observations over 10 years
# eliminate unrelated data
alder <- Seattle_Real_Time_Fire_911_Calls %>%
  filter(Address == "1315 Ne Campus Pkwy") %>%
  filter(Type != "Trans to AMR") %>%
  filter(Type != "Medic Response") %>%
  filter(Type != "Hazardous Mat, Spill-Leak") %>%
  filter(Type != "Automatic Fire Alarm False") %>%
  filter(Type != "Trans to AMR") %>%
  filter(Type != "Electrical Problem")

# output dataset
write.csv(alder, file = "data/Alder_fire_alarm_data.csv")