class Director 
    attr_accessor :name

    def initialize(name)
        @name = name
    end

    def save
        if !self::validate_if_exists()
            File.open("directores.csv", "a") do |line|
                line.write("#{@name}\n")
            end
        end
    end

    def validate_if_exists()
        File.open("directores.csv", "r") do |line|
            if @name == line
                return true
            end
        end

        return false
    end

end