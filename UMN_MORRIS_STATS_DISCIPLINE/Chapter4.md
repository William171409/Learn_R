Chapter 4 Introduction to Data Wrangling
================

``` r
library(gapminder)
library(tidyverse)
```

    ## ── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
    ## ✔ dplyr     1.1.4     ✔ readr     2.1.5
    ## ✔ forcats   1.0.0     ✔ stringr   1.5.0
    ## ✔ ggplot2   3.5.0     ✔ tibble    3.2.1
    ## ✔ lubridate 1.9.3     ✔ tidyr     1.3.1
    ## ✔ purrr     1.0.2     
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()
    ## ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors

## 4.1 Tidy Data

What is tidy data? Tidy data is a standard way of mapping the meaning of
a dataset to its structure. A dataset is messy or tidy depending on how
rows, columns and tables are matched up with observations, variables and
types. In tidy data:

- Each variable forms a column.

- Each observation forms a row.

- Each type of observational unit forms a table.

## 4.2 Subset using filter

``` r
#gapminder %>% filter(country=="Australia") %>% head(n=12)
gapminder %>% dplyr::filter(country=="Australia") %>% head(n=12)
```

    ## # A tibble: 12 × 6
    ##    country   continent  year lifeExp      pop gdpPercap
    ##    <fct>     <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Australia Oceania    1952    69.1  8691212    10040.
    ##  2 Australia Oceania    1957    70.3  9712569    10950.
    ##  3 Australia Oceania    1962    70.9 10794968    12217.
    ##  4 Australia Oceania    1967    71.1 11872264    14526.
    ##  5 Australia Oceania    1972    71.9 13177000    16789.
    ##  6 Australia Oceania    1977    73.5 14074100    18334.
    ##  7 Australia Oceania    1982    74.7 15184200    19477.
    ##  8 Australia Oceania    1987    76.3 16257249    21889.
    ##  9 Australia Oceania    1992    77.6 17481977    23425.
    ## 10 Australia Oceania    1997    78.8 18565243    26998.
    ## 11 Australia Oceania    2002    80.4 19546792    30688.
    ## 12 Australia Oceania    2007    81.2 20434176    34435.

## 4.3 Subset using multiple conditions

``` r
gapminder %>% 
  dplyr::filter(continent=="Oceania" & year==1997) %>% 
  head()
```

    ## # A tibble: 2 × 6
    ##   country     continent  year lifeExp      pop gdpPercap
    ##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ## 1 Australia   Oceania    1997    78.8 18565243    26998.
    ## 2 New Zealand Oceania    1997    77.6  3676187    21050.

## 4.4 Saving as a new dataframe

Here we save the the modified dataset as a new dataframe called gap97.

``` r
gap97 <- gapminder %>% 
  filter(continent!="Oceania" & year==1997) 
#
dplyr::glimpse(gap97)
```

    ## Rows: 140
    ## Columns: 6
    ## $ country   <fct> "Afghanistan", "Albania", "Algeria", "Angola", "Argentina", …
    ## $ continent <fct> Asia, Europe, Africa, Africa, Americas, Europe, Asia, Asia, …
    ## $ year      <int> 1997, 1997, 1997, 1997, 1997, 1997, 1997, 1997, 1997, 1997, …
    ## $ lifeExp   <dbl> 41.763, 72.950, 69.152, 40.963, 73.275, 77.510, 73.925, 59.4…
    ## $ pop       <int> 22227415, 3428038, 29072015, 9875024, 36203463, 8069876, 598…
    ## $ gdpPercap <dbl> 635.3414, 3193.0546, 4797.2951, 2277.1409, 10967.2820, 29095…

``` r
gap97%>%summary()
```

    ##         country       continent       year         lifeExp     
    ##  Afghanistan:  1   Africa  :52   Min.   :1997   Min.   :36.09  
    ##  Albania    :  1   Americas:25   1st Qu.:1997   1st Qu.:55.51  
    ##  Algeria    :  1   Asia    :33   Median :1997   Median :69.27  
    ##  Angola     :  1   Europe  :30   Mean   :1997   Mean   :64.83  
    ##  Argentina  :  1   Oceania : 0   3rd Qu.:1997   3rd Qu.:73.95  
    ##  Austria    :  1                 Max.   :1997   Max.   :80.69  
    ##  (Other)    :134                                               
    ##       pop              gdpPercap      
    ##  Min.   :1.456e+05   Min.   :  312.2  
    ##  1st Qu.:3.792e+06   1st Qu.: 1355.8  
    ##  Median :9.735e+06   Median : 4725.3  
    ##  Mean   :3.924e+07   Mean   : 8876.8  
    ##  3rd Qu.:2.563e+07   3rd Qu.:11153.7  
    ##  Max.   :1.230e+09   Max.   :41283.2  
    ## 

