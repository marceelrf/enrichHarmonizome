#' Title
#'
#' @param x
#'
#' @return
#' @export
#'
#' @examples
Dataset2List <- function(x){

  require(httr)
  require(jsonlite)
  require(magrittr)
  require(dplyr)
  require(purrr)

  query <- db %>%#AQUI ESTA O PROBLEMA
    dplyr::filter(name == x) %>%
    dplyr::pull(href)


  req <- httr::GET(url = paste("https://maayanlab.cloud/Harmonizome",query,sep = ""))

  list_json <- httr::content(req,"text",encoding = "UTF-8") %>%
    jsonlite::fromJSON()

  final_list <- list()
  for(i in 1:nrow(list_json$geneSets)){

    req2 <- httr::GET(url = paste("https://maayanlab.cloud/Harmonizome",list_json$geneSets[i,2],sep = ""))

    list_path <- httr::content(req2,"text",encoding = "UTF-8") %>%
      jsonlite::fromJSON()

    final_list[[i]] <- list_path %>%
      purrr::pluck("associations")

    names(final_list)[[i]] <- list_path %>%
      purrr::pluck("attribute","name")

    print("= = = = = = = = = = = = = = = = = = = = = = = = = = = = = = =")
    if(nrow(list_json$geneSets)-i != 0){
      print(paste("Faltam ",nrow(list_json$geneSets)-i))
    } else {
      print("ACABOUUU!!!!")
    }
  }
  return(final_list)
}


