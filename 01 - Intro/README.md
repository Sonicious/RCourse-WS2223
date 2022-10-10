Lesson 01
================

# The *read evaluate print loop* (REPL)

``` r
> ""
```

    [1] ""

`>` is the *prompt* and indicates that `R` is waiting for your input.

On the sheets/slides we don’t prepend code with `>` and prepend output
with `##`, this makes you able to copy/paste code to your REPL.

``` r
""
```

    ## [1] ""

# R as a calculator

``` r
1 + 1
cos(2 * pi)
sum(1:5)
pi
(3 + 4) * 3
3 + 4 * 3 # where is the difference?
-2 ^ 2
0 ^ 0
1 / 0   # not an error!
5 %/% 2 # integer division
5 %% 2  # 5 mod 2
TRUE & FALSE   # and
TRUE && FALSE
TRUE | FALSE  # or
TRUE || FALSE
!TRUE         # not
3 == 3  # relational tests
3 != 3
3 > 5
2 <= 4
7 >= 5
```

# Variables

Assignment operator: `<-`, use **Alt -** in R Studio

``` r
age_years <- 3
age_days <- age_years * 365
age_days
```

    ## [1] 1095

``` r
sentence <- "hello world"
sentence
```

    ## [1] "hello world"

``` r
ls() # list all variables
```

    ##  [1] "a"         "age_days"  "age_years" "b"         "cc"        "d"        
    ##  [7] "df1"       "iris"      "sentence"  "x"         "y"

``` r
rm("age_days") # remove variable
ls()
```

    ##  [1] "a"         "age_years" "b"         "cc"        "d"         "df1"      
    ##  [7] "iris"      "sentence"  "x"         "y"

``` r
rm(list = ls()) # clear workspace
```

**Exercise**:

- Calculate `age_hours`, `age_minutes`, `age_seconds`, assign a variable
- Create a Variable `me` with your name

# Data types

`mode` gives you the according datatype of something

``` r
mode(49)
```

    ## [1] "numeric"

``` r
mode(1 + 1i)
```

    ## [1] "complex"

``` r
mode("Hello world")
```

    ## [1] "character"

``` r
mode(TRUE)
```

    ## [1] "logical"

``` r
mode(sum)
```

    ## [1] "function"

``` r
mode(list(1, 2, 3))
```

    ## [1] "list"

you can use `'...'` or `"..."` to delimit strings. It makes no
difference

There are some more modes but these are not important for us (There is
also `typeof`, `storage.mode`, and `class`).

# Vectors

in `R` **everything** is a vector!, create a vector with
`c(e1, e2, e3, ...)`

``` r
a <- c(1, 2, 3)
print(a)
```

    ## [1] 1 2 3

``` r
b <- 1:4
print(b)
```

    ## [1] 1 2 3 4

``` r
d <- c("yes","no","maybe", 4, TRUE, a)
print(d)
```

    ## [1] "yes"   "no"    "maybe" "4"     "TRUE"  "1"     "2"     "3"

``` r
x <- seq(0, 1, length.out = 11) # creating a sequence
print(x)
```

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

## Indexing vectors

Indexing is done using `[`, see also `help("[")`

Extract elements/subset by position

``` r
x <- seq(0, 1, length.out = 11)
x # the entire vector
```

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

``` r
x[] # the entire vector
```

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

``` r
x[1] # extract a single element
```

    ## [1] 0

``` r
x[c(1, 3)] # subset
```

    ## [1] 0.0 0.2

``` r
x[1:3] # sequential subset
```

    ## [1] 0.0 0.1 0.2

## Working with vectors

Try to find out what happens in the according lines

``` r
cc <- seq(1, 0, length.out = 6)
cc
```

    ## [1] 1.0 0.8 0.6 0.4 0.2 0.0

``` r
sort(cc)
```

    ## [1] 0.0 0.2 0.4 0.6 0.8 1.0

``` r
order(cc)
```

    ## [1] 6 5 4 3 2 1

``` r
cc[order(cc)]
```

    ## [1] 0.0 0.2 0.4 0.6 0.8 1.0

``` r
rev(cc)
```

    ## [1] 0.0 0.2 0.4 0.6 0.8 1.0

``` r
length(cc)
```

    ## [1] 6

``` r
mean(cc)
```

    ## [1] 0.5

``` r
sum(cc)
```

    ## [1] 3

Exercise: Calculate the sum of all entire numbers from 1 to 100.

