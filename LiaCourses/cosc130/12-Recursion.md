<!--
author:   Sayan Goswami
email:	sgoswami@smcm.edu
version:  0.1.0
language: en
narrator: US English Female
comment: Recursion

link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Next:ital,wght@0,200..800;1,200..800&display=swap
link: https://fonts.googleapis.com/css2?family=Atkinson+Hyperlegible+Mono:ital,wght@0,200..800;1,200..800&display=swap
import: https://raw.githubusercontent.com/sayangoswami/lia-annotate/main/README.md
link: https://cdn.jsdelivr.net/gh/sayangoswami/Teaching@main/LiaCourses/theme.css
import: https://raw.githubusercontent.com/LiaScript/CodeRunner/master/README.md
import: https://raw.githubusercontent.com/liaScript/mermaid_template/master/README.md

-->

# An Introduction to Recursion


## What is Recursion?

***Recursion:*** **Solving a problem by using the solution to a** _**smaller version of the exact same problem**_**.**

In programming, recursion is a technique where a **function keeps calling itself**, on smaller and smaller arguments until the problem becomes trivial to solve.


## The Two Parts of Any Recursive Function

Every _correct_ recursive function must have two parts:

**1. The Base Case**

- A *trivial*, non-recursive condition that **stops** the recursion.

- **What it does:** It provides a direct, simple answer for the _easiest_ version of the problem.


**2. The Recursive Step**

- The part where the function calls itself, but with a **simpler or smaller** input.

- **What it does:** It moves the problem _one step closer_ to the base case.

- You take a leap of faith that the smaller problem will solve itself.


## Example 1: `leapOfFaith(int n)`

Let's write a function that counts down from `n` to 0 and prints "Stop!".

```java
public class Main {
    public static void leapOfFaith(int n) {
        
        // 1. Base Case:
        if (n == 0) System.out.println("Stop!");
        
        // 2. Recursive Step:
        else {
            System.out.println(n);
            leapOfFaith(n - 1); // Solves a *simpler* problem (n-1)
        }
    }

    public static void main(String[] args) {
        leapOfFaith(10);
    }
}
```
@LIA.java(Main)


## How Does This Work? Chained Calls

When a function calls another, the first one waits for the second one to finish before it can continue.

If a function calls itself, the same rule applies!

- `leapOfFaith(3)` calls `leapOfFaith(2)` and waits. 

  - `leapOfFaith(2)` calls `leapOfFaith(1)` and waits.  

    - `leapOfFaith(1)` calls `leapOfFaith(0)` and waits.  

      - `leapOfFaith(0)` hits the base case, prints, and finishes. 

    - Now `leapOfFaith(1)` can stop waiting and finish. 

  - Now `leapOfFaith(2)` can stop waiting and finish. 

- Now `leapOfFaith(3)` can stop waiting and finish. 


## Tracing `leapOfFaith(3)`

Let's trace the order of operations for `leapOfFaith(3)`:

`leapOfFaith(3)` is called:

- `n=3`. Not base case.

- Prints `"3"`.

- Calls `leapOfFaith(2)` (and waits).

  - `n=2`. Not base case.

  - Prints `"2"`.

  - Calls `leapOfFaith(1)` (and waits).

    - `n=1`. Not base case.

    - Prints `"1"`.

    - Calls `leapOfFaith(0)` (and waits).

      - `n=0`. Base Case!

      - Prints "Stop!".

      - `leapOfFaith(0)` finishes.

    - `leapOfFaith(1)` finishes (it was done after its call).

  - `leapOfFaith(2)` finishes (it was done after its call).

- `leapOfFaith(3)` finishes (it was done after its call).


## The Most Important Error: Infinite Recursion

What happens if we forget the base case?

```java
public static void leapOfFaith(int n) {
    // NO BASE CASE!
    System.out.println(n);
    leapOfFaith(n - 1); 
}
```


Let's trace `leapOfFaith(3)`:

- `leapOfFaith(3)` calls `leapOfFaith(2)`...
- `leapOfFaith(2)` calls `leapOfFaith(1)`...
- `leapOfFaith(1)` calls `leapOfFaith(0)`...
- `leapOfFaith(0)` calls `leapOfFaith(-1)`...
- `leapOfFaith(-1)` calls `leapOfFaith(-2)`... it never stops!

