<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female
comment: Interfaces

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&display=swap
link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&display=swap
import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md
link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css
import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md
import: https://raw.githubusercontent.com/liaScript/mermaid_template/master/README.md

-->

# Worksheet - Abstract classes and Interfaces

## Basic Payroll System (Inheritance & Overriding)

**Goal:** Learn how to extend a class and use the `super` keyword to leverage existing logic while adding specific behaviors.

### Problem Statement

You are building a payroll module for a tech company. All employees have a base salary, but different roles calculate their total pay differently.

**1. The Base Class: `Employee`**

* **Fields:** `String name`, `double baseSalary`.
* **Constructor:** Initializes name and salary.
* **Method:** `getPay()`: Returns the `baseSalary`.

**2. The Subclasses:**

* **`Manager`**:
  * **Additional Field:** `double bonus`.
  * **Override `getPay()`**: Should return `baseSalary + bonus`. 
  * **Note:** You must use `super.getPay()` to retrieve the base salary.


* **`Developer`**:
  * **Additional Field:** `String language`.
  * **Override `toString()`**: Should include the developer's specialty (e.g., "Alice (Java Developer)").

### Code

```java     +Employee.java
public class Employee {
    private String name;
    private double baseSalary;

    public Employee(String name, double baseSalary) {
        this.name = name;
        this.baseSalary = baseSalary;
    }

    public double getPay() { return baseSalary; }
    public String getName() { return name; }
}

// TODO: Create Manager subclass
// TODO: Create Developer subclass

```
```java     -PayrollTester.java
public class PayrollTester {
    public static void main(String[] args) {
        int passed = 0;
        
        Employee emp = new Employee("Bob", 50000);
        Manager mgr = new Manager("Alice", 80000, 10000);
        Developer dev = new Developer("Charlie", 70000, "Java");

        // Tests
        if (emp.getPay() == 50000) passed++;
        if (mgr.getPay() == 90000) passed++; // 80k + 10k
        if (mgr instanceof Employee) passed++; // Inheritance check
        if (dev instanceof Employee) passed++;
        if (dev.getPay() == 70000) passed++;
        if (dev.toString().contains("Java")) passed++;
        
        // Polymorphism check
        Employee poly = new Manager("Eve", 60000, 5000);
        if (poly.getPay() == 65000) passed++; 
        
        // Change salary check
        // (Assuming you add a setter or use protected fields)
        mgr = new Manager("Dan", 1000, 500);
        if (mgr.getPay() == 1500) passed++;
        
        // Integrity check
        if (emp.getName().equals("Bob")) passed++;
        if (mgr.getName().equals("Dan")) passed++;

        System.out.println("Payroll System Passed: " + passed + "/10");
    }
}

```
@LIA.eval(`["Employee.java", "PayrollTester.java"]`, `javac *.java`, `java PayrollTester`)


## Animal Shelter Tracker (Dynamic Dispatch)

**Goal:** Understand how a single method call can behave differently depending on the actual object type at runtime.

### Problem Statement

An animal shelter needs a way to process different types of animals. You will create a system where a list of animals can be "fed" and "heard" regardless of their specific species.

**1. The Base Class: `Animal`**

* **Method:** `makeSound()`: returns "Generic animal sound".
* **Method:** `eat()`: returns "Animal is eating".

**2. The Subclasses:**

* **`Dog`**: Overrides `makeSound()` to return "Bark!", and `eat()` to return "Dog is eating kibble".
* **`Cat`**: Overrides `makeSound()` to return "Meow!", and adds a method `scratch()` (specific only to cats).
* **`Bird`**: Overrides `makeSound()` to return "Chirp!".

**3. Dynamic Dispatch Logic:**
Create a method `performDailyRoutine()` in the Animal `class` that calls `makeSound()` and `eat()` and returns the concatenates the results of the function calls separated by a new line.

### Code