## Assignment of vectors

``` r
x
```

    ##  [1] 0.0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0

``` r
x[1] <- 5
x[4] <- 6
x[5:6] <- 10
x
```

    ##  [1]  5.0  0.1  0.2  6.0 10.0 10.0  0.6  0.7  0.8  0.9  1.0

``` r
x[x < 0.3] <- -999
```

## Named vectors

The elements of a vector can also be named.

``` r
x <- c(a = 1, b = 2, c = 3)
x
```

    ## a b c 
    ## 1 2 3

``` r
names(x) <- c("c", "d", "e") # add or modify names
x
```

    ## c d e 
    ## 1 2 3

``` r
names(x) <- NULL # remove names
x
```

    ## [1] 1 2 3

``` r
x <- c(a = 1, b = 2, c = 3)
x["a"] # indexing
```

    ## a 
    ## 1

Be aware of mixing named and unnamed vectoring:

``` r
x <- 1:4
x["a"] <- 999
x
```

    ##                   a 
    ##   1   2   3   4 999

**But!**

``` r
x <- c(a = 1, b = 2, c = 3)
x[1] <- 999
x
```

    ##   a   b   c 
    ## 999   2   3

## Vector arithmetics

``` r
x <- 1:6
x + 1
```

    ## [1] 2 3 4 5 6 7

``` r
x * 2
```

    ## [1]  2  4  6  8 10 12

``` r
sqrt(x) # square root
```

    ## [1] 1.000000 1.414214 1.732051 2.000000 2.236068 2.449490

``` r
sum(x) # sum of elements
```

    ## [1] 21

``` r
prod(x) # product of elements
```

    ## [1] 720

``` r
c(2, 2) * c(4, 5) # element-wise multiplication (Hadamard product)
```

    ## [1]  8 10

**Exercise**:

- What `mode` are the elements of
  `d <- c("yes","no","maybe", 4, TRUE, a)`? Why?
- What is happening here? Try to interprete

<!-- -->

    x <- 1:6
    x + 1:2 # recycling
    x + 1:4 # recycling

- Calculate:
  - $4\cdot\pmatrix{2\\3\\}$
  - $\pmatrix{27\\64\\} + \pmatrix{14\\16\\}$
- calculate the scalar product of $\pmatrix{1\\1\\2}$ and
  $\pmatrix{4\\2\\3\\}$. How can you realize it in a simple form with
  the known commands?
- `rnorm(n)` gives a vector with a normal distribution with mean 0 and
  standard deviation 1 of length n, how to get a normal distribution
  centered around 5 and standard deviation 0.5?

# Matrices

A matrix is the 2 dimensional equivalent of a vector.

``` r
matrix(1:9, 3, 3)
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    4    7
    ## [2,]    2    5    8
    ## [3,]    3    6    9

``` r
matrix(1:12, 3, 4)
```

    ##      [,1] [,2] [,3] [,4]
    ## [1,]    1    4    7   10
    ## [2,]    2    5    8   11
    ## [3,]    3    6    9   12

``` r
matrix(1:12, ncol = 3, nrow = 4)
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    5    9
    ## [2,]    2    6   10
    ## [3,]    3    7   11
    ## [4,]    4    8   12

``` r
matrix(c(1, 1, 2, 2), ncol = 2, byrow = TRUE)
```

    ##      [,1] [,2]
    ## [1,]    1    1
    ## [2,]    2    2

``` r
matrix(c("a", "b", "c", "d"), 2, 2)
```

    ##      [,1] [,2]
    ## [1,] "a"  "c" 
    ## [2,] "b"  "d"

## Indexing matrices

`[` can have as many arguments as there are dimensions (and more named
arguments)

``` r
x <- matrix(1:9, 3, 3)
x[2] # index as if it was a vector
```

    ## [1] 2

``` r
x[1, 2] # rows, columns
```

    ## [1] 4

``` r
x[1:2, 1:2] # submatrix
```

    ##      [,1] [,2]
    ## [1,]    1    4
    ## [2,]    2    5

``` r
x[c(1, 1, 1, 2, 2, 2)]  # index several elements at once
```

    ## [1] 1 1 1 2 2 2

``` r
x[1, ] # one row as vector
```

    ## [1] 1 4 7

``` r
x[, 1] # one column as vector
```

    ## [1] 1 2 3

