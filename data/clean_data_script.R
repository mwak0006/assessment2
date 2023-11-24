library(tidyverse)
df <- read.csv("data/dataset_world_bank.csv")

df_filtered <- df %>%
  filter(Time > 1999 & Time < 2021 & Country.Name != "Greece") %>%
  select(-Time.Code, -OECD) %>%
  rename(
    Year = Time,
    Country_Name = Country.Name,
    Country_Code = Country.Code,
    LifeExp_Female = Life.expectancy.at.birth..female..years.,
    LifeExp_Male = Life.expectancy.at.birth..male..years.,
    LifeExp_Total = Life.expectancy.at.birth..total..years.,
    GNIPerCapita = GNI.per.capita..Atlas.method..current.US..,
    GNI = GNI..Atlas.method..current.US..,
    Mortality_U5_Total = Mortality.rate..under.5..per.1.000.live.births.,
    Mortality_U5_Female = Mortality.rate..under.5..female..per.1.000.live.births.,
    Mortality_U5_Male = Mortality.rate..under.5..male..per.1.000.live.births.,
    HealthExp_percent_GDP = Current.health.expenditure....of.GDP.
  ) %>%
  mutate(
    LifeExp_Female = as.numeric(LifeExp_Female),
    LifeExp_Male = as.numeric(LifeExp_Male),
    LifeExp_Total = as.numeric(LifeExp_Total),
    GNIPerCapita = as.numeric(GNIPerCapita),
    GNI = as.numeric(GNI),
    Mortality_U5_Total = as.numeric(Mortality_U5_Total),
    Mortality_U5_Female = as.numeric(Mortality_U5_Female),
    Mortality_U5_Male = as.numeric(Mortality_U5_Male),
    HealthExp_percent_GDP = as.numeric(HealthExp_percent_GDP)
  )

# Write the cleaned data to a CSV file
write.csv(df_filtered, "data/cleaned_data.csv", row.names = FALSE)