```java     +Animal.java
public class Animal {
    public String makeSound() { return "Generic sound"; }
    public String eat() { "Animal is eating"; }

    //TODO: Implement `performDailyRoutine` method.
}

// TODO: Implement Dog, Cat, and Bird subclasses

```
```java     -ShelterTester.java
public class ShelterTester {
    public static void main(String[] args) {
        int passed = 0;
        
        Animal[] shelter = { new Dog(), new Cat(), new Bird(), new Dog() };

        if (new Dog().performDailyRoutine().equals("Bark!\nDog is eating kibble")) passed++;
        if (new Cat().performDailyRoutine().equals("Meow!\nAnimal is eating")) passed++;
        if (new Bird().performDailyRoutine().equals("Chirp!\nAnimal is eating")) passed++;
        
        // 1-4. Test correct sound dispatch
        // We'll use a helper to capture output or just check types
        if (shelter[0] instanceof Dog) passed++;
        if (shelter[1] instanceof Cat) passed++;
        if (shelter[2] instanceof Bird) passed++;
        
        // 5. Polymorphic assignment
        Animal myCat = new Cat();
        if (myCat instanceof Animal) passed++;

        // 6-8. Checking logic (Manual or via method return values)
        // For students, have them return Strings instead of printing for easier testing
        if (new Dog().makeSoundString().equals("Bark!")) passed++;
        if (new Cat().makeSoundString().equals("Meow!")) passed++;
        if (new Bird().makeSoundString().equals("Chirp!")) passed++;

        // 9. Method specific to subclass (Casting)
        Cat realCat = (Cat) shelter[1];
        realCat.scratch(); // Should work
        passed++;

        // 10. Default behavior
        Animal unknown = new Animal();
        if (unknown.makeSoundString().equals("Generic sound")) passed++;

        System.out.println("Shelter System Passed: " + (passed > 11 ? 13 : passed) + "/13");
    }
}

```
@LIA.eval(`["Animal.java", "ShelterTester.java"]`, `javac *.java`, `java ShelterTester`)


## Simple Banking Hierarchy (Logic in Overrides)

**Goal:** Use inheritance to implement different "rules" for the same action (withdrawing money).

### Problem Statement

You are creating a banking system with two types of accounts: Savings and Checking.

**1. The Base Class: `BankAccount`**

* **Fields:** `double balance`.
* **Method:** `withdraw(double amount)`: If `amount <= balance`, subtract from balance and return `true`. Otherwise, return `false`.
* **Method:** `deposit(double amount)`: Add to balance.

**2. The Subclasses:**

* **`SavingsAccount`**:
  * Adds `double interestRate` (e.g., $0.05$ for $5\%$).
  * Adds method `addInterest()`: Updates balance by `balance * interestRate`.


* **`CheckingAccount`**:
  * Adds `double transactionFee` (e.g., $1.50$).
  * Overrides `withdraw(double amount)`: The total deduction is `amount + transactionFee`. Only allow the withdrawal if the balance can cover both.

### Code

```java     +BankAccount.java
public class BankAccount {
    protected double balance;

    public BankAccount(double initialBalance) {
        this.balance = initialBalance;
    }

    public void deposit(double amount) { this.balance += amount; }
    public double getBalance() { return balance; }

    public boolean withdraw(double amount) {
        if (amount <= balance) {
            balance -= amount;
            return true;
        }
        return false;
    }
}

// TODO: Implement SavingsAccount and CheckingAccount

```
```java     -BankTester.java
public class BankTester {
    public static void main(String[] args) {
        int passed = 0;

        // 1. Basic BankAccount withdrawal
        BankAccount basic = new BankAccount(100);
        if (basic.withdraw(50) && basic.getBalance() == 50) passed++;

        // 2. SavingsAccount interest logic
        SavingsAccount save = new SavingsAccount(1000, 0.10);
        save.addInterest();
        if (save.getBalance() == 1100) passed++;

        // 3. CheckingAccount fee logic
        CheckingAccount check = new CheckingAccount(100, 2.0);
        if (check.withdraw(10) && check.getBalance() == 88.0) passed++;

        // 4. CheckingAccount insufficient funds (due to fee)
        CheckingAccount check2 = new CheckingAccount(10, 2.0);
        if (!check2.withdraw(9)) passed++; // 9 + 2 = 11 (too much)

        // 5. Polymorphic withdrawal
        BankAccount poly = new CheckingAccount(50, 5.0);
        poly.withdraw(10); // Should use CheckingAccount's logic
        if (poly.getBalance() == 35.0) passed++;

        // 6. SavingsAccount withdrawal (should use super logic)
        SavingsAccount save2 = new SavingsAccount(50, 0.05);
        if (save2.withdraw(20) && save2.getBalance() == 30) passed++;

        // 7-8. Deposit tests
        save2.deposit(70);
        if (save2.getBalance() == 100) passed++;
        check.deposit(12);
        if (check.getBalance() == 100) passed++;

        // 9. Negative withdrawal check
        if (!basic.withdraw(-10)) passed++;

        // 10. SavingsAccount identity
        if (save instanceof BankAccount) passed++;

        System.out.println("Banking Hierarchy Passed: " + passed + "/10");
    }
}

```
@LIA.eval(`["BankAccount.java", "BankTester.java"]`, `javac *.java`, `java BankTester`)


## Geometric Shapes Engine (Abstract Classes)

**Goal:** Use an `abstract` class to define a "template" for shapes. You cannot instantiate a `Shape`, but you can ensure all shapes have an area and perimeter.

