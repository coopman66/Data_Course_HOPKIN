library(tidyverse)
library(ggplot2)
library(gganimate)
library(janitor)

dat <- read_csv("../../Data/BioLog_Plate_Data.csv")
summary(dat)
