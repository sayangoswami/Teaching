<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female
comment: String Methods

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&display=swap
link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&display=swap
import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md
link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css
import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md
import: https://raw.githubusercontent.com/liaScript/mermaid_template/master/README.md

-->



# String Methods

---

## Introduction to Java Strings

**The Core of Text Processing**

- **Definition:** A `String` is a sequence of characters. In Java, it is not a primitive type (like `int` or `char`) but a fully-fledged **Object**.
    
- **The `java.lang` Package:** Since Strings are used everywhere, they are imported automatically.
    
- **Key Distinction:** Unlike many other objects, Strings have "Literal" support—you can create them with double quotes without using the `new` keyword.
    

---

## The Immutable Nature

**Why You Can't "Change" a String**

- **Immutability:** Once a `String` object is created in memory, its value **cannot** be altered.
    
- **The String Constant Pool:** To save memory, Java stores one copy of each unique string literal in a special "Pool."
    
- **The Result:** When you "modify" a string, Java actually:
    
    1. Leaves the original string alone.
        
    2. Creates a brand new string with the changes.
        
    3. Points your variable to the new memory address.
        

---

## The Equality Trap

**Identity vs. Equivalence**

- **Reference Equality (`==`):** Compares memory addresses. It asks, "Are these the exact same object in RAM?"
    
- **Object Equality (`.equals()`):** Compares the actual character sequence. It asks, "Do these two different objects contain the same text?"
    
- **Lexicographical Comparison (`.compareTo()`):** * Returns `0` if equal.
    
    - Returns a **negative integer** if the string comes before the argument alphabetically.
        
    - Returns a **positive integer** if it comes after.
        

--

### **Code Example:**

```java
String s1 = "Apple";
String s2 = new String("Apple");

System.out.println(s1 == s2);      // FALSE (Different memory addresses)
System.out.println(s1.equals(s2)); // TRUE (Same characters)
```

---


## Indexing and Inspection

**Getting to Know Your String**

To safely process a String, you first need to know its size and whether it actually contains meaningful data.

* **`.length()`**: Returns the total number of characters.
* **`.charAt(int index)`**: Returns the character at a specific position.
* *Warning:* If you pass an index $< 0$ or $\ge$ `.length()`, Java throws a `StringIndexOutOfBoundsException`.


* **`.isEmpty()`**: Returns `true` only if `length` is `0`.
* **`.isBlank()`**: Returns `true` if the string is empty **OR** contains only whitespace characters (spaces, tabs, newlines).

--
### **Code Example:**

```java
String state = "Maryland";
char initial = state.charAt(0);     // 'M'
char last    = state.charAt(7);     // 'd' (length is 8)

String space = "   ";
System.out.println(space.isEmpty()); // false (length is 3)
System.out.println(space.isBlank()); // true  (no "real" content)

```

---

## The "Null" vs. "Empty" Distinction

**Understanding Variable States**

In Java, there is a massive difference between a String that is **empty** and a String that is **null**. This is a frequent source of `NullPointerException` (NPE) in student projects.

| Feature | `String s = "";` (Empty) | `String s = null;` (Null) |
| --- | --- | --- |
| **Definition** | A valid String object with no characters. | No object exists; the variable points to nothing. |
| **Memory** | Occupies space in the Heap. | Occupies no object space. |
| **`.length()`** | Returns `0`. | **Throws `NullPointerException**` |
| **Method Calls** | Works fine. | **Crashes the program.** |

---

## The "Safety First" Pattern

When checking a string, always check for `null` **before** checking for content. Java uses "short-circuit" evaluation, so if the first part is false, it stops checking.

```java
// SAFE CHECK
if (str != null && !str.isEmpty()) {
    System.out.println("String has valid data!");
}

// DANGEROUS CHECK
if (str.isEmpty() && str != null) { 
    // If str is null, .isEmpty() crashes BEFORE the null check happens!
}

```

---


