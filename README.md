# Lenguajes de Programación
## Taller Ruby - Scraping

**Indicaciones:**
* Para desarrollar de forma correcta el taller es necesario que haya revisado las gemas:
  * nokogiri: https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet
  * open-uri: https://ruby-doc.org/stdlib-2.6.3/libdoc/open-uri/rdoc/OpenURI.html
  * csv: https://ruby-doc.org/stdlib-2.6.3/libdoc/csv/rdoc/CSV.html
* Una vez finalizado el taller enviar (Submit).
* La última versión debe ser enviada antes de las 13h00.


**Desarrollo:**

1. Crear en main.rb el scraper e imprimir cada valor extraído de cada película: https://ww1.cuevana3.me/peliculas-mas-valoradas

2. Crear una clase Pelicula con los atributos: nombre, género, año, duración,rating,link. Agregue a la clase Pelicula el método guardar, que sirve para registrar en peliculas.csv los 6 atributos separados por coma. Adicionalmente defina sus getters y setters. Si no posee año por defecto será SF.

3. Crear la clase Actor que define el atributo nombre y el método guardar que permite agregar un nuevo actor al archivo actores.csv. Adicionalmente, un método que permita consultar si existe el registro previamente. En el archivo actores.csv no pueden existir actores repetidos.

4. Crear la clase Director, realiza lo mismo que Actor con la única diferencia de usar el archivo directores.csv

5. Modificiar el main.rb, usar todas las clases creadas y registrar los datos en cada archivo csv.