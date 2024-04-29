Chapter5 Logical Variables
================

## 5.1 Logical Vectors

``` r
sele <- (log10(15) < 2); print(sele)
```

    ## [1] TRUE

``` r
## [1] TRUE
```

``` r
c(1, 3, 5) > 2
```

    ## [1] FALSE  TRUE  TRUE

``` r
## [1] FALSE  TRUE  TRUE
(1:4) >= (4:1)
```

    ## [1] FALSE FALSE  TRUE  TRUE

``` r
## [1] FALSE FALSE  TRUE  TRUE
```

``` r
c(1, NA, 3) > 2
```

    ## [1] FALSE    NA  TRUE

``` r
## [1] FALSE    NA  TRUE
NA == NA
```

    ## [1] NA

``` r
## [1] NA
```

``` r
is.na(c(1, NA, 3) > 2)
```

    ## [1] FALSE  TRUE FALSE

``` r
## [1] FALSE  TRUE FALSE
```

``` r
c(1,3) %in% c(2,3,4)
```

    ## [1] FALSE  TRUE

``` r
## [1] FALSE  TRUE
c(NA,3) %in% c(2,3,4)
```

    ## [1] FALSE  TRUE

``` r
## [1] FALSE  TRUE
c(1,3) %in% c(NA, 3, 4)
```

    ## [1] FALSE  TRUE

``` r
## [1] FALSE  TRUE
c(NA,3) %in% c(NA, 3, 4)
```

    ## [1] TRUE TRUE

``` r
## [1] TRUE TRUE
```

``` r
match(c(1, 3), c(2,3,4,3))
```

    ## [1] NA  2

``` r
## [1] NA  2
```

## 5.2 Logical Computations

## 5.3 Logical Comparisons

``` r
c(1, NA, 3) > 2
```

    ## [1] FALSE    NA  TRUE

``` r
## [1] FALSE    NA  TRUE
all(c(1, NA, 3) > 2)
```

    ## [1] FALSE

``` r
## [1] FALSE
any(c(1, NA, 3) > 2)
```

    ## [1] TRUE

``` r
## [1] TRUE
all(NA)
```

    ## [1] NA

``` r
## [1] NA
any(NA)
```

    ## [1] NA

``` r
## [1] NA
```

``` r
which(c(FALSE, TRUE, TRUE, FALSE, NA))
```

    ## [1] 2 3

``` r
## [1] 2 3
which((11:15) > 12)
```

    ## [1] 3 4 5

``` r
## [1] 3 4 5
```

``` r
identical(c(1,2,3), c(1,2,NA))
```

    ## [1] FALSE

``` r
## [1] FALSE
identical(c(1L,2L,3L), c(1,2,3))
```

    ## [1] FALSE

``` r
## [1] FALSE
```
