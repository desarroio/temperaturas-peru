library(readr)
library(tidyverse)
library(lubridate)
library(plotly)
library(RColorBrewer)


# Read and preprocess the data
NOAA_Lima <- read_csv("data/NOAA_Lima.csv", col_types = cols(DATE = col_date(format = "%Y-%m-%d")))
df <- NOAA_Lima %>%
    rename_all(tolower) |> 
    select(-station, -name, -latitude, -longitude, -elevation, -prcp_attributes, 
           -tavg_attributes, -tmax_attributes, -tmin_attributes)

# Calculate period_mean
period_mean <- df %>%
    filter(!is.na(tavg)) %>%
    group_by(year(date)) %>%
    summarize(tyear = mean(tavg, na.rm = TRUE)) %>%
    pull(tyear) %>%
    mean(na.rm = TRUE)

# Calculate weekly averages
df_week <- df %>%
    mutate(week = week(date), 
           year = year(date)) %>%
    filter(!is.na(tavg)) %>%
    group_by(year, week) %>%
    summarize(tavg_week = mean(tavg, na.rm = TRUE)) %>%
    ungroup() %>%
    group_by(year) %>%
    mutate(tyear = mean(tavg_week, na.rm = TRUE)) %>%
    ungroup()

# Create a red-blue color palette from RColorBrewer
color_palette <- colorRampPalette(brewer.pal(11, "RdBu"))


# Map colors based on whether values are above or below the threshold
df_week$color <- ifelse(
    df_week$tyear > period_mean,
    color_palette(length(df_week$tyear))[1:length(df_week$tyear)],
    color_palette(length(df_week$tyear))[length(df_week$tyear):1]
)


# Plot with the red-blue color scale
plot_ly(df_week,
        x = ~week,
        y = ~tavg_week,
        color = ~color,
        colors = color_palette(length(df_week$tyear)),
        type = 'scatter',
        mode = 'lines') 
