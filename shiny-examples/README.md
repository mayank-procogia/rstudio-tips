## Run applications in your browser

Copy and paste the following URLs in your browser to play with the shiny examples used in this repo.

<http://gallery.shinyapps.io/081-widgets-gallery>

<http://gallery.shinyapps.io/182-google-charts>

## Run applications in your local RStudio IDE

To run the examples locally, you can install the **shiny** package in R, and use the function `runGitHub()`. For example, to run the example `001-hello`:

``` r
if (!require('shiny')) install.packages("shiny")
shiny::runGitHub("shiny-examples", "rstudio", subdir = "001-hello")
```

Or you can clone or download the repository, and use run `shiny::runApp("001-hello")`.

## Reference

See a comprehensive list of R Shiny examples at <https://github.com/rstudio/shiny-examples/>

You can see them in action on [`http://gallery.shinyapps.io/example-name`](http://gallery.shinyapps.io/example-name) where `example-name` is the directory name of an example here, e.g. <http://gallery.shinyapps.io/001-hello>
