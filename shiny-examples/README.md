See a comprehensive list of R Shiny examples at <<https://github.com/rstudio/shiny-examples/>>

You can see them in action on `http://gallery.shinyapps.io/example-name` where `example-name` is the directory
name of an example here, e.g. http://gallery.shinyapps.io/001-hello

To run the examples locally, you can install the **shiny** package in R, and
use the function `runGitHub()`. For example, to run the example `001-hello`:

```R
if (!require('shiny')) install.packages("shiny")
shiny::runGitHub("shiny-examples", "rstudio", subdir = "001-hello")
```

Or you can clone or download the repository, and use run
`shiny::runApp("001-hello")`.
