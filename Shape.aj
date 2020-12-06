public privileged aspect Aspect {
	declare parents: Circle implements Shape; //Q4 Shape as a parent interface for Circle
	declare parents: Rectangle implements Shape; //Q4 Shape as a parent interface for Rectangle

	//Q4 To implement getName() method, the Circle object returns Circle.
	public String Circle.getName() {
		return "Circle";
	}
	//Q4 To implement getName() method, the Rectangle object returns Rectangle.
	public String Rectangle.getName() {
		return "Rectangle";
	}

//----------------------------------------------------------------------------------------------------

	//Q5 Using aspects, override the toString() method in Circle.
	//The toString() methods call the getName() in 4.2.1 and generates a string, representing the object.
	public String Circle.toString() {
		return getName() + "(" + (int) this.radius + ")"; //Example A Circle with a radius of 2 is represented as the string Circle(2).
	}

	//Q5 Using aspects, override the toString() method in Rectangle.
	//The toString() methods call the getName() in 4.2.1 and generates a string, representing the object.
	public String Rectangle.toString() {
		return getName() + "(" + (int) this.height + ", " + (int) this.width + ")"; //A Rectangle with a width of 2 and a height of 10 is represented as Rectangle(2,10).
	}

	//----------------------------------------------------------------------------------------------------

	//Q6 The logic for calculating the area of the circle has not been implemented (as it currently
	//throws a RuntimeException). Using aspects, implement it.
	double around(Circle c) : execution (* Circle.getArea()) && this(c) {
		if (c.radius < 0) 
			return 0.;
		return Math.PI*Math.pow(c.radius, 2);
	}

	//----------------------------------------------------------------------------------------------------	

	//Q7 Using aspects, make sure passing a negative value to a radius of a Circle 
	//results in 0 value for the value of the area and the perimeter. 
	
	double around(Circle c) : execution(double Circle.get*()) && this(c) {
		if (c.radius < 0) 
			return 0.;
		return proceed(c);
	}	
	
	//Q7 Using aspects, make sure passing a negative value to a radius of a Rectangle 
	//with width or height of a Rectangle results in 0 value for the value of the area and the perimeter.
	double around(Rectangle r) : execution(double Rectangle.get*()) && this(r) {
		if (r.width < 0 || r.height < 0)
			return 0.;
		return proceed(r);
	}

	//----------------------------------------------------------------------------------------------------

	//Q8 Using aspects, implement the getId() method for both shapes.
	private static int ShapeID; //***Static legit?

	//getID()
	public int Shape.getId() {
		return ShapeID;
	}

	//Using pointcuts for execution of new Shape objects
	after() : execution(Shape+.new(..)) && this(Shape+) {
		ShapeID++;
	}	
}
