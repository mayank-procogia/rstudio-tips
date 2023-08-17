# This script, when run from an RStudio session with appropriate permissions,
# will deploy this app.

# Deployments ----

## Slides: Intro to R - History ----
### Step 1 - update Manifest ----
rsconnect::writeManifest(
  appDir = getwd(),
  appFiles = readLines("appFiles")
)

### Step 2 - Deploy application to Posit Connect ----
rsconnect::deployApp(
  appDir = getwd(),
  # appFiles = "Intro_to_R.html",
  appFileManifest = "manifest.json",
  appPrimaryDoc = "Intro_to_R.html",
  appSourceDoc = file.path(getwd(), "Intro_to_R.html"),
  appName = "Intro_to_R",
  appTitle = "Intro_to_R"
)


library(quarto)

get_server_base_name <- gsub(pattern = "www.", replacement = "", x = sapply(strsplit(Sys.getenv("CONNECT_SERVER"), "//|/"), "[", 2))

#### Add RS Connect Server to session ----
rsconnect::addServer(
  url = Sys.getenv("CONNECT_SERVER"),
  name = get_server_base_name,
  certificate = NULL,
  quiet = FALSE
)
logger::log_info("RS Connect Server registration successfull: {Sys.getenv('CONNECT_SERVER')}")


#### connect RS Connect Account ----
get_account_name <- rsconnect::accounts()[1,1]

rsconnect::connectApiUser(
  account = get_account_name,
  apiKey = Sys.getenv("CONNECT_API_KEY"),
  # server = "procogia.acuna.cloud",
  server = get_server_base_name,
  quiet = FALSE
)
logger::log_info("RS Connect Account registration via API successfull: {get_account_name}")

rsconnect::setAccountInfo(
  name = get_account_name,
  token = ,
  server = get_server_base_name
)


quarto::quarto_publish_doc(
  input = file.path(getwd(), "Intro_to_R.qmd"),
  # name = "Intro_to_R_slides",
  # title = "Intro_to_R",
  # server = Sys.getenv("CONNECT_SERVER"),
  # render = "local",
  render = "server"
  # account = get_account_name
)


rsconnect::deployApp(
  appDir = file.path(getwd(), "Intro_to_R.qmd"),
  quarto = quarto::quarto_path()
)


rsconnect::deployApp(
  appDir = getwd(),
  # quarto = quarto::quarto_path(),
  # appFiles = "Intro_to_R.html",
  appFiles = c("Intro_to_R.qmd", "Intro_to_R.html", "custom.scss", "data"),
  # appFileManifest = "manifest.json",
  appPrimaryDoc = "Intro_to_R.html",
  appSourceDoc = file.path(getwd(), "Intro_to_R.qmd"),
  account = get_account_name,
  server = Sys.getenv("CONNECT_SERVER"),
  appName = "intro_to_r"
  # appId = 199
  # appTitle = "Intro_to_R_test"
)



# References to setup ##################################################
## connect rs connect to local IDE ----
# https://procogia.acuna.cloud/__docs__/user/connecting/

## further readings ----
# https://rstudio.github.io/rsconnect/reference/deployApp.html
# https://procogia.acuna.cloud/__docs__/cookbook/
# https://docs.posit.co/connect/cookbook/deploying/


# https://quarto.org/docs/publishing/rstudio-connect.html#knitr-r
