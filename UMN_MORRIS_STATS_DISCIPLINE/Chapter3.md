Chapter 3 Overview of a Dataframe
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

## 3.1 glimpse

Let’s look at what is inside the gapminder dataset using the `glimpse`
command from the *dplyr* package. The *dplyr* package is contained in
the package “tidyverse” that was loaded previously. The
`glimpse(gapminder)` command would have executed without any errors. We
use the `dplyr::` prefix to inform readers that the glimpse function
resides in the *dplyr* package.

``` r
dplyr::glimpse(gapminder)
```

    ## Rows: 1,704
    ## Columns: 6
    ## $ country   <fct> "Afghanistan", "Afghanistan", "Afghanistan", "Afghanistan", …
    ## $ continent <fct> Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, Asia, …
    ## $ year      <int> 1952, 1957, 1962, 1967, 1972, 1977, 1982, 1987, 1992, 1997, …
    ## $ lifeExp   <dbl> 28.801, 30.332, 31.997, 34.020, 36.088, 38.438, 39.854, 40.8…
    ## $ pop       <int> 8425333, 9240934, 10267083, 11537966, 13079460, 14880372, 12…
    ## $ gdpPercap <dbl> 779.4453, 820.8530, 853.1007, 836.1971, 739.9811, 786.1134, …

Each variable name is listed along with a variable type designation.

- fct: means a factor variable, also known as a categorical variable.

- int: means a quantitative variable that takes only integer or whole
  number values.

- dbl: means double precision, a quantitative variable that is
  essentially continuous - taking decimal values.

## 3.2 head

By default, the `head` command will show the first 6 rows of the dataset
gapminder. Datasets in R are called “dataframes.” The gapminder
dataframe is denoted as a “tibble” which is a type of dataframe.

Options to the `head` command can change the rows displayed.

``` r
# default is to show 6 rows
#head(gapminder)
head(gapminder,n=13)
```

    ## # A tibble: 13 × 6
    ##    country     continent  year lifeExp      pop gdpPercap
    ##    <fct>       <fct>     <int>   <dbl>    <int>     <dbl>
    ##  1 Afghanistan Asia       1952    28.8  8425333      779.
    ##  2 Afghanistan Asia       1957    30.3  9240934      821.
    ##  3 Afghanistan Asia       1962    32.0 10267083      853.
    ##  4 Afghanistan Asia       1967    34.0 11537966      836.
    ##  5 Afghanistan Asia       1972    36.1 13079460      740.
    ##  6 Afghanistan Asia       1977    38.4 14880372      786.
    ##  7 Afghanistan Asia       1982    39.9 12881816      978.
    ##  8 Afghanistan Asia       1987    40.8 13867957      852.
    ##  9 Afghanistan Asia       1992    41.7 16317921      649.
    ## 10 Afghanistan Asia       1997    41.8 22227415      635.
    ## 11 Afghanistan Asia       2002    42.1 25268405      727.
    ## 12 Afghanistan Asia       2007    43.8 31889923      975.
    ## 13 Albania     Europe     1952    55.2  1282697     1601.

## 3.3 tail

``` r
tail(gapminder)
```

    ## # A tibble: 6 × 6
    ##   country  continent  year lifeExp      pop gdpPercap
    ##   <fct>    <fct>     <int>   <dbl>    <int>     <dbl>
    ## 1 Zimbabwe Africa     1982    60.4  7636524      789.
    ## 2 Zimbabwe Africa     1987    62.4  9216418      706.
    ## 3 Zimbabwe Africa     1992    60.4 10704340      693.
    ## 4 Zimbabwe Africa     1997    46.8 11404948      792.
    ## 5 Zimbabwe Africa     2002    40.0 11926563      672.
    ## 6 Zimbabwe Africa     2007    43.5 12311143      470.

## 3.4 summary

