<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female
comment: Polymorphism

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&display=swap
link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&display=swap
import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md
link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css
import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md
import: https://raw.githubusercontent.com/liaScript/mermaid_template/master/README.md

-->

# Inheritance and Polymorphism

## The "Is-A" Relationship in Code

In our previous lesson on Inheritance, we established that a `Dog` **is-a** `Animal` and a `Circle` **is-a** `Shape`. Java enforces this relationship through variable assignments.

>**The Rule:** A reference variable of a superclass type can point to an object of any of its subclass types.

    {{1}}
    ***

**Example: The Shape Hierarchy**

Consider a base class `Shape` and its subclass `Circle`.

```java
public class Shape {
    public void draw() {
        System.out.println("Drawing a generic shape");
    }
}

public class Circle extends Shape {
    public void draw() {
        System.out.println("Drawing a circle");
    }

    public double getRadius() {
        return 5.0;
    }
}
```

    ***

    {{2}}
    ***

We can now do this:

```java
Shape s = new Circle(); // Legal! A Circle "is-a" Shape.
```
    ***

## Why is this important? (The "Box" Analogy)

If we have a `Shape` reference variable, it acts like a box labeled "Shape." We can put a `Circle`, a `Square`, or a `Triangle` inside that box because they all "fit" the definition of a Shape.

    {{1}}
    ***
**Use Case: Heterogeneous Collections**

This allows us to store different types of objects in a single array or list, as long as they share a common ancestor.

```java
ArrayList<Shape> drawingBoard = new ArrayList<>();

drawingBoard.add(new Circle());
drawingBoard.add(new Square());
drawingBoard.add(new Triangle());

// We can process them all as "Shapes" without knowing their specific type
for (Shape s : drawingBoard) {
    s.draw(); // Every shape knows how to draw itself!
}
```
    ***

## The "View" Restriction

When you use a superclass reference, you are looking at the object through a "limited lens." You can only see the methods that were defined in the superclass.

```java
Shape s = new Circle();

s.draw();      // Works! draw() is defined in Shape.
s.getRadius(); // ERROR! Even though the object IS a Circle, 
               // the variable 's' only knows it is a Shape.
```

## The `instanceof` Operator

Since a `Shape` variable could be holding a `Circle`, a `Square`, or even just a generic `Shape`, we need a way to check what is actually inside the "box" before we try to use specific features.

The `instanceof` operator returns `true` if the object is an instance of a specific class.

    {{1}}
    ***

**Example: Identifying Specific Shapes**

```java
for (Shape s : drawingBoard) {
    s.draw(); // Everyone does this

    if (s instanceof Circle) {
        // We check if it's a circle before calling circle-specific logic
        Circle c = (Circle) s; 
        System.out.println("This circle has radius: " + c.getRadius());
    }
}
```
    ***

## Summary of Concepts

1. **Flexibility:** You can write methods that accept a `Shape` parameter, and that method will automatically work for `Circles`, `Squares`, and any future shapes you invent.

2. **Type Safety:** `instanceof` allows you to verify the specific type before performing a "Downcast" (treating a Shape like a Circle).

3. **Foundation for `Object`:** This explains why an `Object` variable can hold anything—because `Object` is the ultimate superclass of every class we will ever write.


## The Universal Superclass: `java.lang.Object`

In Java, inheritance is not optional. Every class you create is part of a giant tree, and at the very top of that tree sits the `Object` class.

- **Implicit Inheritance:** If you don't use the `extends` keyword, Java automatically makes your class extend `Object`.

    - `public class Student {}` is actually `public class Student extends Object {}`.

- **The Hub of Polymorphism:** Because every class is an `Object`, an `Object` reference variable can hold an instance of _any_ class.
  - `Object myThing = new Student(); // This is valid as we saw earlier!`


## The `toString()` Method

The purpose of `toString()` is to provide a human-readable "textual representation" of an object.

**The Default Behavior**

If you don't override it, `Object.toString()` returns: `ClassName@MemoryAddressInHex` (e.g., `Student@1a2b3c`). This is rarely useful for students or developers.

    {{1}}

To override the `toString()` method, you need to define a public method in your class with the exact signature: `public String toString()`.

    {{2}}
    ***

- Declare the method within your class, using the `@Override` annotation for clarity and to ensure a compile-time check that you are indeed overriding a superclass method.
- Implement the logic inside the method to return a string that includes the desired attributes (fields) of the object in a clear format (e.g., key-value pairs).
- Return the custom string from the method.

    ***

    {{3}}
    ***

