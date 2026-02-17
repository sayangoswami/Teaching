<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female
comment: Method Overloading

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&display=swap
link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&display=swap
import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md
link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css
import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md
import: https://raw.githubusercontent.com/liaScript/mermaid_template/master/README.md

-->

# Method Overloading


## Introduction to Method Overloading

    {{1}}
**What is method overloading?**

    {{2}}
    - It's a feature in many programming languages that allows a class to have **multiple methods with the same name** but **different parameters**.

    {{3}}
**Why is it useful?** 

    {{4}}
+  It improves code readability and reusability by allowing you to use a single, meaningful method name for actions that are conceptually similar but operate on different types or numbers of data.

    {{5}}
+  **Think of it like this:** Imagine a 'calculate' button on a calculator. It can handle adding two numbers, three numbers, or even a list of numbers. The underlying action is the same (addition), but the input changes.



## The Core Principle

- In method overloading, the compiler decides which version of the overloaded method to call based on the number, type, and order of the arguments you provide.

- The **return type alone is not enough** to overload a method. You must have a different parameter list.
    


## How It Works: The Signature

- The **method signature** is the key. It's composed of the **method name** and the **parameter list** (the number, data types, and order of the parameters).

- For example, `public void printMessage(String message)` and `public void printMessage(int number)` are two different method signatures.

- The compiler uses this signature to uniquely identify which version of the method to execute.
    


## Example in Java

- Let's create a class called `Calculator`.

- We'll *overload* a method named `add`.

- We can have a method to add two integers and another to add two doubles.
    

```java
public class Calculator {
    // Method to add two integers
    public int add(int a, int b) {
        return a + b;
    }

    // Overloaded method to add two doubles
    public double add(double a, double b) {
        return a + b;
    }
}
```



## Calling Overloaded Methods

- The compiler automatically chooses the correct `add` method based on the arguments you pass.

```java
public class Main {
    public static void main(String[] args) {
        Calculator myCalc = new Calculator();

        int sum1 = myCalc.add(5, 10); // Calls the int version
        System.out.println("Sum of integers: " + sum1);

        double sum2 = myCalc.add(5.5, 10.5); // Calls the double version
        System.out.println("Sum of doubles: " + sum2);
    }
}
```



## Guess the output

```java
class Calculator {
    public int add(int a, int b) {
	    System.out.println("A");
        return a + b;
    }
    public double add(double a, double b) {
	    System.out.println("B");
        return a + b;
    }
}

public class Main {
	public static void main(String[] args) {
		Calculator c = new Calculator();
		c.add(5, 3);
		c.add(2.0, 3.0);
		c.add(1.0, 2);
		c.add(1, 2.0);
	}
}
```



## Overloading with Different Number of Parameters

- You can also overload methods by changing the **number of parameters**.

- This is useful for providing flexibility.
    

```java
public class Shape {
    // Calculate area with radius
    public double calculateArea(double radius) {
        return 3.14 * radius * radius;
    }

    // Overloaded method to calculate area of a rectangle
    public double calculateArea(double length, double width) {
        return length * height;
    }
}
```



## Overloading with Different Parameter Order

- The **order of the parameters** also matters to the method signature.

- Even if the data types are the same, a different order creates a unique signature.


```java
public class DataProcessor {
    // Method 1: Processes an integer followed by a string
    public void process(int id, String name) {
        System.out.println("Processing ID: " + id + " and Name: " + name);
    }

    // Method 2: Processes a string followed by an integer
    public void process(String name, int id) {
        System.out.println("Processing Name: " + name + " and ID: " + id);
    }
}
```



## Important Rule: Return Type Doesn't Matter

- **You cannot overload a method based on its return type alone.**

- The compiler can't tell which method to call if the parameter list is identical.
    

```java
public class MyClass {
    public int getValue() { // This is valid
        return 1;
    }

    // public double getValue() { // THIS IS AN ERROR!
    //    return 1.0;
    // }
}
```



## Constructors and Overloading

- **Constructors can also be overloaded.**

- This allows you to create objects with different initial states.

- For example, you might have a default constructor and another that takes parameters to initialize fields.
    

```java
public class Dog {
    String name;
    int age;

    // Default constructor
    public Dog() {
        this.name = "Unknown";
        this.age = 0;
    }

    // Overloaded constructor
    public Dog(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```




## Summary

- Method overloading is a powerful tool for creating clear, readable code.

- It's a form of polymorphism that works by providing methods with the **same name** but **different parameter lists**.

- The compiler decides which method to use based on the **method signature**.

- The return type is **not** part of the method signature for overloading purposes.
    


## Why It's Useful in Real-World Programming

- **Increased Code Readability:** A single, intuitive name like `print` or `draw` can be used for related tasks.

- **Reduced Complexity:** You don't have to remember multiple method names like `printInt`, `printString`, `printDouble`.

- **API Design:** When designing a library, you can provide overloaded methods that offer users different ways to interact with your code, making it more flexible.


## Quiz Time!

+  **Question 1:** Can you overload a method by only changing its return type?
+  **Question 2:** What is the key to method overloading?
+  **Question 3:** Can a class have two constructors with the same number and types of parameters?


