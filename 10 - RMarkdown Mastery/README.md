
# Advanced R Markdown

Todays topics:

- Recap of some Markdown
- R Markdown possibilities
- Advanced outputs with external packages

## Topic Overview

Today we want to dive deeper much into the technique of R Markdown. We
will look at the possibilities of creating slides and real reports. Also
the creation of Dashboards will be discussed.

![](data-science-communicate.png)

## R Markdown documents

As mentioned in an earlier lesson, RMarkdown is the technique to create
Documents with embedded R code and the corresponding figures. Here is a
small recap what is possible:

### Recap of RMarkdown

Within the `.Rmd` document, there is some markdown syntax combined with
special code blocks annotated with `{r}`:

    ```{r}
    a <- 1
    b <- 2
    a + b*2
    ```

These are executed during rendering, which is also called knitting. This
will result in the following:

``` r
a <- 1
b <- 2
a + b*2
```

    ## [1] 5

A minimal example is shown in `Minimal.Rmd`. You can either render this
File through RStudio or you can use the `rmarkdown` library with the
`render` command.

As an additional setup loading you can use a setup part like the
following in the beginning.

    ```{r setup, include=FALSE}
    library(tidyverse)
    iris %>% tibble -> data
    ```

In case you use the `render` command, all environment variables are also
present in the document and can be used. In this way you can create a
nice document which is based on your own project and can describe the
usage of this project. Also, the variables which are saved in a cell are
accessible in all forthcoming ones.

One last part of the `.Rmd` file is the `YAML` header which has all
important additional information for the final file:

    ---
    title: "Minimal Example"
    author: "Martin Reinhardt"
    date: "December 18th, 2022"
    output: html_document
    ---

Most output formats have even further setup possibilities:

    ---
    output:
      html_document:
        toc: true
        number_sections: true
        toc_float: true
        theme: flatly
    ---

You can also submit these additional information through the `render`
command. Please consult `?rmarkdown` for a better list of information on
this.

