source("./group_aware_functions.R")
source("./build.R")

build_pkg()

dependencies <- 
  unique(
    unlist(
      lapply(GROUP_AWARE_FUNCTIONS,
             namespace)
    )
  )

lapply(dependencies, usethis::use_package)

devtools::document()
