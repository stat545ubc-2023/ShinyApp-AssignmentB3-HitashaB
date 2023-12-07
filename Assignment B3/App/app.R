

library(shiny)
library (gapminder)
library(tidyverse)
library (ggplot2)
country_list <- levels(factor(gapminder$country)) # to list all countries

ui <- (fluidPage(

    # Application title
    titlePanel("Gapminder App"),

    # Sidebar that contains a drop down list to filter by country and
    # Slide bar to further filter data by year.
    # These features allow you to explore the relationship between 2 variables
    # With more specific constraints.
    sidebarLayout(
        sidebarPanel("Select the country and time range you wish to explore
                     below.",
        selectInput("select_country",
                    label = "Country:",
                    choices = country_list

    ),
    sliderInput("time_range",
                label="Year Range:",
                min=1952, max=2007, value=c(1952,2007), sep = ""
                ) # min and max set to range of years data was accumalated for.
    ),

        mainPanel("",
          plotOutput("id_point"), # generates plot
          tableOutput("id_table"), # generates table
          textOutput("output_country") # lists inputted country

    )
  )
))


server <- (function(input, output) {

  # Code for plot that is interactive and responds to user input.
  # Creates plot showing data for the country and year range inputted by user.
  # This feature plots and shows the relationship between life expectancy and
  # GDP per capita.
  # Alpha transparency set to 0.8 so points can be seen clearly.
  # x axis set to log scale for monetary data points.
    output$id_point <- renderPlot({
      ggplot(subset(gapminder,(country==input$select_country & year >=
                                 input$time_range[1] & year <=
                                 input$time_range[2])),aes(gdpPercap, lifeExp))+
        geom_point(alpha=0.8)+
        scale_x_log10("GDP per capita", labels = scales::dollar_format())+
        ylab("Life Expectancy")

    })

    # Code for table that is interactive and responds to user input.
    # Creates table showing data for the country and year range inputted by user
    # This feature allows all variables to be seen for each entry.
    output$id_table <- renderTable({
      subset(gapminder, country==input$select_country & year >=
               input$time_range[1] & year <= input$time_range[2])
    })
    output$output_country <- renderText({
      paste("Country selected", input$select_country)
    })
})

# Run the application
shinyApp(ui = ui, server = server)
