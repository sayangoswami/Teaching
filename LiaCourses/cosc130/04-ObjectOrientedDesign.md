<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female

comment: Object Oriented Design

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap


import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md

link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css

-->



# Abstraction, Encapsulation, and Software Integrity



## Beyond "Just Code"

- **The Transition:** In CS1, you learned how to write a loop. In CS2, you learn how to build a **system**.
    
- **The Goal:** Write code that is easy to use, hard to break, and clear to read.
    
- **Core Tools:** Abstraction, Encapsulation, and careful API design.
    


## What is Object-Oriented Programming?

Object-Oriented Programming (OOP) is a programming paradigm based on the concept of "objects."

It helps us _model real-world problems_ by treating parts of our programs as self-contained entities, or _objects_.

## The Four Pillars of OOP

The four pillars of OOP are:

1. **Encapsulation**: Bundling data and methods.
2. **Abstraction**: Hiding complexity.
3. **Inheritance**: Creating new classes from existing ones.
4. **Polymorphism**: The ability of an object to take on many forms.

Now, we will focus on the first two: Encapsulation and Abstraction.


## The Pillar of Abstraction

- **Definition:** Distilling a complex system down to its most essential characteristics.
    
- **In Java:** We define _what_ an object does (methods) without necessarily caring _how_ it does it (implementation).
    
- **Real-world Analogy:** A TV Remote. You press "Volume Up." You don't care about the infrared signal frequency or the circuit board logic.
    

## Before abstraction

- Below is a script that works with a bunch of separate variables or array elements to represent a transaction. 
- It's hard to tell what the rules are.

```java
// Before: Procedural style
double transactionAmount = -50.0;
String transactionDesc = "Coffee";
boolean transactionIsValid = false;

if (transactionAmount > 0 && transactionDesc != null) {
    transactionIsValid = true;
}
// ... more rules scattered around
```

## After abstraction

```java
// After: Object-oriented style
Transaction tx = new Transaction(-50.0, "Coffee");

if (tx.isValid()) {
    // ...
}
```

- Much clearer
- The rules are contained within the object itself. 
- We can just ask the object if it's valid.

## Encapsulation (The "Black Box")

- **Definition:** Hiding the internal state of an object and requiring all interaction to happen through well-defined methods.
    
- **Why?**

    {{1}}
  - Encapsulation protects data from accidental modification. 
  - It provides a controlled interface for interacting with an object, preventing outside code from directly accessing or changing the data. 
  - This is crucial for maintaining data integrity.
  - Prevents "spaghetti code" where every class can reach inside and change every other class's variables.


    {{2}}

- Think of a pill capsule. It holds all the medicine inside. You don't need to know the individual ingredients or how they work together; you just take the capsule.

    {{3}}

- **Encapsulation** in programming is the same idea: it's the **bundling of data and the methods that operate on that data into a single unit.**

## Anatomy of a class

    {{1}}
- First, we define the data it holds, which we call **fields**. 

- We'll make them `private`. This is our default choice, and it's the heart of encapsulation. It means nothing outside this class can touch this data directly.

    {{2}}
```java
public class Transaction {
    private double amount;
    private String description;
}
```

    {{3}}
- Next, we need a way to create a `Transaction` object. 
- For that, we use a **constructor**. 
- Its job is to make sure that when an object is born, it's born in a **valid state**.

    {{4}}
```java
public class Transaction {
    private double amount;
    private String description;

    // Constructor
    public Transaction(double amount, String description) {
        this.amount = amount;
        this.description = description;
    }
}
```

    {{5}}
- Finally, we add methods to *provide access* to the data or to *define behaviors*. 
- We can add a "**getter**" to read the amount, but more importantly, we can add methods that tell us something about the object, like whether it's a debit or credit.

    {{6}}
```java
public class Transaction {
    // ... fields and constructor ...

    public double getAmount() {
        return this.amount;
    }

    public boolean isDebit() {
        return this.amount < 0;
    }
}
```

## Pop Quiz!

If the `amount` field in `Transaction` were `public`, what is the main risk?

- [( )] The code would not compile.
- [(X)] Code outside the class could set `amount` to zero, breaking our invariant.
- [( )] It would make the program run slower.



## Access Modifiers – The Gatekeepers

Java provides four levels of visibility to enforce encapsulation:

| **Modifier**             | **Class** | **Package** | **Subclass** | **World** |
| ------------------------ | --------- | ----------- | ------------ | --------- |
| **`public`**             | Yes       | Yes         | Yes          | Yes       |
| ***`protected`***        | Yes       | Yes         | Yes          | No        |
| **Default** (no keyword) | Yes       | Yes         | No           | No        |
| **`private`**            | Yes       | No          | No           | No        |



