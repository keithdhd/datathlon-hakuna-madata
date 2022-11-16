#load packages
library(tidyverse)
library(dbplyr)

#read in hospital stay data and clean to show X countries of interest
hospital_days <- read_csv("hospital_days.csv")
glimpse(hospital_days)

clean_hospital_days <- hospital_days %>%  
  select(Country, Year, Value) %>% 
  filter(Country == "United Kingdom" | Country == "Netherlands" | Country == "Finland" | Country == "Denmark" | Country == "Iceland")

view(clean_hospital_days)

#plot hospital stay duration by country over time
plot_compare <- clean_hospital_days %>% 
  ggplot(aes(Year, Value, color = Country)) +
  geom_point() +
  geom_line()

plot_compare

#read in alcohol consumption data and clean to show X countries of interest
alcohol_consumption_raw <- read_csv("alc_consumption.csv")

clean_alcohol_consumption <- alcohol_consumption_raw %>% 
  select(Country, Year, Value, Measure) %>% 
  filter(Country == "United Kingdom" | Country == "Netherlands" | Country == "Finland" | Country == "Denmark" | Country == "Iceland") %>% 
  filter(Measure == "Litres per capita (15+)")

#plot alcohol consumption by country over time
plot_consumption <- clean_alcohol_consumption %>% 
  ggplot(aes(Year, Value, color = Country)) +
  geom_point() +
  geom_line()



#next want to combine to compare both 
#why have stays dropped but consumption stabilised in some places but not others?