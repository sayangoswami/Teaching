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


# Abstract Classes and Interfaces


## The Problem: Teamwork and Inconsistency

Imagine you're leading a team building different `Character` classes.

You tell two programmers, Alice and Bob, to create classes for different Charaters that extend the `Character` class.

- Alice creates `Thief` class.

- Bob creates `Monk` class.
    

**Problem:** Bob forgets to override the `attack` method.


## The Solution: A Contract

We need a way to enforce a **contract** or a **blueprint**.

This contract would say:

> "I don't care _how_ you do it, but any class that is a `Character` **MUST** provide a method called `attack()`. If you don't, your code won't even be allowed to run."

This is the core idea behind **Abstract Classes**.


## What is an Abstract Class?

An abstract class is a special kind of class that serves as a **template** for other classes.

- You **cannot** create an object directly from an abstract class. (`new Report()` would be an error).

- It exists only to be **extended** by other classes (subclasses).

- It can contain both **regular methods** (with code) and **abstract methods** (the contract).
    

It's a blueprint, not a finished building.


## The `abstract` Keyword

We use the `abstract` keyword to create the contract.

**1. The Abstract Class:** The `class` itself is marked as `abstract`.

```java
public abstract class Report {
    // ...
}
```

**2. The Abstract Method:** The method that forms the "rule" is also marked `abstract` and has **no body** (no `{}`).

```java
public abstract void attack(); // Notice the semicolon!
```


## Our `Attack` Contract in Code

Here is the blueprint for all `Character` objects in our system.

```java
abstract class Character {
    private String name;
    private int hp;

    public Character(String name, int hp) {
        this.name = name;
        this.hp = hp;
    }

    public abstract void attack();
}
```


## Fulfilling the Contract: Concrete Classes

A "concrete" class is a regular class that `extends` an abstract class and provides the code for all the abstract methods. It "fulfills the contract."

    {{1}}
    ***
```java
class Thief extends Character {
    public Thief(String name, int hp) {
        super(name, hp);
    }

    @Override
    public void attack() {
        System.out.println("Thief stabs with a dagger from the shadows!");
    }
}
```
    ***

    {{2}}
    ***
```java
class Monk extends Character {
    public Monk(String name, int hp) {
        super(name, hp);
    }

    @Override
    public void attack() {
        System.out.println("Monk heals nearby units (increase hp by 1% per minute)!");
    }
}
```
    ***

{{3}}
If you forget to implement the `attack` method, Java will give you a compiler error!


## Why Not Just a Regular Class?

Why make `Character` abstract at all?

By making it `abstract`, we prevent programmers from making a generic, useless `Character` object.

```java
// This is now impossible, which is GOOD!
Character c = new Character(); // ERROR!
```

This forces developers to be specific and create a _useful_ subclass, like `Thief` or `Monk`, that actually does something.


## Summary

- **Abstract classes are blueprints** for a family of related classes.

- They enforce a **contract** that subclasses must follow.

- An **abstract method** has no body and must be implemented by subclasses.

- You **cannot create an object** from an abstract class.

- They are the perfect tool for ensuring consistency and structure in your programs.




# Interfaces
    


## A Motivating Problem

**The "What if..." Question**

We have our `Animal` hierarchy: `Dog`, `Cat`, `Bird` all extend `Animal`.

- **Problem:** We want to define a _behavior_ that isn't limited to one "family."

    {{1}}
    ***
- **Example: "Flyable"**

  - A `Bird` can fly.

  - An `Airplane` can fly.

  - A `Drone` can fly.

  - A `Kite` can fly.


    ***

    {{2}}
    ***
But...

- A `Bird` **is an** `Animal`.

- An `Airplane` **is a** `Vehicle`.

- A `Drone` **is an** `ElectronicDevice`.


They are **completely unrelated** in their "is-a" hierarchy. We can't make them all `extends Flyable` because they already `extends` something else!

**We need a way to define a _capability_ (a "can-do") that any class can have, regardless of its parent.**

    ***

## The Solution: Interfaces

**What is an Interface?**

- An interface is **purely a contract** or a "specification of behavior."

- It tells you **WHAT** a class _can do_, but not **HOW** it does it.

- It's a collection of **100% abstract methods** (and constants). It has no fields (state) and no implementation code.

- **Analogy:**

  - An **Abstract Class** is a _partial blueprint_ for a _type of thing_ (e.g., a blueprint for a "house").

  - An **Interface** is a _list of requirements_ (e.g., a "building code contract" that says you must have `connectPlumbing()` and `installElectricity()`).
        


## Interface Syntax

**Defining and Implementing a Contract**

You use the `interface` keyword to define it, and the `implements` keyword to use it.

    {{1}}

**Define the "Contract":**

    {{2}}
    ***

```java
public interface Flyable {
	void takeOff();
	void fly();
	void land();
}
```

_Notice: No method bodies. No fields._

    ***


    
    {{3}}

