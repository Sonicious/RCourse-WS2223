
# Shiny Web Apps and Covid Data Analysis

Todays topics:

Recap of

- Data Processing
- Data Exploration
- Creating a new Project

Additionally Shiny Web App Development

## Topic Overview

Today we want to recap our whole processing pipeline in a small project
to find gaps in your knowledge and to give a small introduction into the
framework of `shiny`

As always: please install the following libraries:

``` r
install.packages("shiny") # for the shiny web application
install.packages("zoo") # for the rollmean method for averaging
```

![](data-science-program.png)

## Covid-19 Data

Today’s data is about Covid-19 and comes from the organization “Our
World in Data”. Either download the data on your own
[here](https://github.com/owid) or simply download it from Moodle.

**Exercise**:

1.  Your first task is to load and explore the dataset a little bit
2.  Create a map to show the amount of total cases in each country on
    January 1st, 2023
3.  Also create a new tibble with only German data of new cases,
    smoothed new cases and total cases. Look at some plots.
4.  Repeat it but remove all `na` values before from the data
5.  Use the following mutation to create an averaged mean:
    `%>% mutate(new_cases_avg = rollmean(new_cases, k=5, fill=NA, align='right')) %>% drop_na(new_cases_avg)`.
    You need to load the `zoo` package before with `library(zoo)`.
6.  Create a plot to inspect the curve for new cases in Germany. How
    does the parameter `k` control the output?
7.  Add nice axes descriptions to the plot and add a title

## Shiny web app

Shiny is a small framework to create a dashboard like `flexdashboard`.
There is an unfinished example in the folder `ShinyCovid`. Copy the file
`owid-covid-data.csv` in a new folder with the name `data` inside
`ShinyCovid`. Then run the application with `runApp("ShinyCovid/")`
after loading the `shiny` package.

**Exercise**:

1.  The new framework creates a small application, which is reactive.
    Play around with it a bit
2.  Look at the source of the file `App.R`. The shiny part is divided
    into three parts: setup if the ui, setup of the server and running
    both together. Find out with the source code, how to access the
    input values.
3.  Rewrite the style of the app a little bit to make it a bit nicer
    (less headings, a short sentence to introduce the data)
4.  Add a title and labels to the plot
5.  remove all `na` values before plotting from the data
6.  Change the data which is shown to the smoothed version, which was
    introduced from the `zoo` package. Don’t forget to load the package
    in the `app.R` file at the proper location. Use a fixed `k=5`.
7.  Access the radio button and include an `if` clause in your
8.  Access the slider variable to control the parameter `k`.
9.  Which `k` was probably used to smooth the Covid data?
