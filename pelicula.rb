class Pelicula
  attr_accessor :name, :gender, :year, :duration, :rating, :link
  
  def initialize(name, gender, year='SF', duration, rating, link)
    @name = name
    @gender = gender
    @year = year
    @duration = duration
    @rating = rating
    @link = link
  end

  def save
    if File::exist?("peliculas.csv")
      file = File.open('peliculas.csv') 
    else 
      file = File.new('peliculas.csv')
    file.write(string_csv, mode:"a")
  
    file.close
  end

  def string_csv
    return @name + ',' + @gender + ',' + @year + ',' + @duration + ',' + @rating + ',' + @link
  end
end