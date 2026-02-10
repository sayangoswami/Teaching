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

import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md

-->


# ArrayLists


## The Problem with Arrays

Let's say we're storing student names. We start with:

```java
String[] students = new String[3];
students[0] = "Alice";
students[1] = "Bob";
students[2] = "Charlie";
```

**What happens when David enrolls?**

`students[3] = "David";` -> **CRASH!** `ArrayIndexOutOfBoundsException`

Arrays have a **fixed size**. Once you create them, you cannot make them bigger or smaller.


## The Solution: `ArrayList`

An `ArrayList` is a class from the Java library that acts like a **resizable array**.

- It grows automatically when you add new items.
    
- It shrinks when you remove items.
    
- It manages all the complexity (like copying data to a new, bigger array) for you!
    

Think of it as an "elastic" container for your objects.


## How to Create an `ArrayList`

You must `import java.util.ArrayList;` at the top of your file.

Because `ArrayList` is a _class_, we create it with the `new` keyword.

```java
// This is an ArrayList that can ONLY hold String objects
ArrayList<String> names = new ArrayList<>();
```

The `<String>` part is called a **Generic**. It's a "type parameter" that tells the `ArrayList` what kind of objects it's allowed to hold.

- `ArrayList<String>` -> Holds only `String`s
    
- `ArrayList<Student>` -> Holds only `Student`s
    

This makes your code much safer by preventing type errors.


## Key Method: `.add(item)`

How do we add items? We just use the `.add()` method.

```java
ArrayList<String> names = new ArrayList<>();

names.add("Alice");
names.add("Bob");
names.add("Charlie");

// No need to track an 'index'!
// The ArrayList adds "David" to the end.
names.add("David"); 
```

The `ArrayList` handles all the "where do I put this?" logic for you.


## Key Method: `.get(index)`

How do we retrieve an item? We use the `.get()` method with an index.

**It's just like `array[index]`, but with a method call.**

```java
// Gets the item at index 0
String firstStudent = names.get(0); // "Alice"

// Gets the item at index 2
String thirdStudent = names.get(2); // "Charlie"
```


## Key Method: `.size()`

How do we get the current number of items? We use the `.size()` method.

**This is the equivalent of `array.length`.**

```java
ArrayList<String> names = new ArrayList<>();
names.add("Alice");
names.add("Bob");

int count = names.size(); // count is 2
```


## Other Key Methods

A few more common methods you'll use all the time:

### `.set(index, item)` (Update)

Replaces the item at a specific index.

```java
names.set(0, "Alice Smith"); // Changes index 0 from "Alice" to "Alice Smith"
```

### `.remove(index)` (Remove)

Removes the item at a specific index. Everything after it shifts left.

```java
names.remove(1); // Removes "Bob" (at index 1). "Charlie" moves to index 1.
```


## How to Loop: The "For-Each" Loop

The _easiest_ way to loop through an `ArrayList` is with a "for-each" loop.

```java
ArrayList<String> names = ... ;

// This loop will run once for every item in the list.
// The 'name' variable will hold the current item.

for (String name : names) {
    System.out.println(name);
}
```

**Output:** Alice Smith Charlie David


## How to Loop: The Standard `for` Loop

You can also use a standard `for` loop, using `.size()` and `.get()`.

```java
ArrayList<String> names = ... ;

for (int i = 0; i < names.size(); i++) {
    
    // Get the item at the current index 'i'
    String name = names.get(i);
    
    System.out.println(name);
}
```

This is useful if you need the `index` number for some reason.


## CRITICAL: Primitives vs. Objects

`ArrayList` can **only** hold Objects. It **cannot** hold primitives.

```java
ArrayList<int> myNumbers;    // ERROR! Will not compile.
ArrayList<double> myGrades; // ERROR! Will not compile.
```

