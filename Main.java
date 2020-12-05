public class Main {
	public static void main(String[] args) {
		try {
			Shape s;
			s = (Shape) new Rectangle(2, 10);
			System.out.println("The area of " + s + " is " + s.getArea());
			s = (Shape) new Rectangle(-2, 10);
			System.out.println("The perimeter of " + s + " is " + s.getPerimeter());
			s = (Shape) new Circle(-2);
			System.out.println("The perimeter of " + s + " is " + s.getPerimeter());
			s = (Shape) new Circle(2);
			System.out.println("The area of " + s + " is " + s.getArea());
			// Uncomment the following (required by 4.3.5)
			System.out.println("The last shape ID: " + s.getId());
		}
		catch(Exception e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
}