## Encapsulation in a Simple Example

Let's use a simple example: a **`BankAccount`** object.

Without encapsulation, anyone could change the balance directly, which is dangerous.

```java
// Not encapsulated
public class BankAccount {
    public double balance;
}

// In another class...
BankAccount account = new BankAccount();
account.balance = -100; // Oops, this shouldn't be allowed!
```


## Encapsulation with Getters and Setters

To encapsulate the data, we make the `balance` variable **`private`**. We then provide **public** methods—a **`get`** method to read the balance and a **`set`** method to modify it.

```java
public class BankAccount {
    private double balance; // Data is private

    public double getBalance() {
        return balance;
    }
    public void deposit(double amount) { // A method to change the data
        if (amount > 0) {
            balance += amount;
        } else {
            System.out.println("Amount must be greater than 0");
        }
    }
}
```


## Encapsulation in Action

With encapsulation, we control how the data is changed. We can add **validation** to our `deposit` method to ensure the amount is positive.

```java
// In another class...
BankAccount account = new BankAccount();
account.deposit(500); // OK
account.deposit(-100); // Invalid, the method won't allow it!
```

This is a small example of how encapsulation protects our data and prevents errors.


## Encapsulation Analogy: Your TV Remote

Your TV remote is a perfect analogy for encapsulation. 
- The buttons on the remote (the public methods) are the only way you can change the channel or volume. 
- You don't need to know how the remote's internal circuits (the private data) work. You just press the button and get a result.



## Pause

> **Think about it:** If you are building a `VideoPlayer` class, should the `internalBuffer` variable be `public` or `private`? Why?


## Encapsulation: More Than Just `private`

    {{0}}
- Encapsulation isn't just about hiding data. 
- It's a fundamental design principle for reducing complexity. 
- By creating this "protective bubble," we create *a clear separation* between the *inside* of an object and the *outside*.

    {{1}}
Why does that matter? 
- Because it means you can completely change the *internal* implementation of a class, and as long as you don't change the public methods (the API), no other part of the program will break. 
- This makes your code dramatically easier to maintain and update.

    {{2}}
- For example, we could decide to store the `amount` in cents as an integer to avoid floating-point errors. 
- As long as `getAmount()` still returns a `double`, the outside world doesn't need to know or care about our internal change.

      {{3}}
```java
public class Transaction {
    private int amountInCents; // Internal change!

    public Transaction(double amount, ...) {
        this.amountInCents = (int) (amount * 100);
    }

    public double getAmount() {
        // The public contract remains the same.
        return this.amountInCents / 100.0;
    }
    // ...
}
```

## The "Tell, Don't Ask" Principle

    {{0}}
- Good encapsulation leads to a powerful design principle: "T**ell, Don't Ask.**" 
- Instead of asking an object for its data to make a decision, you should *tell* the object what to do and let it handle the decision internally.

    {{1}}
_ Imagine the code for an online store that automatically applies a discount for amounts larger than $100.
- Here's an "asking" style. Notice how the logic for applying a discount is outside the `ShoppingCart` class.

      {{1}}
```java
// "Asking" for data (less encapsulated)
double total = cart.getTotalPrice();
if (total > 100.0) {
    cart.setDiscount(10.0);
}
```

    {{2}}
- Here's a "telling" style. We tell the cart to apply a discount, and the cart itself contains the logic and the rules. 
- The `if (total > 100.0)` logic is now inside the cart, where it belongs, right next to the data it operates on. 
- This is much better object-oriented design.

      {{2}}
```java
// "Telling" the object what to do (better encapsulation)
cart.applyDiscountForLargeOrder();

// Inside the ShoppingCart class:
public void applyDiscountForLargeOrder() {
    if (this.getTotalPrice() > 100.0) {
        this.setDiscount(10.0);
    }
}
```

## Object State and API Design

    {{0}}
- Let's talk about an object's state. 
- Is it set in stone, or can it change? 
- This leads to the idea of **mutable** versus **immutable** objects.

    {{1}}
```java
public class Transaction {
    private int amountInCents;

    public Transaction(double amount) {
        this.amountInCents = (int) (amount * 100);
    }

    public double getAmount() {
        return this.amountInCents / 100.0;
    }
    // ...
}
```    

    {{1}}
- Our `Transaction` class is currently immutable because there's no way to change its state after it's created. 
- If we were to add a `setAmount` method, it would become mutable. 
- Both designs are useful, but immutability is generally safer and easier to reason about.

    {{2}}
