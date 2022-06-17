#' This function convert the output list from the \code{hDatasets_extract4list} to a two column tibble with the TERM and GENE.
#'
#'
#' @title Create a term-gene tibble
#'
#' @param x a list output of \code{hDatasets_extract4list}
#'
#' @return a two column tibble.
#' @export
#'
#' @author Marcel Ferreira
#' @examples
hDatasets_TERM2GENE <- function(x){

  require(tibble)
  require(dplyr)
  require(tidyr)

  x %>%
    tibble() %>%
    mutate(Term = names(x)) %>%
    select(Term, Genes = '.') %>%
    unnest(Genes)
}