**Example:**

```java
public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }

    // Other methods, such as getters and setters...

    @Override
    public String toString() {
        return "Person [name=" + name + ", age=" + age + "]";
    }

    public static void main(String[] args) {
        Person person = new Person("John Doe", 30);
        System.out.println(person); // Automatically calls the overridden toString()
    }
}
```
    ***
  

## Use Case: Debugging and Logging

Without a proper `toString()`, finding bugs in a list of objects is difficult.

- **Scenario:** You are managing a list of `Product` objects in an e-commerce app.

- **Without Override:** Printing the list shows `[Product@6d06, Product@4e2a]`.

- **With Override:** Printing shows `[Product(id=101, name="Laptop"), Product(id=102, name="Mouse")]`.

- **Implementation Tip:** Always include the most important identifying fields (like IDs or names) in the return string.


## The `equals(Object obj)` Method

The `equals()` method is used to define "Logical Equality" rather than "Identity Equality."

    {{1}}
    ***

**Example:**
```java
public class Person {
    private final String name;
    private final int id;

    public Person(String name, int id) {
        this.name = name;
        this.id = id;
    }

    @Override
    public boolean equals(Object obj) {
        // 1. Identity check (performance optimization and reflexivity)
        if (this == obj) {
            return true;
        }

        // 2. Null check and type check (using instanceof or getClass())
        if (!(obj instanceof Person)) {
            return false;
        }

        // 3. Cast the object to the correct type (safe after instanceof check)
        Person other = (Person) obj;

        // 4. Compare significant fields
        // For object fields, use .equals()
        // For primitive fields, use ==
        return this.id == other.id && this.name.equals(other.name);
    }
    
    // ... other methods, getters, and the required hashCode() override ...
}

```
    ***

### `==` vs `.equals()`

- **`==` (Identity):** Checks if two references point to the exact same memory address.

- **`.equals()` (Logic):** Checks if the data inside two different objects is effectively the same.




### Use Case: Data Validation and Deduplication

- **Scenario:** A library system. Two `Book` objects are created:

    - `Book a` (Title: "Java 101", ISBN: "12345")

    - `Book b` (Title: "Java 101", ISBN: "12345")

- **The Problem:** `a == b` is `false` because they are separate instances in memory. However, in a library, these represent the same title.

- **The Solution:** Overriding `equals()` to compare the `ISBN` field allows `a.equals(b)` to return `true`. This prevents the library from accidentally listing the same book twice in a search result.


## Why This Matters

1. **Inheritance:** You inherit `equals` and `toString` from `Object`.

2. **Overriding:** You redefine them to make them useful for your specific class.

## Quick Code Example

```java
public class Point {
    private int x, y;

    public Point(int x, int y) {
        this.x = x;
        this.y = y;
    }

    @Override
    public String toString() {
        return "Point(" + x + ", " + y + ")";
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true; // Identity check
        if (!(obj instanceof Point)) return false; // Type check
        Point other = (Point) obj; // Cast
        return this.x == other.x && this.y == other.y; // Field check
    }
}
```

## What is Polymorphism?

**Definition:**

- From Greek: "poly" (many) and "morph" (forms).

- In Java, polymorphism allows objects of different classes to be treated as objects of a common superclass.

- It's a core concept of Object-Oriented Programming (OOP) that enables flexibility and extensibility.


**Key Idea:**

- A single interface can represent different underlying forms/types.



## Two Main Types of Polymorphism

**Compile-Time Polymorphism (Method Overloading)**

- **Definition:** Multiple methods in the same class have the same name but different parameter lists (different number, type, or order of arguments).

- **Resolution:** Decided at compile time based on the method signature.

- **Example:**

```java
class Calculator {
    static int add(int a, int b) { return a + b; }
    static double add(double a, double b) { return a + b; }
    static int add(int a, int b, int c) { return a + b + c; }
}
```



## Two Main Types of Polymorphism

**Runtime Polymorphism (Method Overriding)**

- **Definition:** A subclass provides a specific implementation for a method that is already defined in its superclass.

- **Requirements:**

    - Methods must have the exact same signature (name, parameters).
    - Methods must have compatible return types.
    - Access modifier in the subclass cannot be more restrictive.
    - Only applies to inherited instance methods.

- **Resolution:** Decided at runtime based on the actual object type, not the reference type.

- **Annotation:** Use `@Override` for clarity and compile-time checks.



## Runtime Polymorphism Example

Consider a `Shape` superclass and `Circle`, `Rectangle` subclasses.