### Problem Statement

A graphic design app needs to calculate the properties of various shapes. Since a "Shape" itself doesn't have a specific formula, we make it abstract.

**1. The Abstract Class: `Shape`**

* **Fields:** `String color`.
* **Constructor:** Initializes color.
* **Abstract Methods:**
  * `public abstract double calculateArea()`
  * `public abstract double calculatePerimeter()`


* **Concrete Method:** `getColor()`: Returns the color.

**2. The Concrete Subclasses:**

* **`Circle`**: Needs `double radius`. $Area = \pi r^2$, $Perimeter = 2\pi r$.
* **`Rectangle`**: Needs `double width, height`. $Area = w \times h$, $Perimeter = 2(w + h)$.
* **`Square`**: Extends `Rectangle`. Constructor only takes one `side` and passes it to `super` as both width and height.

### Code

```java     +Shape.java
public abstract class Shape {
    private String color;

    public Shape(String color) { this.color = color; }
    public String getColor() { return color; }

    public abstract double calculateArea();
    public abstract double calculatePerimeter();
}

// TODO: Implement Circle, Rectangle, and Square

```
```java     -ShapeTester.java
public class ShapeTester {
    public static void main(String[] args) {
        int passed = 0;

        Shape c = new Circle("Red", 5);
        Shape r = new Rectangle("Blue", 4, 10);
        Shape s = new Square("Green", 4);

        // 1-2. Circle Math (allow small delta for doubles)
        if (Math.abs(c.calculateArea() - 78.53) < 0.1) passed++;
        if (Math.abs(c.calculatePerimeter() - 31.41) < 0.1) passed++;

        // 3-4. Rectangle Math
        if (r.calculateArea() == 40.0) passed++;
        if (r.calculatePerimeter() == 28.0) passed++;

        // 5-6. Square Math (Inheritance check)
        if (s.calculateArea() == 16.0) passed++;
        if (s instanceof Rectangle) passed++;

        // 7-8. Abstract constraints
        if (c.getColor().equals("Red")) passed++;
        // The next test is conceptual: Shape x = new Shape("Black") should not compile.
        passed++; 

        // 9-10. Polymorphic Array
        Shape[] shapes = {c, r, s};
        double totalArea = 0;
        for(Shape shape : shapes) totalArea += shape.calculateArea();
        if (totalArea > 134.5) passed++;
        if (shapes[2].calculatePerimeter() == 16.0) passed++;

        System.out.println("Shape Engine Passed: " + passed + "/10");
    }
}

```
@LIA.eval(`["Shape.java", "ShapeTester.java"]`, `javac *.java`, `java ShapeTester`)


## Smart Home Device Manager (Resource Tracking)

**Goal:** Use an abstract class to track a shared resource (electricity) while each device calculates its own consumption differently.

### Problem Statement

You are building a dashboard for a Smart Home. All devices have a name and a power state, but their energy footprint depends on their specific function.

**1. The Abstract Class: `SmartDevice`**

* **Fields:** `String name`, `boolean isOn`.
* **Methods:** `togglePower()` (flips the boolean), `getName()`.
* **Abstract Method:** `double calculateEnergyUsage(int hours)`: Returns the kilowatt-hours (kWh) consumed over a duration.

**2. The Concrete Subclasses:**

* **`SmartLight`**:
  * Adds `int brightness` (scale 1-10).
  * **Energy Logic:** `(brightness * 0.05) * hours`. If the light is off, usage is `0`.


* **`Thermostat`**:
  * Adds `double temperature`.
  * **Energy Logic:** If the temperature is $> 75$ or $< 65$, it uses `1.5` kWh per hour. Otherwise, it uses `0.5` kWh per hour (eco-mode). Usage is `0` if off.


* **`SecurityCamera`**:
  * Adds `boolean isRecording`.
  * **Energy Logic:** Base usage is `0.1` kWh per hour, plus an extra `0.05` if `isRecording` is true. These devices use power **even if "off"** (standby mode), but only $10\%$ of their base usage.

### Code

