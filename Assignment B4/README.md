## Assignment 4b - Shiny App Development (Continued)
For this assignment, I updated the Shiny App I previously created
for the Gapminder dataset. The new features that have been added are:

* An action button (i.e. search button that will change the plot and table to 
match the user input only when pressed)
* Separate tabs for the plot and table
* Buttons that allow you to download the data in your format of choice and a search bar allowing you to further filter the data

This application provides a plot showing the relationship between GDP per
capita and life expectancy. The application also contains a table that shows
all variables for each entry. The sidebar contains two features where you 
are able to select a country from the drop down list and change the range of 
years for which you would like to explore the data from. 
These interactive inputs also change the table and graph to correspond to the 
information selected.

### Contents
In this folder you will find the app.R file which contains the code for the app development.

### Features
* Separate tabs for the plot and table
* Plot showing the relationship between life expectancy and GDP per capita.
* Table listing all entries with all variables.
* Side Panel that contains:
  * Slide bar to choose the range of years you wish to see the data for.
  * Drop down list to choose the country you wish to see the data for.
  * Action Button (Search) that will change the plot and table to correspond
    with the user input only when it is pressed.
* Buttons that allow you to download the data in your format of choice.
  
### Data
The gapminder dataset can be used by installing and loading the gapminder 
package in RStudio (gapminder library).

### Link
Click [here](https://hitashab.shinyapps.io/AppB4/) for a 
running instance of the app.
