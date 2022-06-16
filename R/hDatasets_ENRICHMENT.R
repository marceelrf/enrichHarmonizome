#' This function wrap-up the \code{enricher} function from \code{clusterProfiler} package to perform Over Representation Analysis
#'
#'
#' Perform the Over Representation Analysis
#'
#' @param gene a vector of gene symbols.
#' @param pvalueCutoff adjusted pvalue cutoff on enrichment tests to report.
#' @param pAdjustMethod one of "holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none".
#' @param universe background genes. If missing, the all genes listed in the database (eg TERM2GENE table) will be used as background.
#' @param minGSSize minimal size of genes annotated for testing.
#' @param maxGSSize maximal size of genes annotated for testing.
#' @param qvalueCutoff qvalue cutoff on enrichment tests to report as significant.  Tests must pass i) \code{pvalueCutoff} on unadjusted pvalues, ii) \code{pvalueCutoff} on adjusted pvalues and iii) \code{qvalueCutoff} on qvalues to be reported.
#' @param TERM2GENE TERM2GENE user input annotation of TERM TO GENE mapping, a data.frame of 2 column with term and gene.
#' @param TERM2NAME TERM2NAME user input of TERM TO NAME mapping, a data.frame of 2 column with term and name. If missing, the description column will not be returned on the results.
#'
#' @return A \code{enrichResult} instance
#' @export
#' @author Marcel Ferreira
#' @examples
hDatasets_ENRICHMENT <- function(gene, pvalueCutoff = 0.05, pAdjustMethod = "BH",
                               universe = NULL, minGSSize = 10, maxGSSize = 500,
                               qvalueCutoff = 0.2,
                               TERM2GENE, TERM2NAME = NA){

  require(clusterProfiler)
  require(org.Hs.eg.db)
  require(dplyr)

  tmp <- enricher(gene = gene,
           pvalueCutoff = pvalueCutoff,
           pAdjustMethod = pAdjustMethod,
           universe = universe,
           minGSSize = minGSSize,
           maxGSSize = maxGSSize,
           qvalueCutoff = qvalueCutoff,
           TERM2GENE = TERM2GENE,
           TERM2NAME = TERM2NAME)

  if(is.na(TERM2NAME)) {
    tmp@result <-  tmp@result %>%
      select(-Description)
  }


  return(tmp)
}
