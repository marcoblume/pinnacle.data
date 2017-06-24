<div style='position:relative;float:right;'><img src='r-pinnacle-data-sm.png'></div>

[![CRAN Status Badge](https://www.r-pkg.org/badges/version/pinnacle.data)](https://cran.r-project.org/package=pinnacle.data) [![CRAN Total Downloads](http://cranlogs.r-pkg.org/badges/grand-total/pinnacle.data)](https://cran.r-project.org/package=pinnacle.data) [![CRAN Monthly Downloads](http://cranlogs.r-pkg.org/badges/pinnacle.data)](https://cran.r-project.org/package=pinnacle.data)

# Installing
devtools::install_github('marcoblume/pinnacle.data')

# General

All datasets include the market lines from www.pinnacle.com. Timestamps are in UTC. 

## MLB 2016 Data
This dataset contains all wagering lines for the entire MLB 2016 season.
The data is in tibble format with metadata such as time, team names, starting pitchers, etc. In-Game data is stored in a nest column named "Lines"

What was the range of expected total runs according to the prediction market at Pinnacle.

```{r}
library(tidyverse)

MLB2016 %>% 
  unnest() %>% 
  group_by(BaseballRefID) %>% 
  arrange(desc(EnteredDateTime)) %>% 
  slice(1) %>% 
  select(TotalPoints) %>% 
  group_by(TotalPoints) %>% 
  summarize(Count = n())
  
  # A tibble: 15 x 2
   TotalPoints Count
         <dbl> <int>
 1         6.0    14
 2         6.5    48
 3         7.0   168
 4         7.5   404
 5         8.0   364
 6         8.5   440
 7         9.0   367
 8         9.5   160
 9        10.0    73
10        10.5    40
11        11.0    22
12        11.5    10
13        12.0     7
14        12.5    12
15        13.0     2
```

## US 2016 Presidential Election Data

US 2016 Presidential Election data is also available now:

```{r}
library(pinnacle.data)
USA_Election_2016

# A tibble: 1,443 × 5
       EnteredDateTime      TeamName1    TeamName2 MoneyUS1 MoneyUS2
                <dttm>          <chr>        <chr>    <dbl>    <dbl>
1  2016-07-18 09:34:38 Hilary Clinton Donald Trump     -243      212
2  2016-07-18 19:15:42 Hilary Clinton Donald Trump     -251      218
3  2016-07-19 04:49:41 Hilary Clinton Donald Trump     -260      226
4  2016-07-19 21:48:05 Hilary Clinton Donald Trump     -281      243
5  2016-07-21 17:47:46 Hilary Clinton Donald Trump     -275      238
6  2016-07-21 20:09:50 Hilary Clinton Donald Trump     -271      235
7  2016-07-21 20:36:35 Hilary Clinton Donald Trump     -253      220
8  2016-07-21 20:37:24 Hilary Clinton Donald Trump     -237      207
9  2016-07-21 20:49:05 Hilary Clinton Donald Trump     -233      204
10 2016-07-21 20:55:19 Hilary Clinton Donald Trump     -252      219
# ... with 1,433 more rows
```

Note that we only have monney line prices for this event because outcome of the election is binary.

We can easily plot and track how the prices of Hilary Clinton and Donald Trump changed:

```{r}
library(ggplot2)

ggplot(data = USA_Election_2016 %>% filter(EnteredDateTime >='2016-11-08')) +
  geom_line(alpha = 1, 
            size = 2,
            aes(x= EnteredDateTime, 
                y = MoneyUS1,
                color = "Hilary Clinton")) +
  geom_line(alpha = 1, 
            size = 2,
            aes(x= EnteredDateTime, 
                y = MoneyUS2, 
                color = "Donald Trump")) +
  theme_bw() +
  ylab("Price")
```

![Sample Chart](https://raw.githubusercontent.com/marcoblume/pinnacle.data/master/sampleplot.png)