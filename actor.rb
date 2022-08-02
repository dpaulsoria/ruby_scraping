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
            file.readlines().each do |line|
                tmp = line
                puts tmp.chomp('\n')
                puts "Validating: #{@name} ==  #{tmp}? "
        
                if @name == tmp
                    puts "its true"
                    return true
                end
            end
        end
        puts "its not true"
        return false
    end

end