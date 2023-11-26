# senamhi
Ensayos con datos meteorológicos

Datos de NOAA:
Descargados para todas las 26 estaciones del Perú (incluyendo Tabatinga, BR), desde la fecha de mayor disponibilidad. Considerar que las descargas fueron por grupos:
 - 18 estaciones con más cobertura de datos, 1980-2023
 - 18 estaciones con más cobertura de datos, 1946-1979
 - 8 estaciones con menos cobertura de datos, 1942?-2023
 
Estos tres archivos se fusionan en uno solo con las siguientes características:
 - Filtrado desde 1947-01-01 hasta 2023-10-31
 - Excluidas las estaciones de Tabatinga (BR) y Charaña (BO)
 - Guradado como RData
 
 Para añadir datos más receientes, descargar de noviembre en adelante, para todas las estaciones menos Tabatinga y Charaña
 
 
 Notas:
 - NOAA_PER_1940_1979_18_STATIONS.csv no tiene datos de snow depth (SNWD)
 - Hay demasiados missings recientes para usar los datos de precipitaciones
 - Los heat stripes en ciudades de la costa no sirven porque hay muchos missings, y el FEN introduce distrosiones