## 4.5 Subset using select

``` r
# the next command selects three variables and renames two of them:
gapminder %>% 
  dplyr::select(country, Year=year,LifeExp=lifeExp) %>% 
  head(n=12)
```

    ## # A tibble: 12 × 3
    ##    country      Year LifeExp
    ##    <fct>       <int>   <dbl>
    ##  1 Afghanistan  1952    28.8
    ##  2 Afghanistan  1957    30.3
    ##  3 Afghanistan  1962    32.0
    ##  4 Afghanistan  1967    34.0
    ##  5 Afghanistan  1972    36.1
    ##  6 Afghanistan  1977    38.4
    ##  7 Afghanistan  1982    39.9
    ##  8 Afghanistan  1987    40.8
    ##  9 Afghanistan  1992    41.7
    ## 10 Afghanistan  1997    41.8
    ## 11 Afghanistan  2002    42.1
    ## 12 Afghanistan  2007    43.8

The `profiling_num` command from the *funModeling* package produces a
lot of output, some we might not want. We will show how to modify the
output of this command here. The command produces a dataframe which has
many columns we might not wish to display or consider further.

We begin by removing some columns of summary statistics that we wish to
ignore. Selecting a list of column names with a “minus” - sign in front
of the list will remove these items from the dataframe and keep the rest
in place. The command below pipes the modified dataframe to the `kable`
command in the *knitr* package for a more pleasing tabular display.

``` r
# Let's observe the contents of profiling_num:
funModeling::profiling_num(gapminder) %>% 
  dplyr::glimpse()
```

    ## Rows: 4
    ## Columns: 16
    ## $ variable       <chr> "year", "lifeExp", "pop", "gdpPercap"
    ## $ mean           <dbl> 1.979500e+03, 5.947444e+01, 2.960121e+07, 7.215327e+03
    ## $ std_dev        <dbl> 1.726533e+01, 1.291711e+01, 1.061579e+08, 9.857455e+03
    ## $ variation_coef <dbl> 0.008722066, 0.217187544, 3.586268548, 1.366182632
    ## $ p_01           <dbl> 1952.0000, 33.4926, 154117.9200, 369.2201
    ## $ p_05           <dbl> 1952.0000, 38.4924, 475458.9000, 547.9964
    ## $ p_25           <dbl> 1965.750, 48.198, 2793664.000, 1202.060
    ## $ p_50           <dbl> 1979.5000, 60.7125, 7023595.5000, 3531.8470
    ## $ p_75           <dbl> 1.993250e+03, 7.084550e+01, 1.958522e+07, 9.325462e+03
    ## $ p_95           <dbl> 2007.000, 77.437, 89822054.500, 26608.333
    ## $ p_99           <dbl> 2.007000e+03, 8.023892e+01, 6.319900e+08, 3.678357e+04
    ## $ skewness       <dbl> 0.0000000, -0.2524798, 8.3328742, 3.8468819
    ## $ kurtosis       <dbl> 1.783217, 1.873099, 80.716151, 30.431702
    ## $ iqr            <dbl> 2.750000e+01, 2.264750e+01, 1.679156e+07, 8.123402e+03
    ## $ range_98       <chr> "[1952, 2007]", "[33.4926, 80.23892]", "[154117.92, 631…
    ## $ range_80       <chr> "[1957, 2002]", "[41.5108, 75.097]", "[946367.1, 548013…

``` r
# now remove unwanted columns from summary display
funModeling::profiling_num(gapminder) %>%
  select(-c("variation_coef","skewness","kurtosis","range_98","range_80","p_01","p_99")) %>%
  knitr::kable()
```

| variable  |         mean |      std_dev |        p_05 |        p_25 |         p_50 |         p_75 |         p_95 |          iqr |
|:----------|-------------:|-------------:|------------:|------------:|-------------:|-------------:|-------------:|-------------:|
| year      | 1.979500e+03 | 1.726533e+01 |   1952.0000 |    1965.750 |    1979.5000 | 1.993250e+03 |     2007.000 | 2.750000e+01 |
| lifeExp   | 5.947444e+01 | 1.291711e+01 |     38.4924 |      48.198 |      60.7125 | 7.084550e+01 |       77.437 | 2.264750e+01 |
| pop       | 2.960121e+07 | 1.061579e+08 | 475458.9000 | 2793664.000 | 7023595.5000 | 1.958522e+07 | 89822054.500 | 1.679156e+07 |
| gdpPercap | 7.215327e+03 | 9.857455e+03 |    547.9964 |    1202.060 |    3531.8470 | 9.325462e+03 |    26608.333 | 8.123402e+03 |