### Searching & Positioning

**Finding the Needle in the Haystack**

You’ll often need to parse data (like a URL or a file path). Java provides several tools to locate characters or patterns without manually looping through the string.

--

**The Search Tools:**

* **`.indexOf(String str)`**: Returns the index of the **first** occurrence. Returns `-1` if not found.
* **`.lastIndexOf(String str)`**: Returns the index of the **last** occurrence (searches backwards).
* **`.contains(CharSequence s)`**: Returns a `boolean`. Use this when you don't care *where* the text is, just that it exists.
* **`.startsWith(String prefix)`** / **`.endsWith(String suffix)`**: Checks the boundaries. Great for file extensions or protocols.

--

**Code Example: Parsing a URL**

```java
String url = "https://www.umd.edu/index.html";

// Boolean Checks
boolean isSecure = url.startsWith("https"); // true
boolean isWebpage = url.endsWith(".html");   // true
boolean isUniversity = url.contains(".edu"); // true

// Index Finding
int firstDot = url.indexOf(".");     // Index 11
int lastDot  = url.lastIndexOf(".");  // Index 23 (before 'html')

```

---


## Extraction & Slicing

**The `substring()` Method**

Once you have located an index using `indexOf()`, the next step in data parsing is extracting that specific piece of information. This is where `substring()` becomes your most powerful tool.

--
### **The Two Versions:**

1. **`substring(int beginIndex)`**: Returns everything from the start index to the very end of the string.
2. **`substring(int beginIndex, int endIndex)`**: Returns a specific "slice."

### **The "Golden Rule" of Ranges:**

In Java, the `beginIndex` is **inclusive** (included in the result), but the `endIndex` is **exclusive** (NOT included).

> **Math Tip:** The length of your result is always **(End - Begin)**.

--
### **Code Example: Parsing an Email**

```java
String email = "terrapin@umd.edu";
int atSymbol = email.indexOf("@"); // Index 8

// 1. Extract the Username (From 0 up to '@')
String user = email.substring(0, atSymbol); 
// result: "terrapin" (Index 8 is NOT included)

// 2. Extract the Domain (From '@' + 1 to the end)
String domain = email.substring(atSymbol + 1);
// result: "umd.edu"

```

### **Common Error: Index Out of Bounds**

If you provide an index that is negative or greater than the string's length, your program will crash with a `StringIndexOutOfBoundsException`. Always validate your indices (or check if `indexOf` returned `-1`) before slicing!

---

## Transformation & Modification

**Creating New Versions of Data**

Because Strings are **immutable**, these methods do not change the original String. Instead, they build a brand new String and return its memory address. If you don't assign the result back to a variable, the change is lost!

--
### **The Transformation Toolkit:**

* **.toUpperCase() / .toLowerCase()**: Standardizes text (great for case-insensitive input).
* **.trim()**: Removes leading/trailing "basic" whitespace (spaces, tabs, newlines).
* **.replace(old, new)**: Swaps all occurrences of a character or substring with something else.
* **.replaceAll(regex, new)**: Uses Regular Expressions to swap patterns (more advanced).

--
### **Code Example: Cleaning User Input**

```java
String input = "   ID_452_Dept_CS   ";

// 1. Remove the surrounding spaces
input = input.trim(); // "ID_452_Dept_CS"

// 2. Standardize to lowercase
input = input.toLowerCase(); // "id_452_dept_cs"

// 3. Swap underscores for hyphens
String cleanID = input.replace("_", "-"); // "id-452-dept-cs"

System.out.println("Original: " + input); // Notice 'input' stayed at step 2
System.out.println("Cleaned: " + cleanID);

```

--
### **The Common Mistake:**

A very common error is forgetting to capture the return value.

```java
String name = "  bob  ";
name.trim(); // This does NOTHING to the 'name' variable!
System.out.println(name); // Still prints "  bob  "

name = name.trim(); // This UPDATES the 'name' variable.

```