Each new function call uses a little bit of memory to "wait". Eventually, the program runs out of memory for all these waiting calls!

This causes a **CRASH**: `Exception in thread "main" java.lang.StackOverflowError`

If you see this, you almost certainly forgot your base case or are not making the problem simpler!

## Example 2: Factorial `(n!)`

Let's look at a function that _returns_ a value.

**Mathematical Definition:** `n! = n * (n-1) * (n-2) * ... * 1` 
- `5! = 5 * 4 * 3 * 2 * 1 = 120`

**Recursive Definition:**

- `n! = n * (n-1)!` <-- Recursive Step

- `1! = 1` <-- Base Case


This mathematical definition is _already recursive_! This makes it easy to code.

## Factorial Code

```java
public class Main {
    public static int factorial(int n) {

        // 1. Base Case:
        if (n == 1) {
            return 1;
        } 
        
        // 2. Recursive Step:
        else {
            // n * (solution to simpler problem)
            return n * factorial(n - 1);
        }
    }

    public static void main(String[] args) {
        System.out.println(factorial(4));
    }
}
```
@LIA.java(Main)

## Tracing factorial(3) (The Substitution Model)

We solve this by "diving in" to find the answer to the simpler problems first.

`factorial(3) -> return 3 * factorial(2);`

(Must solve `factorial(2)` first)

`  -> factorial(2) -> return 2 * factorial(1);`

(Must solve `factorial(1)` first)

`    -> factorial(1) -> return 1;  (Base Case Reached!)`

## Tracing factorial(3) (The Return Trip)

Now, we "substitute" the answers back up the chain.

We know `factorial(1)` is 1.

`  -> factorial(2) -> return 2 * 1;`  (Which is 2)

We now know `factorial(2)` is 2.

`-> factorial(3) -> return 3 * 2;`  (Which is 6)

Final Answer: 6



## Example 3: `reverseString(String s)`

Let's reverse a string. `reverse("cat")` should return `"tac"`

How do we make this simpler?

- **Problem:** `reverse("cat")`

- **Simpler Problem:** `reverse("at")` (which gives `"ta"`)

- **How to combine?** `reverse("cat") = reverse("at") + 'c'`


**Let's formalize this:**

- **Base Case:** If `s` is empty or 1 char, return `s`.

- **Recursive Step:** `reverse(s)` = `reverse(s.substring(1))` + `s.charAt(0)`


## `reverseString(String s)` Code

```java
public class Main {
    public static String reverseString(String s) {
        
        // 1. Base Case:
        if (s.length() <= 1) {
            return s;
        }
        
        // 2. Recursive Step:
        else {
            String simplerProblem = s.substring(1);
            String solutionToSimpler = reverseString(simplerProblem);
            
            return solutionToSimpler + s.charAt(0);
        }
    }
    public static void main(String[] args) {
        System.out.println(reverseString("dog"));
    }
}
```
@LIA.java(Main)


## Tracing `reverseString("cat")`

`reverse("cat")`

- Calls `reverse("at")`.

- **PAUSES**, waits for result...


`reverse("at")`

- Calls `reverse("t")`.

- **PAUSES**, waits for result...


`reverse("t")`

- **Base Case!** `s.length()` is 1.

- Returns `"t"`.


`reverse("at")` (Resumes)

- `solutionToSimpler` is `"t"`.

- `s.charAt(0)` is `'a'`.

- Returns `"t" + 'a'` (which is `"ta"`).


`reverse("cat")` (Resumes)

- `solutionToSimpler` is `"ta"`.

- `s.charAt(0)` is `'c'`.

- Returns `"ta" + 'c'` (which is `"tac"`).


**Final Answer:** `"tac"`

---

## How to "Think Recursively"

Don't try to trace the _whole stack_ in your head! You'll get lost.

Instead, just follow these three steps:

1. **Find the Base Case:** What is the _absolute simplest_ version of this problem I can solve directly? (e.t., `n=1`, `n=0`, empty string).

2. **Find the Recursive Step:**

    - How can I make the problem **one step simpler**? (e.g., `n-1`, `s.substring(1)`).
        
    - **Trust the "Leap of Faith"**: _Assume_ your function works perfectly for that simpler problem.
        
3. **Combine:** How do I use the result from the simpler problem to solve my _current_ problem? (e.g., `n * simplerResult`, `simplerResult + char`).