``` r
funModeling::profiling_num(gapminder) %>%
  select(c("variable","mean","std_dev","p_25","p_50","p_75")) %>%
  knitr::kable()
```

| variable  |         mean |      std_dev |        p_25 |         p_50 |         p_75 |
|:----------|-------------:|-------------:|------------:|-------------:|-------------:|
| year      | 1.979500e+03 | 1.726533e+01 |    1965.750 |    1979.5000 | 1.993250e+03 |
| lifeExp   | 5.947444e+01 | 1.291711e+01 |      48.198 |      60.7125 | 7.084550e+01 |
| pop       | 2.960121e+07 | 1.061579e+08 | 2793664.000 | 7023595.5000 | 1.958522e+07 |
| gdpPercap | 7.215327e+03 | 9.857455e+03 |    1202.060 |    3531.8470 | 9.325462e+03 |

## 4.6 Order using arrange

``` r
# This command will show the countries with highest life expectancy because 
# the data are arranged in descending order of life expectancy (larger to smaller)
gapminder %>% 
  dplyr::filter(year==1997) %>%   
  dplyr::select(country, continent, lifeExp) %>% 
  dplyr::arrange(desc(lifeExp)) %>% 
  head()
```

    ## # A tibble: 6 × 3
    ##   country          continent lifeExp
    ##   <fct>            <fct>       <dbl>
    ## 1 Japan            Asia         80.7
    ## 2 Hong Kong, China Asia         80  
    ## 3 Sweden           Europe       79.4
    ## 4 Switzerland      Europe       79.4
    ## 5 Iceland          Europe       79.0
    ## 6 Australia        Oceania      78.8

``` r
# This command uses the default ascending (increasing) order with
# respect to life expectancy (order smaller to larger)
gapminder %>% 
  filter(year==1997) %>%  
  select(country, continent, lifeExp) %>% 
  arrange(lifeExp) %>% 
  head()
```

    ## # A tibble: 6 × 3
    ##   country      continent lifeExp
    ##   <fct>        <fct>       <dbl>
    ## 1 Rwanda       Africa       36.1
    ## 2 Sierra Leone Africa       39.9
    ## 3 Zambia       Africa       40.2
    ## 4 Angola       Africa       41.0
    ## 5 Afghanistan  Asia         41.8
    ## 6 Liberia      Africa       42.2

## 4.7 Grouped Filter

Another useful verb in the *tidyverse* is `group_by`. Suppose we wanted
to view the two countries with the highest life expectancy in 1997, in
each continent.

``` r
gapminder %>% 
  filter(year==1997) %>%  
  select(country, continent, lifeExp, pop) %>%
  dplyr::group_by(continent) %>%
  dplyr::top_n(n=2,wt=lifeExp) %>%
  dplyr::arrange(continent) %>%
  knitr::kable()
```

| country          | continent | lifeExp |       pop |
|:-----------------|:----------|--------:|----------:|
| Reunion          | Africa    |  74.772 |    684810 |
| Tunisia          | Africa    |  71.973 |   9231669 |
| Canada           | Americas  |  78.610 |  30305843 |
| Costa Rica       | Americas  |  77.260 |   3518107 |
| Hong Kong, China | Asia      |  80.000 |   6495918 |
| Japan            | Asia      |  80.690 | 125956499 |
| Sweden           | Europe    |  79.390 |   8897619 |
| Switzerland      | Europe    |  79.370 |   7193761 |
| Australia        | Oceania   |  78.830 |  18565243 |
| New Zealand      | Oceania   |  77.550 |   3676187 |

## 4.8 New Variables Using Mutate

``` r
gapminder %>%
  dplyr::mutate(logpopulation = log(pop)) %>%
  dplyr::glimpse()
```

    ## Rows: 1,704
    ## Columns: 7
    ## $ country       <fct> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanista…
    ## $ continent     <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, As…
    ## $ year          <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 19…
    ## $ lifeExp       <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, …
    ## $ pop           <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372…
    ## $ gdpPercap     <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.11…
    ## $ logpopulation <dbl> 15.94675, 16.03915, 16.14445, 16.26115, 16.38655, 16.515…

