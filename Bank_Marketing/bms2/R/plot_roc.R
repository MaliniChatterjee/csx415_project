#' Plot ROC
#' This creates the ROC Plot for model comparison.
#' Models under consideration are
#' decision tree, logistic regression, random forest
#' @param  perf_tbl
#' @keywords
#' @export
#' @examples
#'
#'
#' plot_roc(perf_tbl)

plot_roc <- function(perf_tbl,plot_save_file) {
  p <- ggplot(data = perf_tbl, aes(x = fpr, y = tpr, group=Model, colour=Model)) +
    geom_line() +
    geom_abline(intercept = 0, slope = 1, lty = 3) +
    labs(x = 'False positive rate', y = 'True positive rate') +
    theme_bw()
    savePlot(plot_save_file,p)
  return(p)
}