**Implement the "Contract":**

    {{4}}
    ***
```java
public class Bird extends Animal implements Flyable {

	// This is from the Flyable contract
	@Override
	public void takeOff() {
		System.out.println("Flapping wings to take off...");
	}

	// ... must also implement fly() and land()
}
```
    ***



    {{5}}

**Implement the "Contract":**

    {{6}}
    ***
```java
public class Airplane extends Vehicle implements Flyable {

	// This is from the Flyable contract
	@Override
	public void takeOff() {
		System.out.println("Engines spooling, rolling down runway...");
	}

	// ... must also implement fly() and land()
}
```
    ***
    
    {{7}}
    ***
- `Bird` and `Airplane` are unrelated, but they **both satisfy the `Flyable` contract**.

- A class that `implements` an interface **must** provide a concrete implementation for **all** methods in that interface.


    ***

## Abstract Class vs. Interface

**When to Use Which?**

|**Feature**|**Abstract Class**|**Interface**|
|---|---|---|
|**Purpose**|To share _common identity and code_.|To define _common behavior or capability_.|
|**Relationship**|**"is-a"** (e.g., `Dog` is an `Animal`)|**"can-do"** (e.g., `Bird` can `Fly`)|
|**Methods**|Can have **abstract** and **concrete** methods.|**Only abstract methods** (a pure "contract").*|
|**Fields (State)**|**Yes.** Can have instance variables.|**No.** Cannot have instance variables.|
|**Inheritance**|A class can **`extends` only ONE**.|A class can **`implements` MANY**.|


## The Superpower: Implementing Multiple Interfaces

**"Extend One, Implement Many"**

This is the most important difference and a core feature of object-oriented design:

- A class potentially **`extends` upto ONE parent class**.
    
    - _This defines what the object **is**._
        
    - `public class SmartPhone extends ElectronicDevice { ... }`


- A class potentially **`implements` MULTIPLE interfaces**.
    
    - _This defines what the object **can do**._
        
    - `public class SmartPhone extends ElectronicDevice implements Callable, Connectable, Playable { ... }`
        




## Example: "Extend One, Implement Many"

**Putting It All Together**

Let's model a `SmartPhone`.


**Define the Capabilities (Interfaces):**

```java
public interface Callable {
    void makeCall(String number);
    void endCall();
}

public interface Connectable {
    void connectToWifi(String ssid);
    void connectToBluetooth(String device);
}

public interface Playable {
    void playMusic(String track);
    void stopMusic();
}
```


**Define the Class:**

```java
// Extends ONE class, implements MANY interfaces
public class SmartPhone extends ElectronicDevice implements Callable, Connectable, Playable {

    // from ElectronicDevice (its "is-a" identity)
    // ... (fields like 'batteryLevel', method like 'powerOn()')

    // from Callable (its "can-do" abilities)
    @Override 
    public void makeCall(String number) { 
        /*...*/ 
    }

    @Override 
    public void endCall() { 
        /*...*/ 
    }

    // from Connectable
    @Override 
    public void connectToWifi(String ssid) { 
        /*...*/ 
    }

    @Override public void connectToBluetooth(String device) { 
        /*...*/ 
    }

    // from Playable
    @Override public void playMusic(String track) { 
        /*...*/ 
    }

    @Override public void stopMusic() { 
        /*...*/ 
    }
}
```

- A `SmartSpeaker` might also `extends ElectronicDevice` but only implement `Connectable` and `Playable`.
	
- A `LandlinePhone` might `extends ElectronicDevice` and only implement `Callable`.
     



## Why Bother? Polymorphism!

**Using Interfaces as Types**

Just like with abstract classes, you can use interfaces as variable types. This lets you write incredibly flexible code.


```java
// This list can hold ANY object, as long as it
// promises it fulfills the "Playable" contract.
List<Playable> myMusicPlayers = new ArrayList<>();

myMusicPlayers.add(new SmartPhone());
myMusicPlayers.add(new SmartSpeaker());
myMusicPlayers.add(new CarStereo());
// myMusicPlayers.add(new LandlinePhone()); // ERROR! Does not implement Playable

// We don't care WHAT they are, only that they CAN play music.
public void startTheParty(List<Playable> players) {
    for (Playable player : players) {
        player.playMusic("Happy Song");
    }
}
```


## Summary

**Key Takeaways**

- **Abstract Classes:** For **"is-a"** relationships. Share _common code and state_ among _related_ classes. (e.g., `Animal`).
    
- **Interfaces:** For **"can-do"** relationships. Define a _behavioral contract_ for _unrelated_ classes. (e.g., `Flyable`, `Comparable`).
    
- **The Rule:** A class can **`extends` ONE** abstract class, but can **`implements` MANY** interfaces.
    
- **The Power:** Interfaces allow you to write flexible, "decoupled" code by programming to a _behavior_ (`Playable`) rather than a specific _type_ (`SmartPhone`).
    

