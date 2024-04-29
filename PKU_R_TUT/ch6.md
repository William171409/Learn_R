Chapter6 String Variables
================

## 6.1 String Vectors

``` r
s1 <- c('abc', '', 'a cat', NA, '李明')
s1
```

    ## [1] "abc"   ""      "a cat" NA      "李明"

## 6.2 Escape Characters and Original Characters

``` r
cat("\"\n")
```

    ## "

``` r
cat(r"(C:\disk\course\math\nFinished!\n)")
```

    ## C:\disk\course\math\nFinished!\n

## 6.3 Paste Function

``` r
paste(c("ab", "cd"), c("ef", "gh"))
```

    ## [1] "ab ef" "cd gh"

``` r
paste("x", 1:3, sep="")
```

    ## [1] "x1" "x2" "x3"

``` r
paste(c("a", "b", "c"), collapse="")
```

    ## [1] "abc"

## 6.4 toupper() and tolower()

## 6.5 String Length

``` r
nchar("wjew23", type='bytes')
```

    ## [1] 6

## 6.6 Substring

``` r
substr('JAN07', 1, 3)
```

    ## [1] "JAN"

``` r
## [1] "JAN"
```

``` r
substr(c('JAN07', 'MAR66'), 1, 3)
```

    ## [1] "JAN" "MAR"

``` r
## [1] "JAN" "MAR"
```

## 6.7 Typecasting

``` r
substr('JAN07', 4, 5)
```

    ## [1] "07"

``` r
## [1] "07"
as.numeric(substr('JAN07', 4, 5)) + 2000
```

    ## [1] 2007

``` r
## [1] 2007
as.numeric(substr(c('JAN07', 'MAR66'), 4, 5))
```

    ## [1]  7 66

``` r
## [1]  7 66
```

``` r
as.character((1:5)*5)
```

    ## [1] "5"  "10" "15" "20" "25"

``` r
## [1] "5"  "10" "15" "20" "25"
```

``` r
sprintf('file%03d.txt', c(1, 99, 100))
```

    ## [1] "file001.txt" "file099.txt" "file100.txt"

## 6.8 String Replacing

``` r
x <- '1, 3; 5'
gsub(';', ',', x, fixed=TRUE)
```

    ## [1] "1, 3, 5"

``` r
## [1] "1, 3, 5"
```