## Answers

- **Answer 1:** No. The return type is not part of the method signature for overloading.

- **Answer 2:** The method signature, which includes the method name and its parameter list (number, type, and order).

- **Answer 3:** No. A class cannot have two constructors with the same method signature.
    


## Final Thoughts

- Method overloading is a fundamental concept in object-oriented programming.

- It's a simple yet powerful way to write more flexible and maintainable code.

- Keep practicing, and you'll soon be a pro at using it!
    


# Practice



### Method Overloading: Programming Problems Worksheet


### Circle and Rectangle Area

1. **Problem A:** In a class named `GeometryCalculator`, create a *static* method named `calculateArea`. This method should take a single `double` parameter named `radius`. It should calculate and return the area of a circle (`double`) using the formula $\pi r^2$. in Java, $\pi$ is denoted by `Math.PI`.

2. **Problem B:** Within the same `GeometryCalculator` class, create an *overloaded static* method also named `calculateArea`. This method should take two `double` parameters: `width` and `height`. It should calculate and return the area of a rectangle (`double`) using the formula `width * height`.

??[](https://codecheck.io/files/2602171411auh1kbe8ry15ymp7d3uwc5ohl)
    


### Displaying Information

1. **Problem A:** Create a class named `DisplayUtility`. Inside this class, write a *static* `void` method called `displayInfo` that takes a single `String` parameter named `message`. The method should print the provided message to the console, followed by a new line. For example, if you call `displayInfo("Hello")`, it should print "`Hello`".

2. **Problem B:** In the same `DisplayUtility` class, overload the `displayInfo` method. This new version should take two parameters: a `String` named `name` and an `int` named `age`. The method should print a formatted string to the console that includes both the name and age. For example, if you call `displayInfo("Alice", 25)`, it should print "`Name: Alice, Age: 25`".

??[](https://codecheck.io/files/2602171441a2adrfzg27o7ktcoe8tcw21ge)
    


### Volume Calculation

1. **Problem A:** In a class called `VolumeCalculator`, create a static method named `calculateVolume` that takes a single `double` parameter named `side`. The method should compute and return the volume of a cube using the formula $side^{3}$.

2. **Problem B:** Within the same `VolumeCalculator` class, overload the `calculateVolume` method. This version should take three `double` parameters: `length`, `width`, and `height`. It should compute and return the volume of a rectangular prism using the formula `length * width * height`.
??[](https://codecheck.io/files/260217144155aoq2ibf5prfedt46ctk29vr)
    


### Financial Transactions

1. **Problem A:** Create a class named `TransactionProcessor`. Inside this class, write a method named `processTransaction` that takes two parameters: a `double` named `amount` and an `int` named `transactionId`. The method should print a message to the console indicating the transaction ID and the amount processed. For example, if you call `processTransaction(150.75, 101)`, it should print "`Processing transaction 101 for amount $150.75`".

2. **Problem B:** Overload the `processTransaction` method in the same `TransactionProcessor` class. This version should take an additional `String` parameter named `description`, along with the `amount` and `transactionId`. The method should print a message that includes all three pieces of information. For example, if you call `processTransaction(200.00, 102, "Online Purchase")`, it should print "`Processing transaction 102 for amount $200.00: Online Purchase`".

??[](https://codecheck.io/files/2602171442ckackhdiopfqv9ss6xnhyz2v9)
    


### Number Operations

1. **Problem A:** In a class named `MathOperations`, create a method named `multiply`. This method should take two `int` parameters and return their product as an `int`.

2. **Problem B:** In the same `MathOperations` class, overload the `multiply` method. This version should take three `double` parameters and return their product as a `double`.

??[](https://codecheck.io/files/26021714434d1vfcbvro9npyp5adq00z1bb)
    



### Student Grades

1. **Problem A:** In a class named `GradeCalculator`, create a method named `calculateGrade`. This method should take a single `int` parameter named `score`. It should return a `String` representing the letter grade based on the following criteria:
 - 90-100: "A"
 - 80-89: "B"
 - 70-79: "C"
 - 60-69: "D"
 - Below 60: "F"

2. **Problem B:** In the same `GradeCalculator` class, overload the `calculateGrade` method. This version should take three `int` parameters: `quizScore`, `midtermScore`, and `finalScore`. It should first calculate the average of the three scores and then return a `String` letter grade based on the same criteria as Problem A.
    
??[](https://codecheck.io/files/260217144438qvjhtny40ii5e16pme0o825)


### Array Manipulation

1. **Problem A:** Create a class named `ArrayPrinter`. Inside this class, write a method named `printArray` that takes an array of integers (`int[]`) as its single parameter. The method should iterate through the array and print each element to the console, separated by a space.

2. **Problem B:** In the same `ArrayPrinter` class, overload the `printArray` method. This new version should take an array of strings (`String[]`) as its single parameter. The method should iterate through this array and print each element to the console, each on a new line.

??[](https://codecheck.io/files/2602171445alh2mrl6athtc6zwgtvtefx03)
