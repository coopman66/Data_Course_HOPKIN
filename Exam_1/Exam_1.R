library(tidyverse)

# read csv file into dataframe
df <- read.csv(file = "cleaned_covid_data.csv")

#Subset the data set to just show states that begin with “A”
A_states <- df %>%
  filter(grepl("[A_]", Province_State))

#Create a plot of that subset showing Deaths over time, with a separate facet for each state.
A_states %>% 
  ggplot(aes(x=as.Date(Last_Update),y=Deaths, color=Province_State)) +
  geom_point() +
  geom_smooth(method=loess) +
  facet_wrap(.~Province_State, ncol=2, scales = "free")

# Find the “peak” of Case_Fatality_Ratio for each state and save this as a new 
# data frame object called state_max_fatality_rate.
state_max_fatality_rate <- df %>% 
  group_by(Province_State) %>% 
  summarise(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm=TRUE)) %>% 
  arrange(desc(Maximum_Fatality_Ratio))

# Use that new data frame from task IV to create another plot
state_max_fatality_rate %>% 
  mutate(Province_State = as_factor(Province_State)) %>% 
  ggplot(aes(x=Province_State, y=Maximum_Fatality_Ratio)) + 
  geom_col() + 
  theme_minimal()+
  theme(axis.text.x = element_text(angle=90))

# Using the FULL data set, plot cumulative deaths for the entire US over time
df %>% 
  group_by(Last_Update) %>% 
  summarise(totalDeaths=sum(Deaths)) %>% 
  ggplot(aes(x=Last_Update,y=totalDeaths, group=1)) +
  geom_line() +
  geom_point()