- This becomes critical when your object holds other objects. 
- For example, if our `Transaction` had a `java.util.Date` field. `Date` is mutable! 
- Someone could get the date object from our transaction and then change it, altering our transaction's internal state without us knowing.

    {{3}}
- To prevent this, we use something called a "defensive copy." 
- In the constructor, we save a *copy* of the incoming `Date` object. 
- And in the getter, we return a *copy* of our internal `Date` object. 
- This way, our internal state is completely insulated from the outside world.

      {{4}}
```java
// Defensive copying for a mutable field
public class Transaction {
    private Date transactionDate;
    private int amountInCents;

    public Transaction(int amountInCents, Date date) {
        // Constructor: save a copy
        this.transactionDate = new Date(date.getTime());
    }

    public Date getTransactionDate() {
        // Getter: return a copy
        return new Date(this.transactionDate.getTime());
    }
}
```

## Encapsulation vs. Abstraction

This is often where students get confused! Let's clarify.

- **Encapsulation** is about **internal** hiding. It keeps the data and methods together in a "capsule" to protect the data.
    
- **Abstraction** is about **external** hiding. It simplifies the object's interface and hides the complex internal details from the user.
    

## An Analogy to Differentiate

Think about a smartphone.

- **Encapsulation**: The screen, processor, and battery are all bundled inside the phone's case. You can't just reach in and touch the circuits. This is encapsulation.
    
- **Abstraction**: You use a simplified interface (the apps and touch screen) to interact with the phone. You don't need to understand the underlying code or hardware that makes the apps work. This is abstraction.
    



## New Topic – Java Packages

- **Definition:** A mechanism to group related classes, interfaces, and sub-packages.
    
- **Why do they exist?**
    
    1. **Namespace Management:** Prevents naming conflicts. (You can have two `User` classes if they are in different packages).
        
    2. **Access Control:** Facilitates "package-private" visibility.
        
    3. **Organization:** Makes a large codebase searchable.
        



## Defining and Using Packages

- **Defining:** Use the `package` keyword at the very top of the file.
    
    - `package com.university.enrollment;`
        
- **Using:** Use the `import` keyword to bring in classes from other packages.
    
    - `import java.util.ArrayList;`
        
- **Real Life:** Think of packages like folders on your computer or chapters in a textbook.
    


## The `final` Keyword

`final` means "this is the last version of this thing."

- **On a Variable:** It becomes a constant. It cannot be reassigned.
    
- **On a Method:** It cannot be overridden by a subclass.
    
- **On a Class:** It cannot be inherited from.


## Quiz: Finality

**Code Check:** Which line causes an error?

```java
final int limit = 100;
limit = 200; // Line A
final Student s = new Student("Alice");
s.setName("Bob"); // Line B
```

    {{1}}
- **Answer:** **Line A**.
    
- **Crucial Note:** Line B is **legal**! `final` on an object variable means you can't point `s` to a _new_ Student, but you can still change the _contents_ of the Student object.
    


## Method Contracts

Every public method is a **contract** between you (the developer) and the user.

- **Pre-conditions:** "If you give me a non-null string..."
    
- **Post-conditions:** "...I promise to return the number of vowels in it."
    
- **Exceptions:** "If you give me null, I will throw an `IllegalArgumentException`."
    



## Simple API Design Principles

1. **Choose Clear Names:** `list.add(item)` is better than `list.insertInTheBack(item)`.
    
2. **Fail Fast:** Check your inputs immediately. Don't start a long calculation if the input is invalid.
    
3. **Consistency:** If `getWidth()` exists, call the other one `getHeight()`, not `fetchVerticalDimension()`.
    



## Quiz: API Design

**Question:** Which method signature is better for a Library system?

- A) `public void process(Book b)`
    
- B) `public void checkoutBook(Book bookToReturn)`
    
- C) `public boolean checkoutBook(Book b)`
    
    {{1}}
**Answer: C.** It is descriptive and provides feedback (boolean) on whether the operation succeeded.



## Real-Life Use Case: The String Class

- `java.lang.String` is the most used class in Java.
    
- It is **Immutable** and **Final**.
    
- Because it's immutable, Java can use a "String Pool" to save memory. If it were mutable, changing one "Hello" would change every "Hello" in your entire program!


## Summary of Encapsulation Benefits

1. **Maintainability:** Change the internal code without affecting users.
    
2. **Security:** Control what data enters and leaves.
    
3. **Simplicity:** The user only sees a few public methods instead of 50 internal variables.


## Final Thought

> "Software is not just about telling a computer what to do; it's about telling another human what you intended the computer to do." — _Good design makes your intention clear._

