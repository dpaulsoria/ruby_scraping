class Pelicula
  attr_accessor :name, :gender, :year, :duration, :rating, :link
  
  def initialize(name, gender, year='SF', duration, rating, link)
    @name = name
    @gender = self::prettier(gender)
    @year = year
    @duration = duration
    @rating = rating
    @link = link
  end

  def save
    File.open("peliculas.csv", "a") do |line|
      line.write("#{self::string_csv()}\n")
    end
  end

  def string_csv
    "#{@name},#{@gender},#{@year},#{@duration},#{@rating},#{@link}"
  end

  def prettier(string)
    string = string.strip.split
    original_size = string.size
    result_array = Array.new(original_size-1)
    counter = 0
    for i in 1..original_size-1
      tmp = string[i].strip.chomp(",")
      result_array[counter] = tmp
      counter += 1
    end
    return result_array.join('/')
  end
end