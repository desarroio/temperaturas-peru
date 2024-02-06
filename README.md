# Temperaturas Perú
Ensayos con datos meteorológicos

Datos de NOAA:
Descargados para todas las 26 estaciones del Perú, desde la fecha de mayor disponibilidad. Considerar que las descargas fueron por grupos:
 - 18 estaciones con más cobertura de datos, 1980-2023
 - 18 estaciones con más cobertura de datos, 1946-1979
 - 8 estaciones con menos cobertura de datos, 1942?-2023
 
Estos tres archivos se fusionan en uno solo con las siguientes características:
 - Filtrado desde 1947-01-01 hasta 2023-10-31
 - Excluidas las estaciones de Tabatinga (BR) y Charaña (BO)
 - Guradado como RData
 
 Para añadir datos más recientes:
  - Abrir https://www.ncdc.noaa.gov/cdo-web/ 
      - Ir a Search tool
      - Seleccionar "Daily Summaries"
      - Seleccionar desde el 1ero de noviembre 2023 hasta la fecha actual
      - Buscar por país y seleccionar Perú
      - Seleccionar todas las estaciones
      - Añadir al carro y seleccionar .csv
      - No estoy seguro si hace falta seleccionar Geographic location y Data flags
      - Seleccionar metric en unidad de medida
      - Seleccionar todos los data types
      - Solicitar descarga
      - Me ha pasado que las estaciones de Tabatinga y Charaña aparecen indebidamente en la descarga
 - Guardar el archivo descargado como data/raw/last_batch.csv
 - Ejecutar scripts/last_batch_updater.R
 - Ejecutar calentamiento_peru.qmd
 
 Notas:
 - NOAA_PER_1940_1979_18_STATIONS.csv no tiene datos de snow depth (SNWD)
 - Hay demasiados missings recientes para usar los datos de precipitaciones
