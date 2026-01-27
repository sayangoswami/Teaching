

# CS2 Worksheet: Method Overloading Practice



---

## Pair 1: Greeting Messages

- **Instructor Problem**:  
    Write a `Greeter` class with two `greet()` methods:
    
    - `greet(String name)` → prints “Hello, [name]!”
        
    - `greet()` → prints “Hello, there!”  
        Create a main method to test both versions.
        
- **Student Problem**:  
    Write a `Welcomer` class with overloaded methods `welcome()`:
    
    - `welcome(String city)` → prints “Welcome to [city]!”
        
    - `welcome()` → prints “Welcome, traveler!”
        

---

## Pair 2: Areas of Shapes

- **Instructor Problem**:  
    Write a `Geometry` class with two `area()` methods:
    
    - `area(int side)` → returns area of a square
        
    - `area(int length, int width)` → returns area of a rectangle
        
- **Student Problem**:  
    Write a `Shapes` class with overloaded `perimeter()` methods:
    
    - `perimeter(int side)` → perimeter of a square
        
    - `perimeter(int length, int width)` → perimeter of a rectangle
        

---

## Pair 3: Distance Calculation

- **Instructor Problem**:  
    Write a `Distance` class with two `calculate()` methods:
    
    - `calculate(int x1, int y1, int x2, int y2)` → distance between two 2D points
        
    - `calculate(int x1, int y1, int z1, int x2, int y2, int z2)` → distance between two 3D points
        
- **Student Problem**:  
    Write a `Midpoint` class with overloaded `find()` methods:
    
    - `find(int x1, int y1, int x2, int y2)` → midpoint of two 2D points
        
    - `find(int x1, int y1, int z1, int x2, int y2, int z2)` → midpoint of two 3D points
        

---

## Pair 4: Printing Arrays

- **Instructor Problem**:  
    Write a `Printer` class with two `printArray()` methods:
    
    - `printArray(int[] arr)` → prints all integers in the array
        
    - `printArray(String[] arr)` → prints all strings in the array
        
- **Student Problem**:  
    Write a `Show` class with overloaded `display()` methods:
    
    - `display(double[] arr)` → prints all doubles in the array
        
    - `display(char[] arr)` → prints all characters in the array
        

---

## Pair 5: Temperature Conversion

- **Instructor Problem**:  
    Write a `Converter` class with two `toCelsius()` methods:
    
    - `toCelsius(double fahrenheit)` → converts Fahrenheit to Celsius
        
    - `toCelsius(double kelvin, boolean isKelvin)` → converts Kelvin to Celsius
        
- **Student Problem**:  
    Write a `Converter2` class with overloaded `toFahrenheit()` methods:
    
    - `toFahrenheit(double celsius)` → converts Celsius to Fahrenheit
        
    - `toFahrenheit(double kelvin, boolean isKelvin)` → converts Kelvin to Fahrenheit
        

---

## Pair 6: Bank Transactions

- **Instructor Problem**:  
    Write a `BankAccount` class with two `deposit()` methods:
    
    - `deposit(int amount)` → deposits an integer amount
        
    - `deposit(double amount)` → deposits a decimal amount
        
- **Student Problem**:  
    Write a `Wallet` class with overloaded `withdraw()` methods:
    
    - `withdraw(int amount)` → withdraws an integer amount
        
    - `withdraw(double amount)` → withdraws a decimal amount
        

---

## Pair 7: String Repeat

- **Instructor Problem**:  
    Write a `Repeater` class with two `repeat()` methods:
    
    - `repeat(String s, int n)` → repeats string `s`, `n` times
        
    - `repeat(char c, int n)` → repeats character `c`, `n` times
        
- **Student Problem**:  
    Write a `Multiplier` class with overloaded `multiply()` methods:
    
    - `multiply(String s, int n)` → returns concatenated string `s` `n` times
        
    - `multiply(int num, int n)` → multiplies number `num` by `n`
        

---

## Pair 8: Volume of Solids

- **Instructor Problem**:  
    Write a `Volume` class with overloaded `find()` methods:
    
    - `find(double side)` → volume of a cube
        
    - `find(double radius, double height)` → volume of a cylinder
        
- **Student Problem**:  
    Write a `SurfaceArea` class with overloaded `calculate()` methods:
    
    - `calculate(double side)` → surface area of a cube
        
    - `calculate(double radius, double height)` → surface area of a cylinder
        

---

## Pair 9: Employee Salary

- **Instructor Problem**:  
    Write an `Employee` class with two `salary()` methods:
    
    - `salary(int basePay)` → returns base pay
        
    - `salary(int basePay, int bonus)` → returns total pay with bonus
        
- **Student Problem**:  
    Write a `Contractor` class with overloaded `payment()` methods:
    
    - `payment(int hours, int rate)` → total pay (hours × rate)
        
    - `payment(int hours, int rate, int overtime)` → includes overtime
        

---

## Pair 10: Time Display

- **Instructor Problem**:  
    Write a `Clock` class with two `showTime()` methods:
    
    - `showTime(int hour, int minute)` → displays “HH:MM”
        
    - `showTime(int hour, int minute, int second)` → displays “HH:MM:SS”
        
- **Student Problem**:  
    Write a `Stopwatch` class with overloaded `display()` methods:
    
    - `display(int seconds)` → shows total seconds
        
    - `display(int minutes, int seconds)` → converts to seconds and shows
        

