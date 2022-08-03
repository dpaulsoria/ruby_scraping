class Actor 
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def save
        # puts "Validating: #{@name} #{not self::validate_if_exists()}"
        # puts not self::validate_if_exists()
        if !self::validate_if_exists()
            File.open("actores.csv", "a") do |file|
                file.write("#{@name}\n")
            end
        end
    end

    def validate_if_exists()
        File.open("actores.csv", "r") do |file|
            # puts "Opening actores.csv to validate this name : #{@name}"
            counter = 0
            for line in file.readlines()
                line = line.strip.chomp("\n")
                # puts ">     Validating line ##{counter}"
                # puts ">    > Content: #{line}"
                # puts ">    > > #{line == @name}"
                if line == @name
                    return true
                end
            end
        end
        return false
    end

end