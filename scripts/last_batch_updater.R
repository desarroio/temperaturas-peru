# Make sure to replace the last_batch.csv file with the one having data from 2023-11-01 on
# Run this script
library(readr)
library(dplyr)

last_batch <- read_csv(
    "data/raw/last_batch.csv",
    col_types = cols(
        DATE = col_date(format = "%Y-%m-%d"))) |>
    filter(
        STATION != "BR000469001") |>
    filter(
        STATION != "BL000085230")

city_recoder <- setNames(
    c("Iquitos",     "Tarapoto",     "Arequipa",       "Tumbes",
      "Piura",       "Chiclayo",     "Cajamarca",      "Trujillo", 
      "Pucallpa",    "Tingo María",  "Lima - Callao",  "Puerto Maldonado", 
      "Ayacucho",    "Cusco",        "Pisco",          "Juliaca",
      "Tacna",       "Chachapoyas",  "Talara",         "Yurimaguas",
      "Juanjui",     "Chimbote",     "Huaraz",         "Huánuco"),
    c("PE000084377", "PE000084455",  "PE000084752",    "PEM00084370",
      "PEM00084401", "PEM00084452",  "PEM00084472",    "PEM00084501", 
      "PEM00084515", "PEM00084534",  "PEM00084628",    "PEM00084658", 
      "PEM00084673", "PEM00084686",  "PEM00084691",    "PEM00084735", 
      "PEM00084782", "PE000084444",  "PEM00084390",    "PEM00084425", 
      "PEM00084474", "PEM00084531",  "PEM00084542",    "PEM00084564"))

last_batch_noaa <- last_batch |> 
    rename_with(tolower) |> 
    mutate(city = recode(station, !!!city_recoder)) |> 
    relocate(city, prcp:tmin, station, name)

per_noaa_1947_2023 <- per_noaa_1947_2023_oct |> bind_rows(last_batch_noaa)

save(per_noaa_1947_2023, file = "data/per_noaa_1947_2023.RData")

    