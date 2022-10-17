Lesson 02
================

# Programming in R

- For development and small stuff use the *REPL*.
- To run a script save it and run it using `Rscript my_script.R`
  - this might not (mainly windows) and depends on the type of
    installation
- To run a script from the REPL use

``` r
source("MyScript.R")
```

- For long calculations and/or large data use the cluster.

General tips for coding:

- Use Variable names which are self-describing
- Comment your code
- Good code can be read like a good book!
- Usual styleguide:
  - variables and functions are all written in lowercase with
    underscores if neded
  - Examples: `circle_volume`, `matrix_product`, but not: `MyFunction`
- **Combine simplicity with efficiency!**

# Functions

``` r
mode(sum)
```

    ## [1] "function"

``` r
sum(1:100)
```

    ## [1] 5050

- “Hide” portions of your code and give it a name
- make it reusable!
- functions …
  - take a set of inputs (set may be empty)
  - produce an output
  - can modify external variables

<!-- -->

    NAME <- function(INPUT) {
      return(OUTPUT)
    }

Example:

``` r
add <- function(x, y) {
  return(x + y)
}
```

Default values:

``` r
add <- function(x = 0, y = 1) {
  return(x + y)
}
```

Functions always return something, wvewn if you don’t explicitely state
it:

``` r
add <- function(x = 0, y = 1) {
  x + y
}
```

**It is very bad style to have no explicit return statement**

## Calling functions

``` r
add()
```

    ## [1] 1

``` r
add(3)
```

    ## [1] 4

``` r
add(, 3)
```

    ## [1] 3

``` r
add(3, )
```

    ## [1] 4

``` r
add(4, 5)
```

    ## [1] 9

``` r
add(x = 4, y = 5)
```

    ## [1] 9

``` r
add(y = 4, x = 5)
```

    ## [1] 9

**Exercise**:

- get familiar with the functions `cat` and `print` and `paste0`.
- write a function which has the input of a radius of a circle and
  prints the values for volume and area. Return a simple 0.
- Write a second function which returns the values as vector wihtout
  printing anything.
- Check if you named the variables and the funciton wisely and if you
  used comments.

# Variable scope / R Environment

## Reusing variable names in functions

`x` inside the function is a different `x` than the one outside because
it was redefined in the definition of the function.

``` r
x <- 1
y <- 2
f <- function(x) {
  x <- x + 1 # This is a different x
  y <- 3 # This is a different y
  return(x + y)
}
f(x)
```

    ## [1] 5

``` r
x
```

    ## [1] 1

## Nesting functions

functions can be defined inside of functions (usually done with small
helper functions)

``` r
outside_function <- function(x, y) {
  nested_function <- function(a, b) {
    return(a + b)
    return(nested_function(x, y))
  }
}
```

## Using “free” variables.

`x` inside the function is the same `x` than the one outside because it
is never defined in the context of the function.

*Lexical scoping*: If a function uses a “free” variable, it uses the one
which is seen closest to the function when it was definied.

``` r
x <- 1
f <- function(y) {
  y <- x + y # This is the same x as the outside
  return(y)
}
f(1)
```

    ## [1] 2

``` r
x
```

    ## [1] 1

**Don’t rely on variables outside a function.** This ruins the concept
of reproducability And can create confusion among all users of the
function.

# Flow Control

## Flow control - `if else`

``` r
a <- 3.44
if (a > 3) {
  print("a is larger than 3")
  a <- a - 3
} else {
  print("a is smaller or equal 3")
  a <- a / 2
}
```

    ## [1] "a is larger than 3"

``` r
a
```

    ## [1] 0.44

**Exercise**:

- Try to find out how the next code segment works exactly:

``` r
b <- runif(5, 2.5, 3.5)
b
ifelse(
  b > 3,
  "b is greater than 3",
  "b is smaller or equal 3"
)
data.frame(b, three = ifelse(b > 3, ">3", "<3"))
```

## Flow control - `for` and `while` loops

Loops for counting and iterating through a given dataset or set of
indices.

``` r
for (i in 1:5) {
  cat(i)
}
```

    ## 12345

``` r
for (i in letters[1:5]) {
  cat(i)
}
```

    ## abcde