``` r
gapVers1 <- gapminder %>%
  dplyr::mutate(logpopulation = log(pop)) %>%
  dplyr::rename(logPop=logpopulation) 
#
  dplyr::glimpse(gapVers1)
```

    ## Rows: 1,704
    ## Columns: 7
    ## $ country   <fct> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanistan", …
    ## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, …
    ## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 1997, …
    ## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 40.8…
    ## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372, 12…
    ## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.1134, …
    ## $ logPop    <dbl> 15.94675, 16.03915, 16.14445, 16.26115, 16.38655, 16.51555, …

The `if_else` function from *dplyr* has the form \`if_else(logical
condition,value if TRUE, value if FALSE).

The next example uses the “T-pipe” function `%T>%` to break the piping
so that the result of the second `mutate` flows to both `glimpse` and to
`head` - in this construction, it is understood the output of `glimpse`
does not pipe to `head`, but rather the original data flow from the
second `mutate`.

``` r
gapminder %>% 
  dplyr::mutate(region = if_else(continent=="Oceania","Oceania","NotOceania")) %>%
  dplyr::mutate(regionf = as_factor(region)) %T>%
  dplyr::glimpse() %>%
  head()
```

    ## Rows: 1,704
    ## Columns: 8
    ## $ country   <fct> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanistan", …
    ## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, …
    ## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 1997, …
    ## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 40.8…
    ## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372, 12…
    ## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.1134, …
    ## $ region    <chr> "NotOceania", "NotOceania", "NotOceania", "NotOceania", "Not…
    ## $ regionf   <fct> NotOceania, NotOceania, NotOceania, NotOceania, NotOceania, …

    ## # A tibble: 6 × 8
    ##   country     continent  year lifeExp      pop gdpPercap region     regionf   
    ##   <fct>       <fct>     <int>   <dbl>    <int>     <dbl> <chr>      <fct>     
    ## 1 Afghanistan Asia       1952    28.8  8425333      779. NotOceania NotOceania
    ## 2 Afghanistan Asia       1957    30.3  9240934      821. NotOceania NotOceania
    ## 3 Afghanistan Asia       1962    32.0 10267083      853. NotOceania NotOceania
    ## 4 Afghanistan Asia       1967    34.0 11537966      836. NotOceania NotOceania
    ## 5 Afghanistan Asia       1972    36.1 13079460      740. NotOceania NotOceania
    ## 6 Afghanistan Asia       1977    38.4 14880372      786. NotOceania NotOceania

## 4.9 Simple Counting Using tally() and count()

We frequently wish to know how many observations/rows satisfy a set of
conditions. We will filter the observations for the given conditions,
then count them using the `tally()` or `count()` functions from *dplyr*.

Essentially, `count()` is a short-hand for `group_by() + tally()`.

For example, what if we want to know how many observations are from
continent ‘Americas’ in 1997.

These examples have no grouping, no `group_by` is being used.

``` r
gapminder %>% dplyr::filter(year==1997) %>%
  dplyr::filter(continent=="Americas") %>%
  dplyr::tally()
```

    ## # A tibble: 1 × 1
    ##       n
    ##   <int>
    ## 1    25

``` r
gapminder %>% dplyr::filter(year==1997) %>%
  dplyr::group_by(continent) %>%
  dplyr::filter(continent=="Americas") %>%
  dplyr::tally()
```

    ## # A tibble: 1 × 2
    ##   continent     n
    ##   <fct>     <int>
    ## 1 Americas     25

## 4.10 Missing Values

``` r
x <- c(1,2,NA,4)
y <- c(11,12,13,NA)
z <- c(7,8,9,10)
tempdf <- data.frame(x,y,z)
tempdf
```

    ##    x  y  z
    ## 1  1 11  7
    ## 2  2 12  8
    ## 3 NA 13  9
    ## 4  4 NA 10

``` r
# count missing values for variable x
tempdf %>%
  dplyr::summarise(count = sum(is.na(x)))
```

    ##   count
    ## 1     1

``` r
# count rows with missing y
tempdf %>%
  dplyr::tally(is.na(y))
```

    ##   n
    ## 1 1

``` r
# subset of rows with complete data for specified columns
tempdf %>%
  dplyr::select(y,z) %>%
  tidyr::drop_na() %>%
  head()
```

    ##    y z
    ## 1 11 7
    ## 2 12 8
    ## 3 13 9
