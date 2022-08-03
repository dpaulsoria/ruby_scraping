class Pelicula
  attr_accessor :name, :gender, :year, :duration, :rating, :link

  def initialize(name, gender, year = 'SF', duration, rating, link)
    name = 'nil' if name.nil?
    gender = 'nil' if gender.nil?
    year = 'SF' if year.nil?
    duration = -1 if duration.nil?
    rating = -1 if rating.nil?
    link = 'nil' if link.nil?

    @name = name
    @gender = prettier(gender)
    @year = year
    @duration = duration
    @rating = rating
    @link = link
  end

  def save
    File.open('peliculas.csv', 'a') do |line|
      line.write("#{string_csv}\n")
    end
  end

  def string_csv
    "#{@name},#{@gender},#{@year},#{@duration},#{@rating},#{@link}"
  end

  def prettier(string)
    if string.nil?
      return ""
    else
      string = string.strip.split
      original_size = string.size
      size = original_size - 1
      if size >= 0
        result_array = Array.new(size)
        counter = 0
        (1..size).each do |i|
          tmp = string[i].strip.chomp(',')
          result_array[counter] = tmp
          counter += 1
        end
        return result_array.join('/')
      end
    end
  end
end
