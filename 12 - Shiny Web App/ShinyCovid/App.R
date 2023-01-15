library(shiny)

## needed libraries
library(tidyverse)

# Pre-Computations and scripts
covid <- read_csv("data/owid-covid-data.csv")

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  # App title ----
  titlePanel("Shiny Example"),
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    # Sidebar panel for inputs ----
    sidebarPanel(
      selectInput(inputId = "selectedCountryVariable", 
                  label = "Choose a country to display",
                  choices = unique(covid$location),
                  selected = "Germany"
      ),
      sliderInput(inputId = "smoothingFactor",
                  label = "smoothing factor k:",
                  min = 1,
                  max = 10,
                  value = 3
      ),
      radioButtons(inputId = "internalSmoothing",
                   label = "Choose Smoothing Method",
                   choices = list(
                     "internal Smoothing" = 1,
                     "Smoothing over k values" = 2),
                   selected = 1
      )
    ),
    # Main panel for displaying outputs ----
    mainPanel(
      h1("First level title"),
      h2("Second level title"),
      h3("Third level title"),
      h4("Fourth level title"),
      h5("Fifth level title"),
      h6("Sixth level title"),
      p("p creates a paragraph of text."),
      # Output: simple plot
      plotOutput(outputId = "totalCasesPlot")
    )
  )
)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  # Plot of total new covid cases with smoothed data
  # This expression that generates a plot is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs change
  # 2. Its output type is a plot
  output$totalCasesPlot <- renderPlot({
    covid %>% filter(location==input$selectedCountryVariable) -> covid_country
    ggplot(covid_country) + aes(x=date, y = new_cases_smoothed) + geom_line()
  })
}

# Create Shiny app ----
shinyApp(ui = ui, server = server)