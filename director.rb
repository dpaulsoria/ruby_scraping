class Director 
    attr_accessor :name

    def initialize(name)
        name = 'nil' if name.nil?
        @name = name
    end

    def save
        if !self::validate_if_exists()
            File.open("directores.csv", "a") do |file|
                file.write("#{@name}\n")
            end
        end
    end

    def validate_if_exists()
        File.open("directores.csv", "r") do |file|
            # puts "Opening directores.csv to validate this name : #{@name}"
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