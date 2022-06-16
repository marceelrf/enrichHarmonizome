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