```java
class Shape {
    void draw() {
        System.out.println("Drawing a generic shape");
    }
}

class Circle extends Shape {
    @Override
    void draw() {
        System.out.println("Drawing a Circle");
    }
}

class Rectangle extends Shape {
    @Override
    void draw() {
        System.out.println("Drawing a Rectangle");
    }
}
```

Now, let's see it in action...


## Runtime Polymorphism - The Magic



```java
public class DemoShapes {
    public static void main(String[] args) {
        Shape s1 = new Circle();     // Shape reference, Circle object
        Shape s2 = new Rectangle();  // Shape reference, Rectangle object
        Shape s3 = new Shape();      // Shape reference, Shape object

        s1.draw(); // Calls Circle's draw()
        s2.draw(); // Calls Rectangle's draw()
        s3.draw(); // Calls Shape's draw()
    }
}
```


**Output:**

```txt
Drawing a Circle
Drawing a Rectangle
Drawing a generic shape
```

**Explanation:** Even though `s1`, `s2`, and `s3` are all declared as `Shape` references, the correct `draw()` method is called based on the _actual object type_ they refer to at runtime.

This is called ***Dynamic Dispatch***.




### Why Runtime Polymorphism is a Game-Changer

On the surface, polymorphism can look like an overly academic concept. But in reality, it is one of the most powerful tools we have for writing clean, flexible, and maintainable software. It solves a very common and painful problem.

Let's explore this by first looking at a world _without_ polymorphism and then seeing how it saves us.


### The Problem: The Rigid `if-else` Chain

Imagine you're building a video game. You have different types of characters, and each one attacks differently.

```java
// Our character classes
class Mage {
    public void castFireball() { 
	    System.out.println("Mage casts a fireball!"); 
	}
}

class Warrior {
    public void swingSword() { 
	    System.out.println("Warrior swings a mighty sword!"); 
	}
}

class Archer {
    public void shootArrow() { 
	    System.out.println("Archer shoots a flaming arrow!"); 
	}
}
```


    {{1}}
    ***
Now, let's say we have a list of all the characters currently in a battle, and we want to make them all perform their attack.

Without polymorphism, your code might look like this:

```java
// An array holding different types of objects
Object[] characters = { 
	new Mage(), new Warrior(), new Archer(), new Warrior() 
};

// The main game loop that processes attacks
for (Object character : characters) {
    if (character instanceof Mage) {
        Mage mage = (Mage) character; // We have to cast it to the right type
        mage.castFireball();
    } else if (character instanceof Warrior) {
        Warrior warrior = (Warrior) character;
        warrior.swingSword();
    } else if (character instanceof Archer) {
        Archer archer = (Archer) character;
        archer.shootArrow();
    }
}
```
    ***


    {{2}}
    ***

**What's wrong with this code?**

