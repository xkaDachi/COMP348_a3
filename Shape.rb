//#{self.class.name}; etc.
//#{self.perimeter}
//#{self.area}


#Question 1
class Shape  
    attr_accessor :name, :perimeter, :area

    def initialize()
        #puts "Creating a shape" #for testing
        @name = "Shape"
        @perimeter = 0
        @area = 0
    end

    def print()
        puts "#{self.class.name}, perimeter: #{self.perimeter}, area: #{self.area}"
    end

    def perimeter()
        return "undefined"
    end
    
    def area()
        return "undefined"
    end
end

class Circle < Shape
    include Math
    attr_accessor :radius

    def initialize(radius)
        super()
        @name = "Circle"
        @radius = radius
        @perimeter = self.perimeter()
        @area = self.area()
    end

    def perimeter()
        return 2 * @radius * Math::PI 
    end

    def area()
        return @radius * @radius * Math::PI 
    end
end

class Rectangle < Shape
    attr_accessor :height, :width
    
    def initialize(height, width)
        super()
        @name = "Rectangle"
        @height = height
        @width = width
        @perimeter = self.perimeter()
        @area = self.area()
    end

    def perimeter()
        return (2 * @height) + (2 * @width)
    end

    def area()
        return @height * @width
    end
end

class Ellipse < Shape
    attr_accessor :semiMajor, :semiMinor, :eccentricity
    
    def initialize(semiMajor, semiMinor)
        super()
        @name = "Ellipse"
        @semiMajor = semiMajor
        @semiMinor = semiMinor
        @perimeter = "undefined"
        @area = area()
        @eccentricity = eccentricity()
    end

    def perimeter()
        return "undefined"
    end

    def area()
        return Math::PI * semiMajor * semiMinor
    end

    def eccentricity() 
        return Math.sqrt((semiMajor*semiMajor - semiMinor*semiMinor).abs)
    end

    def print()
        puts "#@name, perimeter: #@perimeter, area: #@area" #, eccentricity: #@eccentricity"
    end
end

# s1 = Shape.new()
# s1.print()

# c1 = Circle.new(5)
# c1.print()

# r1 = Rectangle.new(4, 5)
# r1.print()

# e1 = Ellipse.new(5, 4)
# e1.print()

#-----------------------------------------------------------------------------------------------
#Question 2 and Question 3

shapeHash = {"Shape(s): " => 0,
            "Rectangle(s): " => 0,
            "Circle(s): " => 0,
            "Ellipse(s): " => 0}

aFile = File.open("info.txt") do |line|
    line.each do |item|
        name, c1, c2 = item.chomp.split(' ')

        if (name == "shape")
            shapeInfo = Shape.new()
            shapeInfo.print
            shapeHash["Shape(s): "]+=1
        end

        if (name == "rectangle")
            if c1.to_i >= 0 and c2.to_i >= 0
                shapeInfo = Rectangle.new(c1.to_i, c2.to_i)
                shapeInfo.print
                shapeHash["Shape(s): "]+=1
                shapeHash["Rectangle(s): "]+=1
            else
                puts "Error: Invalid Rectangle"
            end
        end

        if (name == "circle")
            if c1.to_i >= 0
                shapeInfo = Circle.new(c1.to_i)
                shapeInfo.print
                shapeHash["Shape(s): "]+=1
                shapeHash["Circle(s): "]+=1
            else
                puts "Error: Invalid Circle"
            end
        end

        if (name == "ellipse")
            if c1.to_i >= 0 and c2.to_i >= 0
                shapeInfo = Ellipse.new(c1.to_i, c2.to_i)
                shapeInfo.print
                shapeHash["Shape(s): "]+=1  
                shapeHash["Ellipse(s): "]+=1           
            else
                puts "Error: Invalid Ellipse"
            end
        end
    end
end

puts "\nStatistics"
shapeHash.each do |key, value|
    puts "  " + key + value.to_s
end
