# PA7: Type Checker

## Overview

In this assignment, you will work with TYPE1, a statically-typed variant of our V-language series that includes:

- Integer and Boolean primitive types
- Type annotations for variables and procedures
- Static type checking before evaluation
- Type inference for expressions
- Comprehensive type error detection

The TYPE1 language enforces type safety through static checking, catching type errors before program execution.

## Learning Objectives

- Implement and understand static type checking in programming languages
- Work with type inference and type safety
- Distinguish between static and dynamic typing approaches
- Add type annotations to procedures and variables
- Implement type error reporting and detection
- Understand type expressions and their evaluation

## Q1: Adding Type Annotations

The `TYPE1/program` file contains a program written in a dynamically-typed language that needs to be updated to run in TYPE1's statically-typed environment.

The program defines a procedure named `compose` that takes two procedures as arguments. Each of these procedures takes one integer argument and returns an integer result. The `compose` procedure returns a new procedure that composes the passed procedures. The returned procedure takes an integer, applies one procedure to the integer getting a new integer, and then applies the other procedure to that integer to get another integer, which it returns.

### Your Task

Add type expressions to `TYPE1/program` so it:

1. Passes TYPE1's type checker
2. Runs correctly and produces the expected output

### How to Build and Test

Within the TYPE1 directory:

```bash
# Compile the TYPE1 language
plccmk -c grammar

# Run your program
rep < program

# Or with direct Java execution
java -cp Java/ Rep < program
```

After the program prints its output, you'll be at a `rep` prompt: `-->`.
Press `ctrl+D` or `ctrl+C` to exit.

### Expected Output

Your correctly typed program should produce:

```
26
36
7
625
49
```

## Q2: Type Expression Analysis

What is the type of the following let expression?

```
let
  p = proc(f:[int=>int]):[int=>int] proc(x:int):int .f(.f(x))
  q = proc(t:int):int *(t,t)
in
  .p(q)
```

Give your answer as a type expression in the format used by TYPE1 (e.g., `[int=>int]` for a procedure that takes an int and returns an int).

### ANSWER

```
[int=>int]
```

## Q3: Identifying Type Errors

What's wrong with the following expression in TYPE1? Don't correct them, just identify and explain the type errors.

```
if add1(0) then +(4,5) else {let p=proc():int 9 in p}
```

### ANSWER

```
There are two type errors in this expression:

1. The test condition `add1(0)` returns type `int` (specifically the value 1), but an if-expression requires a `bool` type for its test condition. The add1 primitive has type [int=>int], so add1(0) evaluates to an integer, not a boolean.

2. The then-branch `+(4,5)` has type `int` (evaluates to 9), while the else-branch `{let p=proc():int 9 in p}` has type `[=>int]` (a procedure taking no arguments and returning an int). In TYPE1, both branches of an if-expression must have the same type, but here we have a type mismatch between int and [=>int].
```

## Q4: Creating Type Error Examples

Below are the type errors that TYPE1's checker detects. For each error, create a minimal example in TYPE1 that demonstrates the error. Test your examples to verify they produce the expected type error.

### An attempt to define a procedure whose declared return type does not match the type of the body of the procedure

```
proc(x:int):bool +(x,1)
```

### An attempt to apply a non-procedure as a procedure

```
let x = 5 in .x(3)
```

### An attempt to apply a procedure to the wrong number of actual parameters

```
let f = proc(x:int,y:int):int +(x,y) in .f(5)
```

### An attempt to apply a procedure to actual parameters whose types do not match the declared types of the corresponding formal parameters

```
let f = proc(x:int):int add1(x) in .f(true)
```

### An attempt to use a non-boolean as the test in an if statement

```
if 42 then 1 else 0
```

### An attempt to have expressions of different types in the then and else parts of an if statement

```
if true then 42 else false
```

### An attempt to assign a value to a LHS variable in a set expression where the type of the variable does not match the type of the RHS expression

```
declare x : int
define x = 0
set x = true
```

## Additional Exercises (Optional)

As an additional exercise (not to be submitted), correct each of the type errors you created in Q4 and confirm that they work properly.

## TYPE1 Language Reference

### Type Expressions

TYPE1 supports the following type expressions:

- `int` - Integer type
- `bool` - Boolean type
- `[T1,T2,...,Tn=>T]` - Procedure type taking types T1,T2,...,Tn and returning type T

### Type Annotations

Variables and procedures require type annotations:

```
% Variable declarations
declare x : int
declare f : [int=>int]

% Procedure definitions with type annotations
proc(x:int,y:int):int +(x,y)
proc(f:[int=>bool]):bool .f(42)

% Let expressions with type inference
let x = 5 in +(x,1)  % x's type is inferred as int
```

### Type Checking Rules

TYPE1 enforces these type rules:

1. **Primitive operations** have fixed types:

   - Arithmetic (`+`, `-`, `*`, `/`): `[int,int=>int]`
   - Comparisons (`<?`, `<=?`, etc.): `[int,int=>bool]`
   - Boolean operations (`and`, `or`): `[bool,bool=>bool]`
   - Unary operations (`add1`, `sub1`): `[int=>int]`
   - `not`: `[bool=>bool]`
   - `zero?`: `[int=>bool]`

2. **If expressions**: Test must be boolean, branches must have same type
3. **Procedure application**: Argument types must match parameter types
4. **Let/letrec**: Bindings create type environment extensions
5. **Set expressions**: Variable and expression types must match

## Testing Your Solutions

Create test files to verify your understanding:

```bash
# Create a test file
echo "your TYPE1 expression here" > test.type1

# Check if it type-checks and runs
rep < test.type1

# Or with direct Java execution
java -cp Java/ Rep < test.type1
```