``` r
x[1, , drop = FALSE] # one row as submatrix
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    4    7

``` r
x[, 1, drop = FALSE] # one column as submatrix
```

    ##      [,1]
    ## [1,]    1
    ## [2,]    2
    ## [3,]    3

Not setting `drop = TRUE` by default is one of the biggest errors of the
makers of `R`.

**Exercise**:

- try and interprete:
  - `matrix(1:9, 3, 3) + c(1, 2, 3)`
- What happens here? `matrix(1:12, ncol = 3, nrow = 4) + c(1, 2, 3)`
  - Tip: try `1:12+c(1, 2, 3)` as comparison
- Perform some calculations with the matrix-product: `%*%`
  - e.g.: `matrix(1:4,2,2) %*% matrix(5:8,2,2)`
  - what is the difference of a matrix product of vectors and the scalar
    product in R?

# Arrays

Vectors: 1 dimension, Matrix: 2 dimensions, Arrays: n dimensions

``` r
array(1:8, dim = c(2, 2, 2))
```

    ## , , 1
    ## 
    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4
    ## 
    ## , , 2
    ## 
    ##      [,1] [,2]
    ## [1,]    5    7
    ## [2,]    6    8

## Indexing arrays

Works exactly like indexing `matrix` but with more arguments.

``` r
x <- array(1:27, dim = c(3, 3, 3))
x[1:3] # index as a vector
```

    ## [1] 1 2 3

``` r
x[1:2, 1:2, 1:2] # subarray
```

    ## , , 1
    ## 
    ##      [,1] [,2]
    ## [1,]    1    4
    ## [2,]    2    5
    ## 
    ## , , 2
    ## 
    ##      [,1] [,2]
    ## [1,]   10   13
    ## [2,]   11   14

``` r
x[1, , ] # submatrix
```

    ##      [,1] [,2] [,3]
    ## [1,]    1   10   19
    ## [2,]    4   13   22
    ## [3,]    7   16   25

``` r
x[1, , , drop = FALSE] # subarray
```

    ## , , 1
    ## 
    ##      [,1] [,2] [,3]
    ## [1,]    1    4    7
    ## 
    ## , , 2
    ## 
    ##      [,1] [,2] [,3]
    ## [1,]   10   13   16
    ## 
    ## , , 3
    ## 
    ##      [,1] [,2] [,3]
    ## [1,]   19   22   25

``` r
x[1, 1, ] # subvector
```

    ## [1]  1 10 19

``` r
matrix(c(1, 1, 1,
              2, 2, 2),
            ncol = 3,
            byrow = TRUE)
```

    ##      [,1] [,2] [,3]
    ## [1,]    1    1    1
    ## [2,]    2    2    2

**Exercise**:

- Name 2 examples, where such high dimensional arrays could be useful.

# Lists

Vectors, matrices, arrays: **all elements have the same type!** (Also
they are called fields sometimes)

List: each element can be any R object.

An unnamed list:

``` r
list(1, "a", 1:2)
```

    ## [[1]]
    ## [1] 1
    ## 
    ## [[2]]
    ## [1] "a"
    ## 
    ## [[3]]
    ## [1] 1 2

A named list:

``` r
list(a = 1:3, b = letters[1:5], c = sum)
```

    ## $a
    ## [1] 1 2 3
    ## 
    ## $b
    ## [1] "a" "b" "c" "d" "e"
    ## 
    ## $c
    ## function (..., na.rm = FALSE)  .Primitive("sum")

Named matrices need lists

``` r
y <- matrix(1:4, 2, 2, dimnames = list(c("r1", "r2"), c("c1", "c2")))
y
```

    ##    c1 c2
    ## r1  1  3
    ## r2  2  4

``` r
y["r1", "c2"]
```

    ## [1] 3

**Exercise**:

- What is `letters` and `LETTERS`? Try to find out.

## Named lists

``` r
x <- list(a = 1, b = 1:3, c = "a")
x$a # element
```

    ## [1] 1

``` r
x[["a"]] # element
```

    ## [1] 1

``` r
x["a"] # subset
```

    ## $a
    ## [1] 1

``` r
x[c("a", "b")] # subset
```

    ## $a
    ## [1] 1
    ## 
    ## $b
    ## [1] 1 2 3

## Assignment of lists

``` r
x <- list(a = 1, b = 2, c = 3)
x$d <- 4
x[["e"]] <- 5
x$a <- NULL # delete element
x[["b"]] <- NULL
x
```

    ## $c
    ## [1] 3
    ## 
    ## $d
    ## [1] 4
    ## 
    ## $e
    ## [1] 5

# Logical indexing

``` r
x <- seq(0, 1, length.out = 11)
x < 0.5 # works elementwise
```

    ##  [1]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE

``` r
x[x < 0.5]
```

    ## [1] 0.0 0.1 0.2 0.3 0.4

``` r
y <- matrix(1:9, 3, 3)
lower.tri(y)
```

    ##       [,1]  [,2]  [,3]
    ## [1,] FALSE FALSE FALSE
    ## [2,]  TRUE FALSE FALSE
    ## [3,]  TRUE  TRUE FALSE

``` r
y[lower.tri(y)]
```

    ## [1] 2 3 6

# Packages

You can install new packages with `install.packages(package_name)`
(packages should be installed in the pool already)

Install the following packages:

- `ggplot2`
- `dplyr`
- `data.table`
- `raster`
- `xlsx`

Alternative: Use the *Packages* tab in RStudio

Load a package by using:

``` r
library(ggplot2)
```

# Data frames

## Spreadsheets in R

``` r
df1 <- data.frame(species = c("A", "A", "B", "C", "A"),
                  density = c(0.1, 0.2, 0.3, 0.5, 0.7),
                  count = c(24, 20, 18, 3, 10))