``` r
summary(gapminder)
```

    ##         country        continent        year         lifeExp     
    ##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
    ##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.20  
    ##  Algeria    :  12   Asia    :396   Median :1980   Median :60.71  
    ##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.47  
    ##  Argentina  :  12   Oceania : 24   3rd Qu.:1993   3rd Qu.:70.85  
    ##  Australia  :  12                  Max.   :2007   Max.   :82.60  
    ##  (Other)    :1632                                                
    ##       pop              gdpPercap       
    ##  Min.   :6.001e+04   Min.   :   241.2  
    ##  1st Qu.:2.794e+06   1st Qu.:  1202.1  
    ##  Median :7.024e+06   Median :  3531.8  
    ##  Mean   :2.960e+07   Mean   :  7215.3  
    ##  3rd Qu.:1.959e+07   3rd Qu.:  9325.5  
    ##  Max.   :1.319e+09   Max.   :113523.1  
    ## 

``` r
# usage of pipe operator
# Same idea, but using tidyverse pipe
gapminder %>% summary()
```

    ##         country        continent        year         lifeExp     
    ##  Afghanistan:  12   Africa  :624   Min.   :1952   Min.   :23.60  
    ##  Albania    :  12   Americas:300   1st Qu.:1966   1st Qu.:48.20  
    ##  Algeria    :  12   Asia    :396   Median :1980   Median :60.71  
    ##  Angola     :  12   Europe  :360   Mean   :1980   Mean   :59.47  
    ##  Argentina  :  12   Oceania : 24   3rd Qu.:1993   3rd Qu.:70.85  
    ##  Australia  :  12                  Max.   :2007   Max.   :82.60  
    ##  (Other)    :1632                                                
    ##       pop              gdpPercap       
    ##  Min.   :6.001e+04   Min.   :   241.2  
    ##  1st Qu.:2.794e+06   1st Qu.:  1202.1  
    ##  Median :7.024e+06   Median :  3531.8  
    ##  Mean   :2.960e+07   Mean   :  7215.3  
    ##  3rd Qu.:1.959e+07   3rd Qu.:  9325.5  
    ##  Max.   :1.319e+09   Max.   :113523.1  
    ## 

## 3.5 Dataframe Details: funModeling package

The *funModeling* package contains the `df_status` command which also
summarizes a dataframe - showing different aspects like missing values,
percentage of zero values, and also the number of unique values.

``` r
funModeling::df_status(gapminder)
```

    ##    variable q_zeros p_zeros q_na p_na q_inf p_inf    type unique
    ## 1   country       0       0    0    0     0     0  factor    142
    ## 2 continent       0       0    0    0     0     0  factor      5
    ## 3      year       0       0    0    0     0     0 integer     12
    ## 4   lifeExp       0       0    0    0     0     0 numeric   1626
    ## 5       pop       0       0    0    0     0     0 integer   1704
    ## 6 gdpPercap       0       0    0    0     0     0 numeric   1704

``` r
funModeling::data_integrity(gapminder)
```

    ## $vars_num_with_NA
    ## [1] variable q_na     p_na    
    ## <0 rows> (or 0-length row.names)
    ## 
    ## $vars_cat_with_NA
    ## [1] variable q_na     p_na    
    ## <0 rows> (or 0-length row.names)
    ## 
    ## $vars_cat_high_card
    ##         variable unique
    ## country  country    142
    ## 
    ## $MAX_UNIQUE
    ## [1] 35
    ## 
    ## $vars_one_value
    ## character(0)
    ## 
    ## $vars_cat
    ## [1] "country"   "continent"
    ## 
    ## $vars_num
    ## [1] "year"      "lifeExp"   "pop"       "gdpPercap"
    ## 
    ## $vars_char
    ## character(0)
    ## 
    ## $vars_factor
    ## [1] "country"   "continent"
    ## 
    ## $vars_other
    ## character(0)

## 3.6 Dataframe Details: skimr package

``` r
gapminder %>% 
  skimr::skim_without_charts() 
```

|                                                  |            |
|:-------------------------------------------------|:-----------|
| Name                                             | Piped data |
| Number of rows                                   | 1704       |
| Number of columns                                | 6          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |            |
| Column type frequency:                           |            |
| factor                                           | 2          |
| numeric                                          | 4          |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |            |
| Group variables                                  | None       |

Data summary

**Variable type: factor**

| skim_variable | n_missing | complete_rate | ordered | n_unique | top_counts                             |
|:--------------|----------:|--------------:|:--------|---------:|:---------------------------------------|
| country       |         0 |             1 | FALSE   |      142 | Afg: 12, Alb: 12, Alg: 12, Ang: 12     |
| continent     |         0 |             1 | FALSE   |        5 | Afr: 624, Asi: 396, Eur: 360, Ame: 300 |

