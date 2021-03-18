
###.gitignore saves only the files that are useful (rdata rhistory yes)
###.Rbuildignore list that states not worth to be used in the building of our package
###DESCRIPTION info like project name, title of the project, etc, author, version n, maintainer: fix and mantein the pack-->info if u want to make it public
###NAMESPACE
###the project file
###the R folder: with comments and the hello functions
###the man folder: an example of documentation of the hello fc, is the manual folder!

## Create a new package with RStudio

# Package setup -----------------------------------------------------------

## Use version control
#install.packages("usethis")
###instead of writing library(usethis) we can put usethis::use_git_config
###this is to configure GIT: for the project,ur name e ur email
usethis::use_git_config(
  scope = "project",
  user.name = "Ludovica De Carolis",
  user.email = "l.decarolis@campus.unimib.it"
)
usethis::use_git()
###it is an interactive procedure, it always ask you smth: ask to commit, reply yes (the answers changes!)
###
# v Adding files
# v Making a commit with message 'Initial commit'
# Warning messages:
#   1: In readLines(f, n) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
# 2: In readLines(f, n) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
# 3: In readLines(file) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
###--->in the git tab everything disappear, in diff>history you have the initial commit
###this fc create the first commit
###commit is the way git saves your actual version, create a snapshot of what u have in the folder now

###we want to create the dev directory--->u can see in the files!
# avoid problem with the dev scripts: dev/package-utility.R (this file)
dir.create("dev")
###now we want to add this folder dev to the build ignore r file: (where we want to put scripts that are not part of the package)
# save this file in `dev` as `setup.R`
usethis::use_build_ignore("dev")
# now you can save or move this file in "dev"
# v Adding '^dev$' to '.Rbuildignore'
# Warning messages:
#   1: In readLines(f, n) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
# 2: In readLines(f, n) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
# 3: In readLines(file) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
###in the git hub u see you have now a modification Rbuildignore
###-->let s see the differences in the diff tab (new line in green!) and if you open Rbuildignore u can see
###git let u see the modification since latest commit to now

# Fill in the DESCRIPTION file
# rstudioapi::navigateToFile( "DESCRIPTION" )
usethis::use_description(
  list(
    Title = "The shapes Package",
    `Authors@R` = "person('Ludovica', 'De Carolis', email = 'l.decarolis@campus.unimib.it', role = c('cre', 'aut'))",
    Description = "A sentence describing the package.",
    URL = "https://github.com/ludovicadecarolis/shapes" ###-->url of gif repository where u ll put the package
  ) ###username of github and better to put the same name of the package for the repository
)

# Warning messages:
#   1: In readLines(f, n) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
# 2: In readLines(f, n) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
# 3: In readLines(file) :
#   incomplete final line found on '/Users/ludovicadecarolis/r4ds/shapes/DESCRIPTION'
###So the description file is different now!-->u can see what has been changed from diff on the right up (verde)

###in diff>changes u see changes (between latest commit and folder project -R studio- called working directory in GIT, 2 independent software that work together!) in diff>history u see the saved modifications, the commits

###add the license, whichone u want, here the lgpl, there are a lot if u see usethis package, use_
usethis::use_lgpl_license()       # You can set another license here
###add the field of the license we are using on the DESCRIPTION file (lgpl in this case in a version greater than 3)
###add the license file in GIT in alto a dx, e ha ? because is untracked, is new
###add license to the Rbuildignore so when we ll build the package this file we ll be ignored

###useful!to tidy up the DESCRIPTION file
###to see the differences we can accept the modification ie put all the file in staged and create a new commit
###in the commit message u describe the latest modifications and also WHY!
###now all the modifications are lost, is empty BEC has been saved! you can see in history! (since the latest version u have no more changes)
###in history u can see if u click on each commit, for each file, all the modifications

usethis::use_tidy_description()   # sort fields and packages
###was already tide!

## Common tasks
###for example in ur package u want a presentation of the project: readme file is the right file to use
###is .md because is a markdown file: package name, installation procedure
###when I approach a someone else's project firstly I start from readme file: what is and how to use it
usethis::use_readme_md( open = FALSE )
# usethis::use_code_of_conduct()
# usethis::use_lifecycle_badge( "Experimental" )
# usethis::use_news_md( open = FALSE )


## Use tests: if you want to use tests
# usethis::use_testthat()
# installed.packages("devtools")
####------>the step of PACKAGE SETUP is finished
###put this file as setup-script.R in the DEV directory and add to a git repository with another commit

###commit cosa serve? we can come back and have other versions, this is all stored in the git repository and u have also the author!
###and u can push the modifications online and pull the other's modifications

