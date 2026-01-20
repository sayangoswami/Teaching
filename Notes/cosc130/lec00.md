<!--
author:   Sayan Goswami
email:    sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible:ital,wght@0,400;0,700;1,400;1,700&display=swap

link: https://fonts.googleapis.com/css2?family=Fira+Code:wght@300..700&family=Fira+Sans:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap

link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css

import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md

-->


# CS2: Object-Oriented Programming in Java


---

## Lecture 0 – Getting Started

- **Instructor:** Sayan Goswami
- **Office:** Schaefer Hall, Room 152
- **Office Hours:** Monday and Wednesday from 3:00 PM to 4:00 PM or [by appointment.](https://calendar.app.google/US4qyrTFrBZs72yG8)
- **Email:** sgoswami@smcm.edu
- **Textbook:** None required
- **Prerequisites:** *COSC 120*

---

## Welcome to COSC 130

- Focus: **Java and Object-Oriented Design**
- Build larger, more maintainable programs
- Practice with **inheritance, polymorphism, interfaces, and libraries**
- Capstone project at the end


---

## What You Should Already Know

From COSC 120:

- Variables and types  
- Branching (`if/else`)  
- Loops 
- Arrays ??
- Methods  
- Basic debugging  

---

## Where We’re Going

From *small problems* → *larger systems*  

- Encapsulation  
- Object-Oriented Design  
- Aggregation & Composition  
- Inheritance  
- Polymorphism  
- Abstract classes & Interfaces  
- Standard Libraries & Generics  
- Project  

---

## Learning Outcomes

By the end of this course, you will be able to:

- **Design and implement** object-oriented programs in Java that integrate encapsulation, inheritance, polymorphism, and interfaces.
- **Analyze** and **debug** Java programs to trace execution, identify errors, and improve correctness.
- **Evaluate** alternative design choices (e.g., composition vs inheritance, abstract classes vs interfaces) and justify trade-offs.
- **Create** a medium-scale Java project that demonstrates sound object-oriented design principles.

---

# Course Logistics
 

---

## Quick Warm-Up: Types

```java
int age = 20;
double pi = 3.14159;
boolean isOn = true;
String name = "Ada Lovelace";
```
    {{1}}
Which of these are primitives?

    {{2}}
Which is an object?

---

## Operators Refresher

- Arithmetic: `+ - * / %`
    
- Assignment: `=`
    
- Comparison: `== != < > <= >=`
    
- Logical: `&& || !`

---

## Quick Check

If `a = 10, b = 3`:

- `a / b = ?`
    
- `a % b = ?`
    
- `(a > b) && (b > 0) = ?`


---

## Java Program Refresher

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, COSC130!");
    }
}
```

Breakdown:

- `class` definition
    
- `main` method
    
- `System.out.println` statement


---

## Assignment Submission Setup

*Walkthrough of submission process* - We will submit a dummy assignment now.

---


## Install Java and VS Code

Install the Visual Studio Java coding pack from the following website:

**[code.visualstudio.com/docs/languages/java](https://code.visualstudio.com/docs/languages/java)**

## First Hands-On Exercise


Write a program that:

- Declares two integers
    
- Adds, subtracts, multiplies, and divides them
    
- Prints results to the console

---

## Wrap-Up

- Today: refresher on **types, operators**, and **setup**
    
- Next time: refresher on **branching**
    
- Homework 0: environment check + simple program