```

- Standard way of storing data (Also in Matlab, Python, Julia, …).
- A set of lists where each element is a vector with the same length.
- Each column can have a different type

``` r
summary(df1) # statistical values
```

    ##    species             density         count   
    ##  Length:5           Min.   :0.10   Min.   : 3  
    ##  Class :character   1st Qu.:0.20   1st Qu.:10  
    ##  Mode  :character   Median :0.30   Median :18  
    ##                     Mean   :0.36   Mean   :15  
    ##                     3rd Qu.:0.50   3rd Qu.:20  
    ##                     Max.   :0.70   Max.   :24

``` r
str(df1) # some peek into the dataset
```

    ## 'data.frame':    5 obs. of  3 variables:
    ##  $ species: chr  "A" "A" "B" "C" ...
    ##  $ density: num  0.1 0.2 0.3 0.5 0.7
    ##  $ count  : num  24 20 18 3 10

## Data frames indexing

### Subsetting columns

``` r
df1$species
```

    ## [1] "A" "A" "B" "C" "A"

``` r
df1[["species"]]
```

    ## [1] "A" "A" "B" "C" "A"

``` r
df1[, "species"]
```

    ## [1] "A" "A" "B" "C" "A"

``` r
df1["species"]
```

    ##   species
    ## 1       A
    ## 2       A
    ## 3       B
    ## 4       C
    ## 5       A

### Subsetting rows

``` r
df1[df1$species == "A", ]
```

    ##   species density count
    ## 1       A     0.1    24
    ## 2       A     0.2    20
    ## 5       A     0.7    10

``` r
df1[df1$species == "F", ]
```

    ## [1] species density count  
    ## <0 Zeilen> (oder row.names mit Länge 0)

``` r
df1[df1$count == 10, "species"]
```

    ## [1] "A"

## datasets

One of the most important datasets for simple tasks is the iris dataset.

![image of the flowers](iris-machinelearning.png)

``` r
library(datasets)
data(iris)
iris
```

    ##     Sepal.Length Sepal.Width Petal.Length Petal.Width    Species
    ## 1            5.1         3.5          1.4         0.2     setosa
    ## 2            4.9         3.0          1.4         0.2     setosa
    ## 3            4.7         3.2          1.3         0.2     setosa
    ## 4            4.6         3.1          1.5         0.2     setosa
    ## 5            5.0         3.6          1.4         0.2     setosa
    ## 6            5.4         3.9          1.7         0.4     setosa
    ## 7            4.6         3.4          1.4         0.3     setosa
    ## 8            5.0         3.4          1.5         0.2     setosa
    ## 9            4.4         2.9          1.4         0.2     setosa
    ## 10           4.9         3.1          1.5         0.1     setosa
    ## 11           5.4         3.7          1.5         0.2     setosa
    ## 12           4.8         3.4          1.6         0.2     setosa
    ## 13           4.8         3.0          1.4         0.1     setosa
    ## 14           4.3         3.0          1.1         0.1     setosa
    ## 15           5.8         4.0          1.2         0.2     setosa
    ## 16           5.7         4.4          1.5         0.4     setosa
    ## 17           5.4         3.9          1.3         0.4     setosa
    ## 18           5.1         3.5          1.4         0.3     setosa
    ## 19           5.7         3.8          1.7         0.3     setosa
    ## 20           5.1         3.8          1.5         0.3     setosa
    ## 21           5.4         3.4          1.7         0.2     setosa
    ## 22           5.1         3.7          1.5         0.4     setosa
    ## 23           4.6         3.6          1.0         0.2     setosa
    ## 24           5.1         3.3          1.7         0.5     setosa
    ## 25           4.8         3.4          1.9         0.2     setosa
    ## 26           5.0         3.0          1.6         0.2     setosa
    ## 27           5.0         3.4          1.6         0.4     setosa
    ## 28           5.2         3.5          1.5         0.2     setosa
    ## 29           5.2         3.4          1.4         0.2     setosa
    ## 30           4.7         3.2          1.6         0.2     setosa
    ## 31           4.8         3.1          1.6         0.2     setosa
    ## 32           5.4         3.4          1.5         0.4     setosa
    ## 33           5.2         4.1          1.5         0.1     setosa
    ## 34           5.5         4.2          1.4         0.2     setosa
    ## 35           4.9         3.1          1.5         0.2     setosa
    ## 36           5.0         3.2          1.2         0.2     setosa
    ## 37           5.5         3.5          1.3         0.2     setosa
    ## 38           4.9         3.6          1.4         0.1     setosa
    ## 39           4.4         3.0          1.3         0.2     setosa
    ## 40           5.1         3.4          1.5         0.2     setosa
    ## 41           5.0         3.5          1.3         0.3     setosa
    ## 42           4.5         2.3          1.3         0.3     setosa
    ## 43           4.4         3.2          1.3         0.2     setosa
    ## 44           5.0         3.5          1.6         0.6     setosa
    ## 45           5.1         3.8          1.9         0.4     setosa
    ## 46           4.8         3.0          1.4         0.3     setosa
    ## 47           5.1         3.8          1.6         0.2     setosa
    ## 48           4.6         3.2          1.4         0.2     setosa
    ## 49           5.3         3.7          1.5         0.2     setosa
    ## 50           5.0         3.3          1.4         0.2     setosa
    ## 51           7.0         3.2          4.7         1.4 versicolor
    ## 52           6.4         3.2          4.5         1.5 versicolor
    ## 53           6.9         3.1          4.9         1.5 versicolor
    ## 54           5.5         2.3          4.0         1.3 versicolor
    ## 55           6.5         2.8          4.6         1.5 versicolor
    ## 56           5.7         2.8          4.5         1.3 versicolor
    ## 57           6.3         3.3          4.7         1.6 versicolor
    ## 58           4.9         2.4          3.3         1.0 versicolor
    ## 59           6.6         2.9          4.6         1.3 versicolor
    ## 60           5.2         2.7          3.9         1.4 versicolor
    ## 61           5.0         2.0          3.5         1.0 versicolor
    ## 62           5.9         3.0          4.2         1.5 versicolor
    ## 63           6.0         2.2          4.0         1.0 versicolor
    ## 64           6.1         2.9          4.7         1.4 versicolor
    ## 65           5.6         2.9          3.6         1.3 versicolor
    ## 66           6.7         3.1          4.4         1.4 versicolor
    ## 67           5.6         3.0          4.5         1.5 versicolor
    ## 68           5.8         2.7          4.1         1.0 versicolor
    ## 69           6.2         2.2          4.5         1.5 versicolor
    ## 70           5.6         2.5          3.9         1.1 versicolor
    ## 71           5.9         3.2          4.8         1.8 versicolor
    ## 72           6.1         2.8          4.0         1.3 versicolor
    ## 73           6.3         2.5          4.9         1.5 versicolor
    ## 74           6.1         2.8          4.7         1.2 versicolor
    ## 75           6.4         2.9          4.3         1.3 versicolor
    ## 76           6.6         3.0          4.4         1.4 versicolor
    ## 77           6.8         2.8          4.8         1.4 versicolor
    ## 78           6.7         3.0          5.0         1.7 versicolor
    ## 79           6.0         2.9          4.5         1.5 versicolor
    ## 80           5.7         2.6          3.5         1.0 versicolor
    ## 81           5.5         2.4          3.8         1.1 versicolor
    ## 82           5.5         2.4          3.7         1.0 versicolor
    ## 83           5.8         2.7          3.9         1.2 versicolor
    ## 84           6.0         2.7          5.1         1.6 versicolor
    ## 85           5.4         3.0          4.5         1.5 versicolor
    ## 86           6.0         3.4          4.5         1.6 versicolor
    ## 87           6.7         3.1          4.7         1.5 versicolor
    ## 88           6.3         2.3          4.4         1.3 versicolor
    ## 89           5.6         3.0          4.1         1.3 versicolor
    ## 90           5.5         2.5          4.0         1.3 versicolor
    ## 91           5.5         2.6          4.4         1.2 versicolor
    ## 92           6.1         3.0          4.6         1.4 versicolor
    ## 93           5.8         2.6          4.0         1.2 versicolor
    ## 94           5.0         2.3          3.3         1.0 versicolor
    ## 95           5.6         2.7          4.2         1.3 versicolor
    ## 96           5.7         3.0          4.2         1.2 versicolor
    ## 97           5.7         2.9          4.2         1.3 versicolor
    ## 98           6.2         2.9          4.3         1.3 versicolor
    ## 99           5.1         2.5          3.0         1.1 versicolor
    ## 100          5.7         2.8          4.1         1.3 versicolor
    ## 101          6.3         3.3          6.0         2.5  virginica
    ## 102          5.8         2.7          5.1         1.9  virginica
    ## 103          7.1         3.0          5.9         2.1  virginica
    ## 104          6.3         2.9          5.6         1.8  virginica
    ## 105          6.5         3.0          5.8         2.2  virginica
    ## 106          7.6         3.0          6.6         2.1  virginica
    ## 107          4.9         2.5          4.5         1.7  virginica
    ## 108          7.3         2.9          6.3         1.8  virginica
    ## 109          6.7         2.5          5.8         1.8  virginica
    ## 110          7.2         3.6          6.1         2.5  virginica
    ## 111          6.5         3.2          5.1         2.0  virginica
    ## 112          6.4         2.7          5.3         1.9  virginica
    ## 113          6.8         3.0          5.5         2.1  virginica
    ## 114          5.7         2.5          5.0         2.0  virginica
    ## 115          5.8         2.8          5.1         2.4  virginica
    ## 116          6.4         3.2          5.3         2.3  virginica
    ## 117          6.5         3.0          5.5         1.8  virginica
    ## 118          7.7         3.8          6.7         2.2  virginica
    ## 119          7.7         2.6          6.9         2.3  virginica
    ## 120          6.0         2.2          5.0         1.5  virginica
    ## 121          6.9         3.2          5.7         2.3  virginica
    ## 122          5.6         2.8          4.9         2.0  virginica
    ## 123          7.7         2.8          6.7         2.0  virginica
    ## 124          6.3         2.7          4.9         1.8  virginica
    ## 125          6.7         3.3          5.7         2.1  virginica
    ## 126          7.2         3.2          6.0         1.8  virginica
    ## 127          6.2         2.8          4.8         1.8  virginica
    ## 128          6.1         3.0          4.9         1.8  virginica
    ## 129          6.4         2.8          5.6         2.1  virginica
    ## 130          7.2         3.0          5.8         1.6  virginica
    ## 131          7.4         2.8          6.1         1.9  virginica
    ## 132          7.9         3.8          6.4         2.0  virginica
    ## 133          6.4         2.8          5.6         2.2  virginica
    ## 134          6.3         2.8          5.1         1.5  virginica
    ## 135          6.1         2.6          5.6         1.4  virginica
    ## 136          7.7         3.0          6.1         2.3  virginica
    ## 137          6.3         3.4          5.6         2.4  virginica
    ## 138          6.4         3.1          5.5         1.8  virginica
    ## 139          6.0         3.0          4.8         1.8  virginica
    ## 140          6.9         3.1          5.4         2.1  virginica
    ## 141          6.7         3.1          5.6         2.4  virginica
    ## 142          6.9         3.1          5.1         2.3  virginica
    ## 143          5.8         2.7          5.1         1.9  virginica
    ## 144          6.8         3.2          5.9         2.3  virginica
    ## 145          6.7         3.3          5.7         2.5  virginica
    ## 146          6.7         3.0          5.2         2.3  virginica
    ## 147          6.3         2.5          5.0         1.9  virginica
    ## 148          6.5         3.0          5.2         2.0  virginica
    ## 149          6.2         3.4          5.4         2.3  virginica
    ## 150          5.9         3.0          5.1         1.8  virginica