**Variable type: numeric**

| skim_variable | n_missing | complete_rate |        mean |            sd |       p0 |        p25 |        p50 |         p75 |         p100 |
|:--------------|----------:|--------------:|------------:|--------------:|---------:|-----------:|-----------:|------------:|-------------:|
| year          |         0 |             1 |     1979.50 |         17.27 |  1952.00 |    1965.75 |    1979.50 |     1993.25 |       2007.0 |
| lifeExp       |         0 |             1 |       59.47 |         12.92 |    23.60 |      48.20 |      60.71 |       70.85 |         82.6 |
| pop           |         0 |             1 | 29601212.32 | 106157896\.74 | 60011.00 | 2793664.00 | 7023595.50 | 19585221.75 | 1318683096.0 |
| gdpPercap     |         0 |             1 |     7215.33 |       9857.45 |   241.17 |    1202.06 |    3531.85 |     9325.46 |     113523.1 |

## 3.7 describe: Hmisc package

``` r
gapminder %>% 
  Hmisc::describe() 
```

    ## . 
    ## 
    ##  6  Variables      1704  Observations
    ## --------------------------------------------------------------------------------
    ## country 
    ##        n  missing distinct 
    ##     1704        0      142 
    ## 
    ## lowest : Afghanistan        Albania            Algeria            Angola             Argentina         
    ## highest: Vietnam            West Bank and Gaza Yemen, Rep.        Zambia             Zimbabwe          
    ## --------------------------------------------------------------------------------
    ## continent 
    ##        n  missing distinct 
    ##     1704        0        5 
    ##                                                        
    ## Value        Africa Americas     Asia   Europe  Oceania
    ## Frequency       624      300      396      360       24
    ## Proportion    0.366    0.176    0.232    0.211    0.014
    ## --------------------------------------------------------------------------------
    ## year 
    ##        n  missing distinct     Info     Mean      Gmd      .05      .10 
    ##     1704        0       12    0.993     1980    19.87     1952     1957 
    ##      .25      .50      .75      .90      .95 
    ##     1966     1980     1993     2002     2007 
    ##                                                                             
    ## Value       1952  1957  1962  1967  1972  1977  1982  1987  1992  1997  2002
    ## Frequency    142   142   142   142   142   142   142   142   142   142   142
    ## Proportion 0.083 0.083 0.083 0.083 0.083 0.083 0.083 0.083 0.083 0.083 0.083
    ##                 
    ## Value       2007
    ## Frequency    142
    ## Proportion 0.083
    ## 
    ## For the frequency table, variable is rounded to the nearest 0
    ## --------------------------------------------------------------------------------
    ## lifeExp 
    ##        n  missing distinct     Info     Mean      Gmd      .05      .10 
    ##     1704        0     1626        1    59.47    14.82    38.49    41.51 
    ##      .25      .50      .75      .90      .95 
    ##    48.20    60.71    70.85    75.10    77.44 
    ## 
    ## lowest : 23.599 28.801 30     30.015 30.331, highest: 81.701 81.757 82     82.208 82.603
    ## --------------------------------------------------------------------------------
    ## pop 
    ##        n  missing distinct     Info     Mean      Gmd      .05      .10 
    ##     1704        0     1704        1 29601212 46384459   475459   946367 
    ##      .25      .50      .75      .90      .95 
    ##  2793664  7023596 19585222 54801370 89822054 
    ## 
    ## lowest :      60011      61325      63149      65345      70787
    ## highest: 1110396331 1164970000 1230075000 1280400000 1318683096
    ## --------------------------------------------------------------------------------
    ## gdpPercap 
    ##        n  missing distinct     Info     Mean      Gmd      .05      .10 
    ##     1704        0     1704        1     7215     8573    548.0    687.7 
    ##      .25      .50      .75      .90      .95 
    ##   1202.1   3531.8   9325.5  19449.1  26608.3 
    ## 
    ## lowest : 241.166 277.552 298.846 299.85  312.188
    ## highest: 80894.9 95458.1 108382  109348  113523 
    ## --------------------------------------------------------------------------------