**Solution:** We must use the "Wrapper Classes" (which you've seen before).

- `int` -> `Integer`
    
- `double` -> `Double`
    
- `boolean` -> `Boolean`
    

```java
// This is correct!
ArrayList<Integer> myNumbers = new ArrayList<>();
myNumbers.add(10); // Java auto-converts the 'int' 10 to an 'Integer'
myNumbers.add(20);

int firstNum = myNumbers.get(0); // Auto-converts 'Integer' back to 'int'
```


## `ArrayList` vs. `Array`

|Feature|`Array` (e.g., `String[]`)|`ArrayList<String>`|
|---|---|---|
|**Size**|**Fixed**. Set at creation.|**Dynamic**. Grows and shrinks.|
|**Type**|Can hold primitives (e.g., `int[]`)|**Objects only**. (Uses `Integer` for `int`).|
|**Get Size**|`.length` (a property)|`.size()` (a method)|
|**Get Item**|`array[i]`|`list.get(i)`|
|**Add Item**|`array[i] = x;` (Requires free index)|`list.add(x)` (Adds to end)|
|**Change Item**|`array[i] = x;`|`list.set(i, x)`|
|**Remove Item**|Very difficult! (Must create a new array).|`list.remove(i)` (Easy!)|


## Programming Problem 1

**Goal:** Write a program that acts as a "shopping list".

1. `import java.util.ArrayList;`

2. Create an `ArrayList` that can hold `String`s, named `shoppingList`.

3. `.add()` the following items: "Eggs", "Milk", "Bread", "Butter", "Orange Juice".

4. Print the current size of the list in the following format: `There are <n> items in the shopping list`

5. Use a "for-each" loop to print out all items in the list, one item per line.

6. `.remove()` the "Milk" (at index 1).

7. `.set()` the "Eggs" (at index 0) to "Dozen Eggs".

8. Print the final list using a standard `for` loop in the following format:

```
1. Dozen Eggs
2. Bread
3. Butter
4. Orange Juice
```

```java
public class Main {
    public static void main(String[] args) {
        //
    }
}
```
@LIA.java(Main)

## Programming Problem 2

- Refactor the provided procedural code (`lStudentManager.java`) into a class-based implementation.
- Encapsulate related data and behavior in a `Student` class.
- Replace all uses of parallel arrays with objects.
- Add a method to your class to print student info.
- Add a method to add a new student (dynamically, not just a stub).
- Write a short main program to demonstrate creating, adding, and printing students.
- Add a field for GPA and a method to update it.
- Implement a method to search for a student by ID.


```java
public class StudentManager {
    public static void main(String[] args) {
        String[] names = {"Alex", "Sam", "Jordan"};
        int[] ids = {1001, 1002, 1003};
        printAll(names, ids);
        addStudent(names, ids, "Taylor", 1004); // This won't actually add due to fixed array size
    }

    public static void printAll(String[] names, int[] ids) {
        for (int i = 0; i < names.length; i++) {
            System.out.println("Student: " + names[i] + ", ID: " + ids[i]);
        }
    }

    public static void addStudent(String[] names, int[] ids, String name, int id) {
        // This is a stub: can't really add to fixed-size arrays
        System.out.println("(Not implemented) Would add: " + name + ", " + id);
    }
}
```
@LIA.java(StudentManager)

## Programming Problem 3

- Write a Java class `Book` to represent a book in a library. Each book has a title, an author, and a unique ID number.
- Implement a `Library` class that can add new books, print all books, and search for a book by ID.
- Write a `main` method to demonstrate adding at least three books, printing them, and searching for a book by ID.

**Sample test cases:**
- Add books: ("The Hobbit", "J.R.R. Tolkien", 101), ("1984", "George Orwell", 102), ("Clean Code", "Robert C. Martin", 103)
- Print all books
- Search for ID 102

Expected output:
```
Book: The Hobbit by J.R.R. Tolkien (ID: 101)
Book: 1984 by George Orwell (ID: 102)
Book: Clean Code by Robert C. Martin (ID: 103)
Book found: 1984 by George Orwell (ID: 102)
```

```java
public class Library {
    public static void main(String[] args) {
        //
    }
}
```
@LIA.java(Library)