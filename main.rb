puts "Mi Primer Scraper \u{1f3ac}"

require 'open-uri' # consultar a la plataforma
require 'nokogiri' # formatear, parsear a html
require 'csv' # escribir y leer csv

require './pelicula.rb'
require './actor.rb'
require './director.rb'

link = 'https://ww1.cuevana3.me/peliculas-mas-valoradas'

datosHTML = URI.open(link)
datosStr = datosHTML.read
parsed_content = Nokogiri::HTML(datosStr)

# Lectura de un contenedor simple, clase Top.
titulo = parsed_content.css('.Top').inner_text
puts titulo

puts 'Los datos extraídos de cada película'

# Lectura de un contenedor compuesto, clase MovieList
contenedorPeliculas = parsed_content.css('.MovieList')
# puts contenedorPeliculas

# contador = 1
contenedorPeliculas.css('.TPost').each do |post|
  # puts(contador, post)
  puts '------------------------------------------------------'

  title = post.css('.Title').css('h2').inner_html
  puts "Title: #{title}"
  gender = post.css('.Genre').inner_text
  puts gender # Gender
  year = post.css('.Year').inner_text
  puts "Year: #{year}"
  duration = post.css('.Time').inner_text
  puts "Time: #{duration}"
  rating = post.css('.Vote').inner_text
  puts "Rating: #{rating}"
  link = post.css('a').attr('href')
  puts "link: #{link}"

  # puts title

  # img = post.css('.Image img').attr('data-src')
  # puts 'IMG Link: ' + img
  # puts post.at_css('.Objf img').attr('data-src')

  def prettier(string)
    if string.nil?
      return ''
    else
      string = string.strip.split(',')
      # puts "String"
      # puts string
      tmp = string[0].split(':')
      if tmp.size == 2
        tmp = tmp[1]
        string[0] = tmp 
        # puts "Size == 2"
        # puts tmp
        original_size = string.size
        result_array = Array.new(original_size - 1)
        counter = 0
        (0..original_size - 1).each do |i|
          tmp = string[i].strip.chomp(',')
          result_array[counter] = tmp
          counter += 1
        end
        puts "Saving: #{result_array}"
        return result_array.join('/')
      end
    end
  end

  directores = post.css('.Director').inner_text
  puts directores
  tmp_directores = directores.split(':')
  
  # puts "Directores to save: #{tmp_directores}"
  if tmp_directores.size >= 2
    # puts "Inside"
    directores = prettier(directores)
    directores.split('/').each do |director|
      tmp = Director.new(director)
      tmp.save
    end
  
    
  end
  
  actores = post.css('.Actors').inner_text
  puts actores
  tmp_actores = actores.split(':')
  
  # puts "Actores to save: #{tmp_actores}"
  if tmp_actores.size >= 2
    # puts "Inside"
    actores = prettier(actores)
    actores.split('/').each do |actor|
      tmp = Actor.new(actor)
      tmp.save
    end
    
  end

  pelicula = Pelicula.new(title, gender, year, duration, rating, link)

  pelicula.save

  # Tester
  # contador += 1
  # if contador == 2
  #  break
  # end
end

# CSV.open('prueba.csv', 'ab') do |csv|
#   csv << %w[hola esto es una prueba]
# end

puts "He finalizado el taller \u{1f60e}"  # Comentarlo mientras no lo finalice