---

## Splitting and Joining

**Handling Data Arrays and Delimiters**

In many situations, you will receive a single line of data (like a row from a spreadsheet or a configuration file) and need to break it into individual pieces.

--
### **The Methods:**

* **`.split(String regex)`**: Breaks a String into an **array of Strings** based on a "separator" (delimiter).
* **`String.join(delimiter, elements)`**: A **static** method that takes an array or list and stitches them together with a separator in between.

--
### **Code Example: Processing CSV Data**

```java
String rawData = "Apple,Banana,Cherry,Date";

// 1. Split the string into an array
String[] fruits = rawData.split(","); 
// fruits[0] is "Apple", fruits[1] is "Banana", etc.

// 2. Modify one element
fruits[1] = "Blueberry";

// 3. Join them back into a single string with a new look
String formatted = String.join(" -> ", fruits);
// Result: "Apple -> Blueberry -> Cherry -> Date"

```

--
### **The Advantage of `String.join()`:**

Before this method existed, programmers had to use a loop and a "comma check" to avoid having a trailing separator at the end (e.g., `Apple, Banana, Cherry,`). `String.join()` handles that logic for you automatically—it only puts the delimiter *between* items.


---

## Performance — Why Efficiency Matters

**The `+` Operator vs. `StringBuilder`**

>A simple rule of thumb: **Don't use `+` inside a loop.**

### **The Problem: The "Copying" Penalty**

When you use `+` to add text to a String, Java doesn't just "tack it on." Because Strings are immutable, Java creates a **brand new object** and copies every single old character into it.

* If you do this in a loop 1,000 times, you are creating 1,000 objects and copying thousands of characters over and over. This makes your program sluggish.

--
### **The Solution: `StringBuilder`**

Think of `StringBuilder` like a "Draft" or a "Work-in-Progress" bucket. It allows you to add, remove, or change characters without creating a new object every time.

### **Code Comparison:**

```java
// DON'T: This gets exponentially slower as 'n' increases
String result = "";
for (int i = 0; i < 1000; i++) {
    result += i; // Java creates 1000 temporary objects here!
}

// DO: This is nearly instant
StringBuilder sb = new StringBuilder();
for (int i = 0; i < 1000; i++) {
    sb.append(i); // Modifies the same object in place
}
String finalString = sb.toString(); // Convert to String at the very end

```

--
### **When to use which?**

* **Use `+`** for simple, one-line combinations (e.g., `"Hello " + name`).
* **Use `StringBuilder`** anytime you are building a string inside a **`for`** or **`while`** loop.


---

## Clean Output with String Formatting

**Moving Beyond Messy Concatenation**

When you need to print complex reports or align columns of data, using `+` to join strings, numbers, and decimals becomes a nightmare of quotes and plus signs. `String.format()` (and `System.out.printf`) allows you to create a "template" first.

--
### **The Format Template**

You use **placeholders** (starting with `%`) to tell Java where to put your variables and how they should look.

* **`%s`**: Strings
* **`%d`**: Integers (Whole numbers)
* **`%f`**: Floating point numbers (Decimals)
* **`%.2f`**: Round to exactly 2 decimal places.

--
### **Code Example: Professional Receipts**

```java
String item = "Coffee";
double price = 4.50;
int quantity = 3;
double total = price * quantity;

// Messy way:
System.out.println("Item: " + item + " | Qty: " + quantity + " | Total: $" + total);

// Professional way:
String report = String.format("Item: %s | Qty: %d | Total: $%.2f", item, quantity, total);
System.out.println(report);
// Output: Item: Coffee | Qty: 3 | Total: $13.50

```

--
### **Why use this?**

1. **Readability:** The template looks like the final sentence.
2. **Precision:** It’s the easiest way to round numbers for currency or scientific data without using complex Math functions.
3. **Alignment:** You can even add numbers (like `%10s`) to force columns to align perfectly in the console.


