Chapter8 Data Types
================

## 8.1 Basic Data Types

``` r
typeof(1:3)
```

    ## [1] "integer"

``` r
## [1] "integer"
typeof(c(1,2,3))
```

    ## [1] "double"

``` r
## [1] "double"
typeof(c(1, 2.1, 3))
```

    ## [1] "double"

``` r
## [1] "double"
typeof(c(TRUE, NA, FALSE))
```

    ## [1] "logical"

``` r
## [1] "logical"
typeof('Abc')
```

    ## [1] "character"

``` r
## [1] "character"
typeof(factor(c('F', 'M', 'M', 'F')))
```

    ## [1] "integer"

``` r
## [1] "integer"
```

``` r
is.integer(c(1, -3))
```

    ## [1] FALSE

``` r
## [1] FALSE
is.integer(c(1L, -3L))
```

    ## [1] TRUE

``` r
## [1] TRUE
```

``` r
c(-1, 0, 1)/0
```

    ## [1] -Inf  NaN  Inf

``` r
## [1] -Inf  NaN  Inf
is.na(c(-1, 0, 1)/0)
```

    ## [1] FALSE  TRUE FALSE

``` r
## [1] FALSE  TRUE FALSE
```

``` r
typeof(list("a", 1L, 1.5))
```

    ## [1] "list"

``` r
## [1] "list"
```

## 8.2 Type Conversion

``` r
as.numeric(c(FALSE, TRUE))
```

    ## [1] 0 1

``` r
## [1] 0 1
as.character(sqrt(1:4))
```

    ## [1] "1"                "1.4142135623731"  "1.73205080756888" "2"

``` r
## [1] "1"                "1.4142135623731"  "1.73205080756888" "2"
```

``` r
c(FALSE, 1L, 2.5, "3.6")
```

    ## [1] "FALSE" "1"     "2.5"   "3.6"

``` r
## [1] "FALSE" "1"     "2.5"   "3.6"
```

``` r
TRUE + 10
```

    ## [1] 11

``` r
## [1] 11
paste("abc", 1)
```

    ## [1] "abc 1"

``` r
## [1] "abc 1"
```

## 8.3 Properties of Data Types

``` r
x <- table(c(1,2,1,3,2,1)); print(x)
```

    ## 
    ## 1 2 3 
    ## 3 2 1

``` r
## 
## 1 2 3 
## 3 2 1
attributes(x)
```

    ## $dim
    ## [1] 3
    ## 
    ## $dimnames
    ## $dimnames[[1]]
    ## [1] "1" "2" "3"
    ## 
    ## 
    ## $class
    ## [1] "table"

``` r
## $dim
## [1] 3
## 
## $dimnames
## $dimnames[[1]]
## [1] "1" "2" "3"
## 
## 
## $class
## [1] "table"
```

``` r
x <- c(1,3,5)
attr(x, "theta") <- c(0, 1)
print(x)
```

    ## [1] 1 3 5
    ## attr(,"theta")
    ## [1] 0 1

``` r
## [1] 1 3 5
## attr(,"theta")
## [1] 0 1
```

``` r
x <- 1:5
y <- x^2
lmr <- lm(y ~ x)
print(names(lmr))
```

    ##  [1] "coefficients"  "residuals"     "effects"       "rank"         
    ##  [5] "fitted.values" "assign"        "qr"            "df.residual"  
    ##  [9] "xlevels"       "call"          "terms"         "model"

``` r
##  [1] "coefficients"  "residuals"     "effects"       "rank"         
##  [5] "fitted.values" "assign"        "qr"            "df.residual"  
##  [9] "xlevels"       "call"          "terms"         "model"
```

``` r
x <- 1:4
dim(x) <- c(2,2)
x
```

    ##      [,1] [,2]
    ## [1,]    1    3
    ## [2,]    2    4

``` r
##      [,1] [,2]
## [1,]    1    3
## [2,]    2    4
```
