library(tidyverse)

#2-15-2022
?pivot_wider
table2 %>% #variable is in your rows
  pivot_wider(id_cols = c(country, year),  #Unique columns (identifiers)
              names_from = type,          #which column to split?
              values_from = count)        #where to find values to fill

table3 %>%
  separate(rate,                          #which column to separate
           into = c("cases","population"), #new names for columns
           convert = TRUE)                 #converts to Integer

x <- table4a %>%
  pivot_longer(cols = -country,
               names_to = "year",
               values_to = "population")

y <-table4b %>%
  pivot_longer(-country,
               names_to = "year",
               values_to = "population")

full_join(x,y)

table5 %>%
  separate(rate, into = c("cases", "population")) %>%
  unite(col = "year", #new name for column
        sep = "", #what to separate values by
        century, year) %>%  #names of columns to paste together
  mutate(year = as.numeric(year), #changing columns to appropriate types
         cases = as.numeric(cases),
         population = as.numeric(population))

df <- read.csv("./Data/Bird_Measurements.csv")
#gender, family, spp, clutch size, egg mass, mating sys, mass, bill, wing

male <- df %>% 
  select(-ends_with("_N")) %>%
  select(starts_with("M_"),
         Family, Species_number, Species_name, English_name,
         Clutch_size, Egg_mass, Mating_System) %>% 
  mutate(Gender="Male")

names(male) <- str_remove_all(names(male),"M_")

female <- df %>% 
  select(-ends_with("_N")) %>%
  select(starts_with("F_"),
         Family, Species_number, Species_name, English_name,
         Clutch_size, Egg_mass, Mating_System) %>% 
  mutate(Gender="Female")

names(female) <- str_remove_all(names(female),"F_")

unsexed <- df %>% 
  select(-ends_with("_N")) %>%
  select(starts_with("U_"),
         Family, Species_number, Species_name, English_name,
         Clutch_size, Egg_mass, Mating_System) %>% 
  mutate(Gender="Unsexed")

names(unsexed) <- str_remove_all(names(unsexed),"U_")