``` r
for (i in c("a", "hello", "world", "example")) {
  cat(i, "\n")
}
```

    ## a 
    ## hello 
    ## world 
    ## example

while loops for more complex situations

``` r
i <- 1
while (i < 6) {
  print(i)
  i <- i + 1
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 3
    ## [1] 4
    ## [1] 5

Sometimes it looks more like this:

``` r
i <- 6
while (i <- i - 1) {
  print(i)
}
```

    ## [1] 5
    ## [1] 4
    ## [1] 3
    ## [1] 2
    ## [1] 1

The `repeat` loop is also a possibility to check for the condition at
the end of the body. **All loops are equivalent.** Therefore we stay
with the more common `while` and `for` loop.

## Flow control - `next` and `break` statements

`next` and `break` statements are usually helpful when single events in
a long list of iterations need to be avoided or can cause problems.

``` r
iterations <- 0
while (number <- sample(1:10, 1)) {
  iterations <- iterations + 1
  if (number == 5) {
    print(paste0("Found number 5 after ", iterations, " Iterations: "))
    break
  }
}
```

    ## [1] "Found number 5 after 2 Iterations: "

``` r
x <- 1:5
for (val in x) {
  if (val == 3) {
    next
  }
  print(val)
}
```

    ## [1] 1
    ## [1] 2
    ## [1] 4
    ## [1] 5

**use `break` and `next` only if it makes your code more readable!**
This is usually the case when you want to avoid erros of inputs.

``` r
a <- 1
while (a < 2) {
  print(a)
  a <- a + 1
}
```

    ## [1] 1

``` r
a <- b <- 1
while (TRUE) {
  print("in first part of the loop")
  a <- a + 1
  b <- b + 1
  if (a > 5 || b > 3) break
  if (a <= 2 || b <= 2) next
  print(paste0("a=", a, " , b=", b))
  print("in the second part of the loop")
}
```

    ## [1] "in first part of the loop"
    ## [1] "in first part of the loop"
    ## [1] "a=3 , b=3"
    ## [1] "in the second part of the loop"
    ## [1] "in first part of the loop"

# Recursion

a function that calls itself

``` r
fib <- function(n) {
  if (n < 2) {
    return(n)
  } else {
    return(fib(n - 1) + fib(n - 2))
  }
}

for (i in 1:15) {
  cat(i, ":", fib(i), "\n")
}
```

    ## 1 : 1 
    ## 2 : 1 
    ## 3 : 2 
    ## 4 : 3 
    ## 5 : 5 
    ## 6 : 8 
    ## 7 : 13 
    ## 8 : 21 
    ## 9 : 34 
    ## 10 : 55 
    ## 11 : 89 
    ## 12 : 144 
    ## 13 : 233 
    ## 14 : 377 
    ## 15 : 610

# Exercises

## quadratic function zeros (\*\*)

Write a function which returns all solutions of the equation
$$ 0 = ax^2 + bx + c $$ for given $a$, $b$ and $c$.

Once you have a basic version, think about special cases: - What if
there is only one / no solution - What about complex numbers? - How to
return the result: `list` or `vector`?

Hints: - The solution is given by
$$ \frac{-b \pm \sqrt{b^2 - 4ac}}{2a} $$ - `sqrt()` can take complex
input.

## Your own `ifelse` (\*\*\*)

Write your own implementation of `ifelse`. - Give the function another
name. - Decide and explain the implementation detail: What happens if
the first argument is not logical? Throw an error with `stop` or return
`NA`?

## Fibonacci (\*\*\*)

$$ 0, 1 , 1 , 2 , 3 , 5 , 8 , 13 , 21 , 34 , 55 , 89 , 144 , 233 , 377 , 610, \ldots $$

The Fibonacci sequence starts with 0, 1 and every subsequent number is
the sum of the previous two numbers. Some slides ago we have seen a
version implemented using recursion.

$$F_0 = 0,\qquad F_1 = 1,\qquad F_n = F_{n-1} + F_{n-2}$$

- Write a function with one argument `n` to collect the first `n`
  Fibonacci numbers in a vector.

- It is faster to implement it using a `for` loop. Use `system.time` to
  measure the time difference:

  ``` r
  system.time(sort(runif(5000000,1,2)))
  ```

      ##        User      System verstrichen 
      ##        0.29        0.00        0.32