Some output formats need a complete **pandoc** installation, which is a
universal document converter. For this course explicitely, this is not
needed. But if you want to create fancy PDF documents, you will not get
around this step. [Pandoc-Link](https://pandoc.org/). Some versions of
RStudio also deliver a pandoc installation. You can check this by
`rmarkdown::pandoc_available()`

### Reports

Often, reports are created with the help of RMarkdown. Also bigger
companies like Airbnb creates knowledge reports directly in RMarkdown
([Reference](https://www.tandfonline.com/doi/abs/10.1080/00031305.2017.1392362?journalCode=utas20))
and even whole books can be written
([Reference](https://www.kff.org/health-costs/report/2017-employer-health-benefits-survey/))

One classic problem which occurs with documents and big data
applications is the printing of tibbles or data frames. Here you can set
the `df_print` value to `paged` in the setup. See:
`?rmarkdown::html_document()`

**Exercise**: Create a small report (html document) with at least 4 code
chunks and create at least 2 different figures. In the report you should
introduce the data of the iris dataset a bit and you should use
tidyverse. It is not about the topic of iris, bt mainly about testing
RMarkdown a bit. Also print the tibble of iris with a paged setup.

## R Markdown slides

Next to the classic reports, which can be rendered to PDF as well as
html documents (Markdown is an intermediate format, which is understood
very well by internet services like Github), There are many more output
formats. With R Markdown it is possible to create data driven slides.
There are many possibilities to create slides with Pandoc through Beamer
(Latex) or directly with Powerpoint.

Here, we will introduce the `ioslides` and the `xaringan` package. Both
create HTML presentations and don’t need pandoc or latex installations.

### slides with ioslides

Ioslides is the easiest way to create fast and simple HTML
presentations. Here is a small example YAML header

    ---
    output:
      ioslides_presentation:
        incremental: true (render bullets incrementallly throughout the slides)
        widescreen: true (present slide using wider form)
        smaller: true (use smaller text size throughout the slides)
        transition: [default, slower, faster, 0.5] (choose transition speed, or specify how many seconds)
    ---

Please consult the minimal ioslides example in the file
`Prezi_ioslides.Rmd`.

Slides are created after every header element `#` or `##`. Additionally
you can insert a slide-break with `---`. Slide breaks are like a
page-break, but do not change the slide-layout.

Another important aspect of slides are incremental bullets. You can set
them up globally in the YAML header but also in the slide or even inside
a line of bulletins with the `> *` command.

The presenting of slides give additional functionality. Try them out.

- `f` fullscreen mode
- `w` widescreen mode
- `o` overview mode
- `h` code highlight mode
- `p` presenter notes

Logos in presentations are resized to 85x85 pixels. There are way to
redesign this which includes HTML/CSS knowledge.

### slides with xaringan

Another Package which creates probably the best presentations possible
in R Markdown is `xaringan`. You need to install the package with

    # install from CRAN
    install.packages('xaringan')

Xaringan presentations have several amazing features. Let’s start with
some things how to use them. You can use the `h` key to show help how
you can control them. A classic approach is to clone the presentation to
have two browser windows. These are synced. Usually you run one in
presenter mode and the other in fullscreen mode.

Please consult the `Prezi_xaringan.Rmd` for a minimal introduction to
`xaringan`. There are much more details to this library. This file just
gives a very rough introduction.

**Exercise:** Create a Presentaion with at least 5 slides about some R
code about the iris dataset. You can use either `ioslides` or
`xaringan`.

## Dashboards

Next to many more format ideas which are provided by R Markdown are
Dashboards. These are small HTML widgets which provide a nice overview
of data and plots. We will use the `flexdashboard` package. But there
are even more extensions and packages.

    # install from CRAN
    install.packages("flexdashboard")

Please consult the file `Dashboard.Rmd` for a small example for the iris
dataset.

Usually Dashboards are for web services and should contain active
real-time elements. But they are also useful for presenting data for
upcoming users. Therefore This is just a very small showcase, what is
possible with R Markdown flexdashboards.

For showing big samples of dataframes or tibbles, it is recommended to
use the `knitr::kable` function to have a nicer output. Also one should
not print all values, but only a sample in case of Markdown documents or
PDF. In case of dynamic outputs like dashboards or pure HTML documents,
a scrollbar is inserted automatically.

``` r
data %>% sample_n(10) %>% knitr::kable()
```

| Sepal.Length | Sepal.Width | Petal.Length | Petal.Width | Species    |
|-------------:|------------:|-------------:|------------:|:-----------|
|          4.8 |         3.4 |          1.6 |         0.2 | setosa     |
|          5.7 |         4.4 |          1.5 |         0.4 | setosa     |
|          6.4 |         3.2 |          4.5 |         1.5 | versicolor |
|          5.7 |         2.5 |          5.0 |         2.0 | virginica  |
|          4.8 |         3.4 |          1.9 |         0.2 | setosa     |
|          6.4 |         2.9 |          4.3 |         1.3 | versicolor |
|          5.4 |         3.9 |          1.7 |         0.4 | setosa     |
|          6.3 |         2.5 |          5.0 |         1.9 | virginica  |
|          5.6 |         3.0 |          4.1 |         1.3 | versicolor |
|          5.0 |         3.0 |          1.6 |         0.2 | setosa     |

The icons which are used in the dashboard, are based on the icons from
[Font Awesome](https://fontawesome.com/). You can pick them there and
use them in the dashboard.

Usually Dashboards are used in combination with the `Shiny` package. We
will have a small introduction into this later in our lectures.

**Exercise:** Construct a basic dashboard about WDI values with 1 page
and 3 panes. Choose an index and show a world map with projected index
values in a specific year. In a second pane plot the time series for a
specific country. Finally, describe in a few lines, what is shown in the
plots in the third pane.

## Further Reading

There are many different and very good resources out in the internet.
Here are some I would recommend.

- <https://bookdown.org/yihui/rmarkdown/>
- <https://bookdown.org/yihui/rmarkdown-cookbook/>
- <https://zsmith27.github.io/rmarkdown_crash-course/>
- <https://www.hzaharchuk.com/rmarkdown-guide/>
