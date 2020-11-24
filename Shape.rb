class Shape  
    attr_accessor :name, :perimeter, :area

    def initialize()
        #puts "Creating a shape" #for testing
        @name = "Shape"
        @perimeter = 0
        @area = 0
    end

    def print()
        puts "Name: #@name, Perimeter: #@perimeter, Area: #@area"
    end

    def perimeter()
        return nil
    end
    
    def area()
        return nil
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
        @perimeter = "Not implemented"
        @area = area()
        @eccentricity = eccentricity()
    end

    def area()
        return Math::PI * semiMajor * semiMinor
    end

    def eccentricity() 
        return Math.sqrt(semiMajor*semiMajor - semiMinor*semiMinor)
    end

    def print()
        puts "Name: #@name, Perimeter: #@perimeter, Area: #@area, Eccentricity: #@eccentricity"
    end
end

s1 = Shape.new()
s1.print()

c1 = Circle.new(5)
c1.print()

r1 = Rectangle.new(4, 5)
r1.print()

e1 = Ellipse.new(5, 4)
e1.print()




