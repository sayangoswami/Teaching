---
customTheme: custom1
highlightTheme: atom-one-light
---


# Midterm review

---

## Format

- Mostly *multiple choice* and some fill-in the blanks.
- 70 minutes (please be in class on time)
- 30 questions
- Choose *a single best answer* unless otherwise specified



---

**1. Given the following `Computer` class:**

```java
public class Computer {
    String model;
    int ram;

    public Computer(String model, int ram) {
        this.model = model;
        this.ram = ram;
    }
}
```

**Which code snippet, when placed in a `main` method, will fail to compile?**

A)  `Computer c1 = new Computer("Spectre", 16);`         
B)  `Computer c2 = new Computer();`      
C)  `System.out.println("New computer created.");`     
D)  `Computer c3 = null;` 



---

**2. What is the output of the following program?**

```java
class Vehicle {
    public Vehicle() {
        System.out.print("Vehicle ");
    }
}
class Car extends Vehicle {
    public Car() {
        System.out.print("Car ");
    }
}
public class TestDrive {
    public static void main(String[] args) {
        new Car();
    }
}
```
A)  `Car`        
B)  `Vehicle`     
C)  `Car Vehicle`     
D)  `Vehicle Car`  



---

**3. What is the output of the following program?**

```java
class Counter {
    public static int count = 0;
    public Counter() {
        count++;
    }
}
public class App {
    public static void main(String[] args) {
        Counter c1 = new Counter();
        Counter c2 = new Counter();
        Counter c3 = new Counter();
        System.out.println(Counter.count);
    }
}
```
A)  `0`        
B)  `1`     
C)  `3`     
D)  The code fails to compile.  



---

**4. What is the output of the following program?**

```java
class Animal {
    public void makeSound() {
        System.out.println("Generic Sound");
    }
}
class Dog extends Animal {
    @Override
    public void makeSound() {
        System.out.println("Woof");
    }
}
public class Main {
    public static void main(String[] args) {
        Animal myPet = new Dog();
        myPet.makeSound();
    }
}
```

A)  `Generic Sound`        
B)  `Woof`     
C)  The code fails to compile.     
D)  An exception is thrown at runtime.  



---

**5. Given the following class definition:**

```java
public class Employee {
    private String name;
    public int employeeId;

    public Employee(String name, int iD)  {
        this.name = name;
        this.employeeId = id;
    }
    public String getName() {
        return name;
    }
}
```

**Which line of code, if located in another class, will cause a compilation error?**

A)  `Employee emp = new Employee("John", 101);`        
B)  `System.out.println(emp.employeeID) ;`     
C)  `System.out.println(emp.getName());`     
D)  `System.out.println(emp.name);`  



---

**6. What is the output of the following code?**

```java
class Plant {
    String type = "Generic";
}
class Flower extends Plant {
    String type = "Rose";
    public void printType() {
        System.out.print(type + " ");
        System.out.print(super.type);
    }
}
public class Garden {
    public static void main(String[] args) {
	    Plant f = new Flower();
        f.printType();
    }
}
```
A) `Rose Generic`      
B) `Generic Rose`   
C) `Rose Rose`   
D) The code fails to compile because `super.type` is invalid.



---

**7. What is the result of attempting to compile and run the following code?**

```java
class Box {
    private int size;
    public Box(int size) {
        this.size = size;
    }
}
class Widget extends Box {
    // Missing constructor
}
public class Factory {
    public static void main(String[] args) {
        Widget w = new Widget();
    }
}
```
A) The code compiles and runs successfully.   
B) A NullPointerException is thrown at runtime.   
C) The code fails to compile because of an error in the Widget class.   
D) The code fails to compile because of an error in the Factory class.



---

**8. Given the following array and loop:**

```java
class Shape {
    public void draw() { System.out.println("Drawing Shape "); }
}
class Circle extends Shape {
    @Override
    public void draw() { System.out.println("Drawing Circle "); }
}
class Square extends Shape {
    @Override
    public void draw() { System.out.println("Drawing Square "); }
}

// In a main method:
Shape[] shapes = { new Circle(), new Square(), new Shape() };
for (Shape s : shapes) {
    s.draw();
}
```

**What is the complete output?**

A) `Drawing Shape Drawing Shape Drawing Shape`   
B) `Drawing Circle Drawing Square Drawing Shape`   
C) `Drawing Shape Drawing Circle Drawing Square`   
D) The code fails to compile.



---

**9. What is the output of this program?**

```java
public class Person {
    private String name;
    public Person(String name) {
        name = name; // Note this line
    }
    public String getName() {
        return name;
    }
    public static void main(String[] args) {
        Person p = new Person("Alice");
        System.out.println(p.getName());
    }
}
```
A) `Alice`   
B) `null`   
C) The code fails to compile.   
D) An empty string is printed.



---

**10. Which statement is true about the `static` keyword in Java?**

A) A static method can directly access instance variables of the class.   
B) Each object of a class has its own copy of a static variable.   
C) A static method can be called without creating an instance of the class.   
D) The this keyword can be used inside a static method.




---

**11. What is the result of attempting to compile and run the following code?**

```java
public class Service {
    private int serviceId;

    public static void logService() {
        System.out.println("Service ID: " + serviceID) ;
    }
    public static void main(String[] args) {
        logService();
    }
}
```
A) It prints `Service ID: 0`.   
B) It throws a NullPointerException at runtime.   
C) It fails to compile.   
D) It prints `Service ID: null`.



---

**12. Which of the following statements best describes encapsulation in object-oriented programming?**

A) It allows a class to use methods and fields from a parent class.   
B) It is the mechanism for creating a new class from an existing class.   
C) It bundles the data (fields) and methods that operate on the data into a single unit, hiding the internal state from the outside.   
D) It allows a method to have different implementations depending on the object it is called on.



---

**13. What is the output of the following program?**

```java
public class Account {
    private double balance;

    public Account(double startBalance) {
        this.balance = startBalance;
    }

    public void setBalance(double newBalance) {
        if (newBalance >= 0) {
            this.balance = newBalance;
        }
    }

    public double getBalance() {
        return balance;
    }

    public static void main(String[] args) {
        Account acc = new Account(100.0);
        acc.setBalance(-50.0);
        System.out.println(acc.getBalance());
    }
}
```
A) `-50.0`   
B) `50.0`   
C) `100.0`   
D) `0.0`



---

**14. What is the output of the following program?**

```java
public class TestArrays {
    public static void main(String[] args) {
        String[] words = new String[3];
        words[0] = "Java";
        words[2] = "Rocks";
        System.out.println(words[1]);
    }
}
```
A) An empty string `""` is printed.   
B) `null`   
C) A NullPointerException is thrown at runtime.   
D) The code fails to compile.


