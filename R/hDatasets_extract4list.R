hDatasets_extract4list <- function(x){

  require(dplyr)
  require(purrr)
  require(stringr)

  nms <- names(x)

  y <- x %>%
    map(.f = ~pull(.x,symbol))

  names(y) <- nms

  return(y)
}