###in the R folder u have the R file of the library, u will store all ur fcs (dev>shapes>R)

###shortcuts:
#   BUILD and Reload Package:  'Cmd + Shift + B'
###we have uploaded shapes
###now we call the function hello
###so we have the package installed working and we can create fcs in it
###se per esempio modifico la funzione hello poi rifaccio cmd shift b per ri-installare pacchetto per usarla nuova altrim ho la vecchia
###we won't source the code from here, we ll install the package or source them as a package

# Source as package            'Cmd + Shift + L' (LOAD) ###it doesn t work!
###u load the latest modifications if the package without installing them, is a temporary installation
###differenece betw INSTALLING and SOURCING: u re loading the package fcs without re-installing the package
###if I remove the package i cannot use library but if I do this command I can use the fcs of the package
###is not needed to restart R, just load the modifications (faster):
###cambio fz nel pacchetto, poi faccio questo comando e posso usare la fz modificata
###modify fc of library and reload to use it!
###create a new fc (r script) and save in R

#   Check Package:             'Cmd + Shift + E'
#   Test Package:              'Cmd + Shift + T'

# Develop -----------------------------------------------------------------
###not meant to be run sequentially!
###we want now to create documentation

## If you want to use roxygen, enable ROXYGEN in the project.
# Menu: tools > Project options > build tools > generate the documentation with roxygen
usethis::use_namespace(roxygen = TRUE) ###tell roxygen to manage the NAMESPACE file
devtools::document() # to fill NAMESPACE and documentation with ROXYGEN comments
###u still have nothing in the manual folder
###insert the documentation over a function definition: CNTR SHIFT ALT R (go to the function and when u are on the name)
###non funziona??
###this is roxygen, is a package/an add-on of r that create documentation in r code files, the documentation is made by comments
#' Title
#'
#' @param x
#' @param y
#'
#' @return
#' @export
#'
### #' the ' is a signal for roxygen that this line matters to it, so roxygen will read those lines and write documentation
###title: name of the fc, explanation, x, y, risultato (u can write the type of variable other than cos e!)
###now RELOAD the package and run devtools::document() to write the documentation->my_divion.Rd similar to a lateX file (text use to generate documentation)
# or roxygen2::roxygenise() # converts roxygen comments to .Rd files.
# or [Ctrl + Shift + D] in RStudio
###---->if u write help(my_division) u can see the documentation!!!
###the  @export is for the namespace! if u go to namespace u can see that is different now!generated by roxygen
###manage what function your package sees from other packages and what of your fc are available to the final user
###you cannot cancel this
###if u don t export u can use inside ur package but the final user can t (outside the package)
###CRAN repository from where we install packages
###if is a fc frequently use by the user u can t change it a lot of times (exported fc)
###--->export fcs to handuser

###write a new fc mtcars_manipulation (save in R), u have to put #' @export so in the NAMESPACE (after you rebuild the package*) there is also the export of it
###if u just cntr shift L* is available! but the final user u will not be able to use (you can because u are inside the package)
###if I put %>% inside the fc: if we write library(dplyr) and call the fc it works BUT we want that the loadings of the dependencies happen beyond this hint!!if we have 10 packages as dependencies is a mess
###go SETUP script to import dplyr package
## Add a package
usethis::use_package( "dplyr" )
###the only thing changed was the DESCRIPTION file
###reinstall the package and if I don t have installed dplyr it says the dependencies are not complete-->NOW shapes can t be used without dplyr installed
# remeber to add it to ROXYGEN :
#' @import dplyr  # ROXYGEN
###in the file with the new fc
###reinstall the package
###u see the NAMESPACE has also import(dplyr)
###if I use mutate I can t because I haven t loaded dplyr in my workspace!
###with DESCRIPTION and NAMESPACE files u can track the dependencies and provide the dependence list to the colleagues
###-->import fcs from other packages

## Build or load
# Load the package [CTRL + SHIFT + L] or install-and-reload [CTRL + SHIFT + B]

## Check the package for Cran or [CTRL + SHIFT + E]
devtools::check(document = FALSE) # check the package

## Add internal datasets
## If you want to provide data along with your package
usethis::use_data_raw( name = "my_dataset", open = FALSE )

## Tests
## Add one line by test you want to create
usethis::use_test( "hello" )

## Vignette
usethis::use_vignette("ThisTidyPackage")
devtools::build_vignettes()
# Install the package and see it with `vignette("ThisTidyPackage")`
# List your vignettes: vignette(package = 'cancRFDS')
# Install your package manually: devtools::install(build_vignettes = TRUE)

# Deploy ------------------------------------------------------------------

# devtools::missing_s3()
#
# devtools::check()
# rhub::check_for_cran()