```java     +SmartDevice.java
public abstract class SmartDevice {
    protected String name;
    protected boolean isOn;

    public SmartDevice(String name) {
        this.name = name;
        this.isOn = false;
    }

    public void togglePower() { isOn = !isOn; }
    public abstract double calculateEnergyUsage(int hours);
}

// TODO: Implement SmartLight, Thermostat, and SecurityCamera

```
```java     -SmartHomeTester.java
public class SmartHomeTester {
    public static void main(String[] args) {
        int passed = 0;

        SmartLight light = new SmartLight("Kitchen", 10);
        Thermostat thermo = new Thermostat("Hallway", 70);
        SecurityCamera cam = new SecurityCamera("Porch", true);

        // 1-2. Light Usage (On/Off)
        light.togglePower(); // Now On
        if (light.calculateEnergyUsage(2) == 1.0) passed++; // (10*0.05)*2
        light.togglePower(); // Now Off
        if (light.calculateEnergyUsage(2) == 0.0) passed++;

        // 3-4. Thermostat Logic (Eco vs High Power)
        thermo.togglePower();
        if (thermo.calculateEnergyUsage(1) == 0.5) passed++; // Eco-mode
        thermo.setTemperature(80);
        if (thermo.calculateEnergyUsage(1) == 1.5) passed++; // High-power

        // 5-6. Camera Standby Logic
        if (cam.calculateEnergyUsage(1) == 0.015) passed++; // 10% of (0.1 + 0.05)
        cam.togglePower();
        if (cam.calculateEnergyUsage(1) == 0.15) passed++;

        // 7-8. Array Polymorphism
        SmartDevice[] devices = {light, thermo, cam};
        if (devices.length == 3) passed++;
        double total = 0;
        for(SmartDevice d : devices) total += d.calculateEnergyUsage(1);
        if (total > 0) passed++;

        // 9-10. Field integrity
        if (light.getName().equals("Kitchen")) passed++;
        if (cam instanceof SmartDevice) passed++;

        System.out.println("Smart Home Passed: " + passed + "/10");
    }
}

```
@LIA.eval(`["SmartDevice.java", "SmartHomeTester.java"]`, `javac *.java`, `java SmartHomeTester`)


## Payment Gateway Integration (The Strategy Pattern)

**Goal:** Use an `interface` to define a standard way to process payments. This allows a checkout system to accept any payment method without knowing its internal logic.

### Problem Statement

You are building an e-commerce checkout. Instead of writing separate code for every credit card or digital wallet, you will create a "contract" that all payment methods must follow.

**1. The Interface: `PaymentProcessor`**

* **Method:** `boolean processPayment(double amount)`: Returns `true` if the transaction is successful, `false` otherwise.
* **Method:** `String getTransactionStatus()`: Returns a message about the last transaction.

**2. The Implementations:**

* **`CreditCardProcessor`**:
  * **Fields:** `String cardNumber`, `double limit`.
  * **Logic:** `processPayment` returns `true` if `amount <= limit`. Subtracts amount from limit.


* **`PayPalProcessor`**:
  * **Fields:** `String email`, `boolean isVerified`.
  * **Logic:** Returns `true` if `isVerified` is true and `amount > 0`.


* **`CryptoProcessor`**:
  * **Fields:** `String walletAddress`, `double balanceBTC`.
  * **Logic:** Converts `amount` (USD) to BTC (assume $1 \text{ USD} = 0.00002 \text{ BTC}$). Returns `true` if `balanceBTC` is sufficient.



### Code

```java +PaymentProcessor.java
public interface PaymentProcessor {
    boolean processPayment(double amount);
    String getTransactionStatus();
}

// TODO: Implement CreditCardProcessor, PayPalProcessor, and CryptoProcessor

```
```java     -PaymentTester.java
public class PaymentTester {
    public static void main(String[] args) {
        int passed = 0;

        PaymentProcessor card = new CreditCardProcessor("1234", 1000.0);
        PaymentProcessor pp = new PayPalProcessor("user@test.com", true);
        PaymentProcessor crypto = new CryptoProcessor("0xABC", 1.0); // 1.0 BTC

        // 1-2. Credit Card Logic
        if (card.processPayment(500) && card.getTransactionStatus().contains("Success")) passed++;
        if (!card.processPayment(600)) passed++; // Over limit now

        // 3-4. PayPal Logic
        if (pp.processPayment(10)) passed++;
        PaymentProcessor unverified = new PayPalProcessor("bad@test.com", false);
        if (!unverified.processPayment(10)) passed++;

        // 5-6. Crypto Logic
        if (crypto.processPayment(100)) passed++; // Uses small fraction of BTC
        if (crypto.getTransactionStatus().contains("0xABC")) passed++;

        // 7-8. Interface Polymorphism
        PaymentProcessor[] gateway = {card, pp, crypto};
        for(PaymentProcessor p : gateway) {
            if (p instanceof PaymentProcessor) passed++; // 2 tests
        }

        // 9. Negative amount check
        if (!pp.processPayment(-50)) passed++;

        // 10. Type identity
        if (!(card instanceof PayPalProcessor)) passed++;

        System.out.println("Payment Gateway Passed: " + passed + "/10");
    }
}
```
@LIA.eval(`["PaymentProcessor.java", "PaymentTester.java"]`, `javac *.java`, `java PaymentTester`)