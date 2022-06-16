tmp$`22Rv-1 cell`


tmp$`22Rv-1 cell` %>% pluck("gene","symbol")

tmp$`22Rv-1 cell` %>% pluck(3)

extracFromList <- function(x,
                           item = c("gene",
                                    "thresholdValue",
                                    "standardizedValue")) {


  if(item %in% c("gene","thresholdValue","standardizedValue")) {
    if(item == "gene") {

      x %>%
        purrr::map(~pluck(.x,item,1))
    } else {
      x %>%
        purrr::map(~pluck(.x,item))
    }
  }
}

extracFromList(tmp)
