hDatasets_show <- function(){
  #This function shows all Datasets available in Harmonizome API

  require(httr)
  require(jsonlite)
  require(magrittr)

  ds <- "https://maayanlab.cloud/Harmonizome/api/1.0/dataset"

  req <- GET(url = ds)

  list_json <- content(req,"text") %>%  fromJSON()
  list_json$entities
}
