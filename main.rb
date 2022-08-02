puts "Mi Primer Scraper \u{1f3ac}"

require 'open-uri' # consultar a la plataforma
require 'nokogiri' # formatear, parsear a html
require 'csv' # escribir y leer csv

require './pelicula.rb'

link = 'https://ww1.cuevana3.me/peliculas-mas-valoradas'

datosHTML = URI.open(link)
datosStr = datosHTML.read
parsed_content = Nokogiri::HTML(datosStr)

# Lectura de un contenedor simple, clase Top.
titulo = parsed_content.css('.Top').inner_text
puts titulo

# Lectura de un contenedor compuesto, clase MovieList
contenedorPeliculas = parsed_content.css('.MovieList')
# puts contenedorPeliculas

contador = 1
contenedorPeliculas.css('.TPost').each do |post|
  # puts(contador, post)
  puts '------------------------------------------------------'
  
  year = post.css('.Year').inner_text
  puts 'Year: ' + year
  title = post.css('.Title').inner_text
  puts 'Title: ' + title
  img = post.css('.Image img').attr('data-src')
  puts 'IMG Link: ' + img
  # puts post.at_css('.Objf img').attr('data-src')
  link = post.css('a')
  puts('link: ' + link.attr('href'))
  rating = post.css('.Vote').inner_text
  puts 'Rating: ' + rating
  director = post.css('.Director').inner_text
  puts director
  gender = post.css('.Genre').inner_text
  puts gender
  duration = post.css('.Time').inner_text
  puts 'Time: ' + duration

  pelicula = Pelicula.new(title, gender, year, duration, rating, link)

  puts pelicula.string_csv()
  
  contador += 1
end

CSV.open('prueba.csv', 'ab') do |csv|
  csv << %w[hola esto es una prueba]
end

puts "He finalizado el taller \u{1f60e}"  # Comentarlo mientras no lo finalice
