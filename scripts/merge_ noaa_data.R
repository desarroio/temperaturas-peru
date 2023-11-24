# Desde 1947 hasta oct 23

per_noaa_1 <- read_csv(
    "data/raw/NOAA_PER_1940_1979_18_STATIONS.csv",
    col_types = cols(
        DATE = col_date(format = "%Y-%m-%d"))
    ) |>
    filter(
        STATION != "BR000469001")

per_noaa_2 <- read_csv(
    "data/raw/NOAA_PER_1980_2023_18_STATIONS.csv",
    col_types = cols(
        DATE = col_date(format = "%Y-%m-%d"),
        SNWD = col_skip())
    )

per_noaa_3 <- read_csv(
    "data/raw/NOAA_PER_1940_2023_8_STATIONS.csv",
    col_types = cols(
        DATE = col_date(format = "%Y-%m-%d"),
        SNWD = col_skip())) |>
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

per_noaa_1947_2023 <- rbind(per_noaa_1, per_noaa_2, per_noaa_3) |> 
    filter(DATE < "2023-11-01") |> 
    filter(DATE > "1946-12-21") |> 
    rename_with(tolower) |> 
    mutate(city = recode(station, !!!city_recoder)) |> 
    relocate(city, prcp:tmin, station, name)

save(per_noaa_1947_2023, file = "data/per_noaa_1947_2023.RData")

rm(per_noaa_1, per_noaa_2, per_noaa_3, city_recoder)