1. **It's Brittle and Hard to Maintain:** What happens when we add a new character, like a `Thief`? We have to go back to this exact spot in the code (and any other place like it) and add another `else if` block. Forgetting one will create a bug. This is a maintenance nightmare.
2. **It Violates the Open/Closed Principle:** A core principle of good design is that your code should be **open for extension** (you can add new character types) but **closed for modification** (you shouldn't have to change existing, working code like the game loop). This code fails that test completely.
3. **The Code is Not Scalable:** Imagine 50 character types. This `if-else` block would be enormous, slow, and impossible to read.
4. This approach forces the _game loop_ to know about every single type of character. The logic is centralized and rigid.

    ***

### The Solution: Polymorphism and Dynamic Dispatch

Now, let's redesign this using inheritance and polymorphism. We'll create a common "contract" or superclass.

    {{1}}
    ***

**Step 1: Create a Common Superclass**

We'll create a `Character` class with a single method, `attack()`.

```java
class Character {
    public void attack() {
	    // some generic attck method
    }
}
```

    ***


    {{2}}
    ***

**Step 2: Subclasses Implement the `attack()` Method**

Each character class now `extends` `Character` and provides its own specific version of `attack()`.

```java
class Mage extends Character {
    @Override
    public void attack() {
        System.out.println("Mage casts a fireball!");
    }
}

class Warrior extends Character {
    @Override
    public void attack() {
        System.out.println("Warrior swings a mighty sword!");
    }
}

class Archer extends Character {
    @Override
    public void attack() {
        System.out.println("Archer shoots a flaming arrow!");
    }
}
```

    ***


    {{3}}
    ***

**Step 3: The Beautifully Simple Main Loop**

Now, look at how clean our main loop becomes. We create an array of `Character` references.

```java
// An array of Character references, pointing to different concrete objects
Character[] characters = { new Mage(), new Warrior(), new Archer(), new Warrior() };

// The beautifully simple and flexible main loop
for (Character character : characters) {
    // The magic happens here!
    character.attack();
}
```

    ***


### Dynamic Dispatch

When the line `character.attack()` is executed, the Java Virtual Machine (JVM) does something amazing:

1. It looks at the `character` variable.

2. It checks the **actual type of the object** that the variable is pointing to _at that moment in runtime_.

3. Is it pointing to a `Mage`? The JVM **dynamically dispatches** the call to the `Mage`'s `attack()` method.

4. Is it pointing to a `Warrior`? The JVM dispatches the call to the `Warrior`'s `attack()` method.


The main loop doesn't know and doesn't care what kind of character it is. It only knows that it's a `Character` and that all `Character` objects are guaranteed to have an `attack()` method. It trusts the object itself to know how to perform the action correctly.

## The "So What?" - The Real Benefits

Now, let's add that `Thief` class.

```java
class Thief extends Character {
    @Override
    public void attack() {
        System.out.println("Thief stabs with a dagger from the shadows!");
    }
}
```

How do we change our main loop to accommodate this new character?


**We don't. We don't touch it at all.**

We can simply add a `Thief` to our array, and the loop just works.

```java
Character[] characters = { new Mage(), new Warrior(), new Thief(), new Archer() };

for (Character character : characters) {
    character.attack(); // This loop is unchanged and now works with Thief!
}
```


**This is the payoff.** The system is now extensible. We can add 100 new character types without ever modifying the core game logic. This makes our code:

- **Maintainable:** Bugs are less likely because we aren't changing working code.

- **Flexible:** The system easily adapts to new requirements.

- **Decoupled:** The main loop is no longer tightly coupled to the concrete character classes. It only depends on the `Character` abstraction.



### More Real-World Examples

- **GUI Programming:** Imagine a `Button`, a `Checkbox`, and a `Slider`. They are all components that can be drawn on the screen. A `render` loop can iterate through a list of `GUIComponent` objects and call `component.draw()`. The button draws itself one way, the slider another, but the render loop doesn't care about the details.

- **Payment Processing:** An e-commerce site can process payments. You might have `CreditCardPayment`, `PayPalPayment`, and `CryptoPayment` classes. The shopping cart can have a list of `PaymentMethod` objects and just call `method.process(amount)`.

- **File Handling:** A text editor can save files in different formats. You could have `SaveAsDocx`, `SaveAsPdf`, and `SaveAsTxt` classes, all inheriting from a `FileSaver` class. The "Save" menu option just calls `fileSaver.save(document)`.



## Benefits of Polymorphism

- **Flexibility & Extensibility:** New classes can be added without modifying existing code, as long as they adhere to the common superclass interface.

- **Code Reusability:** Write generic code that works with objects of a base type, and it automatically adapts to specific subclass implementations.

- **Maintainability:** Easier to manage and update code.

- **Clearer Code:** Reduces conditional logic (`if-else` or `switch` statements) because the correct method is invoked automatically.

**Conclusion:** Runtime polymorphism isn't just a pattern; it's a fundamental shift in thinking. 

Instead of a central piece of code asking "What type are you, so I know what to do?", you tell the object "Do the thing," and trust the object itself to know how. 

This delegation of responsibility is the key to building large, complex systems that don't collapse under their own weight.

## ⚠️ Crucial Distinction: Methods vs. Fields

**The Rule of "Variable Shadowing"**

Dynamic Dispatch (Polymorphism) applies **ONLY** to overridden methods. It does **not** apply to fields (instance variables).

## 1. Methods: Dynamic Binding

- Determined at **Runtime**.

- Java looks at the **Actual Object** type.

- If a subclass overrides a method, the subclass version is called.


## 2. Fields: Static Binding

- Determined at **Compile-time**.

- Java looks at the **Reference Variable** type.

- Fields are "hidden" or "shadowed," not overridden.


## Code Comparison

```java
class Shape {
    String name = "Generic Shape";

    void describe() {
        System.out.println("Method: This is a Shape");
    }
}

class Circle extends Shape {
    String name = "Circle"; // Shadowing the field

    @Override
    void describe() {
        System.out.println("Method: This is a Circle");
    }
}

// Execution Logic
Shape s = new Circle();

System.out.println(s.name);  // Result: "Generic Shape" (Static Binding)
s.describe();                // Result: "Method: This is a Circle" (Dynamic Dispatch)
```

## Why does this happen?

Java is designed this way for performance and safety. Field access is resolved by the compiler based on the class type of the variable to ensure the memory offset is known immediately. Methods, however, use a **Virtual Method Table (V-Table)** to find the correct logic at runtime.

**Key Takeaway:** Always use "Getter" methods if you want polymorphic behavior for data!

## Static Members

- The `static` keyword in Java is used for memory management, primarily.

- It signifies that a member (variable or method) belongs to the **class itself**, rather than to any specific instance of the class.

- **Static members are shared among all instances of a class.**



## Static Variables (Class Variables)

- **Declaration:** `static data_type variableName;`

- **Belong to the Class:** There is only one copy of a static variable per class, regardless of how many objects are created (or if no objects are created).

- **Memory:** Stored in the class area of memory, not in the heap with object instances.

- **Access:** Can be accessed directly using the class name (e.g., `ClassName.variableName`) or indirectly through an object reference (though this is discouraged for clarity).



## Static Variables Example

```java
class Student {
    String name;
    int rollNo;
    static String college = "XYZ University"; // Static variable

    Student(String n, int r) {
        this.name = n;
        this.rollNo = r;
    }

    void display() {
        System.out.println(name + " " + rollNo + " " + college);
    }
}

public class StaticVarDemo {
    public static void main(String[] args) {
        Student s1 = new Student("Alice", 101);
        Student s2 = new Student("Bob", 102);

        s1.display(); // Output: Alice 101 XYZ University
        s2.display(); // Output: Bob 102 XYZ University

        Student.college = "ABC University"; // Change static variable
        s1.display(); // Output: Alice 101 ABC University
    }
}
```

**Observation:** Changing `college` via `Student.college` affects all students.


## Static Methods (Class Methods)

- **Declaration:** `static return_type methodName(parameters) { ... }`

- **Belong to the Class:** Can be called directly using the class name (e.g., `ClassName.methodName()`) without creating an object.

- **Restrictions:**

    - A `static` method can **only** access `static` variables and call other `static` methods of the same class.

    - It **cannot** use `this` or `super` keywords.

    - It **cannot** directly access instance variables or call instance methods because it doesn't operate on a specific object.



## Static Methods Example

```java
class MathUtils {
    static final double PI = 3.14159; // A static final variable (constant)

    static int add(int a, int b) { // Static method
        return a + b;
    }

    static double getCircleArea(double radius) { // Static method
        return PI * radius * radius;
    }

    // This method would cause a compile-time error if uncommented
    // String instanceData = "Some data";
    // static void problematicMethod() {
    //     System.out.println(instanceData); // ERROR: Cannot access instance var
    // }
}

public class StaticMethodDemo {
    public static void main(String[] args) {
        int sum = MathUtils.add(5, 3);
        System.out.println("Sum: " + sum); // Output: Sum: 8

        double area = MathUtils.getCircleArea(10);
        System.out.println("Area: " + area); // Output: Area: 314.159
    }
}
```

**Usage:** Notice how methods are called directly on the class `MathUtils`.


## When to Use Static Members

- **Static Variables:**

    - When a property is common to _all_ objects of a class (e.g., a company name, a counter for instances).

    - To define constants (`static final`).

- **Static Methods:**

    - Utility methods that perform operations without needing object-specific data (e.g., mathematical functions, helper methods).

    - Factory methods (methods that create and return objects).

    - Methods that only operate on static variables.

- **Main Method:** The `main` method in Java is `static` so that the JVM can call it to start the program without needing to create an object of the class.



## Key Differences: Instance vs. Static

|Feature|Instance Members (Non-Static)|Static Members (Class)|
|---|---|---|
|**Belongs To**|An object instance|The class itself|
|**Memory**|Separate copy for each object (Heap)|One copy for the entire class (Class Area)|
|**Access**|Requires an object to call/access|Can be called/accessed directly using class name|
|**`this`/`super`**|Can use `this` and `super`|Cannot use `this` or `super`|
|**Access to Other Members**|Can access both instance & static members|Can _only_ access static members|
|**Polymorphism**|Applicable (method overriding)|Not applicable (method hiding instead)|


## Summary

- **Polymorphism** allows flexibility:

    - **Method Overloading** (Compile-time) - Same method name, different parameters.

    - **Method Overriding** (Runtime) - Subclass redefines superclass method.

- **Static Members** belong to the class, not an object:

    - **Static Variables** are shared across all instances.

    - **Static Methods** can only access other static members and are called on the class itself.

