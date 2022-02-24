library(tidyverse)

#2-15-2022
# ?pivot_wider
# table2 %>% #variable is in your rows
#   pivot_wider(id_cols = c(country, year),  #Unique columns (identifiers)
#               names_from = type,          #which column to split?
#               values_from = count)        #where to find values to fill
# 
# table3 %>%
#   separate(rate,                          #which column to separate
#            into = c("cases","population"), #new names for columns
#            convert = TRUE)                 #converts to Integer
# 
# x <- table4a %>%
#   pivot_longer(cols = -country,
#                names_to = "year",
#                values_to = "population")
# 
# y <-table4b %>%
#   pivot_longer(-country,
#                names_to = "year",
#                values_to = "population")
# 
# full_join(x,y)
# 
# table5 %>%
#   separate(rate, into = c("cases", "population")) %>%
#   unite(col = "year", #new name for column
#         sep = "", #what to separate values by
#         century, year) %>%  #names of columns to paste together
#   mutate(year = as.numeric(year), #changing columns to appropriate types
#          cases = as.numeric(cases),
#          population = as.numeric(population))
# 
# df <- read.csv("./Data/Bird_Measurements.csv")
# #gender, family, spp, clutch size, egg mass, mating sys, mass, bill, wing
# 
# male <- df %>% 
#   select(-ends_with("_N")) %>%
#   select(starts_with("M_"),
#          Family, Species_number, Species_name, English_name,
#          Clutch_size, Egg_mass, Mating_System) %>% 
#   mutate(Gender="Male")
# 
# names(male) <- str_remove_all(names(male),"M_")
# 
# female <- df %>% 
#   select(-ends_with("_N")) %>%
#   select(starts_with("F_"),
#          Family, Species_number, Species_name, English_name,
#          Clutch_size, Egg_mass, Mating_System) %>% 
#   mutate(Gender="Female")
# 
# names(female) <- str_remove_all(names(female),"F_")
# 
# unsexed <- df %>% 
#   select(-ends_with("_N")) %>%
#   select(starts_with("U_"),
#          Family, Species_number, Species_name, English_name,
#          Clutch_size, Egg_mass, Mating_System) %>% 
#   mutate(Gender="Unsexed")
# 
# names(unsexed) <- str_remove_all(names(unsexed),"U_")

#2/22/22
#predictor variable is the "Separator" (like species in penguin)
#response variable is whatever changes (like height based on species)
# library(palmerpenguins)
# mod1 <- glm(data = penguins,
#             formula = bill_length_mm ~ species)
# 
# library(modlr)
# library(easystats)
# 
# mod1 %>% 
#   summary()
# # Deviance Residuals are the difference b/w predicted and actual
# # Coefficients- Intercept is whatever the first level of the predictor is
# #   other coefficients are whatever the difference from the base (intercept) is
# 
# penguins %>% names
# 
# mod2 <- glm(data = penguins,
#             formula = bill_length_mm ~ species + island + bill_depth_mm + sex + 
#               year + body_mass_g + flipper_length_mm)
# summary(mod2)
# add_predictions(penguins, mod2)
# 
# mod3 <- glm(data = penguins,
#             formula = bill_length_mm ~ species + bill_depth_mm + sex + 
#               body_mass_g + flipper_length_mm)
# # AIC/BIC is essentially simplicity of formula
# # R2 is how much of an improvement there is over just using average
# # RMSE is average error
# performance(mod1)
# performance(mod2)
# performance(mod3)
