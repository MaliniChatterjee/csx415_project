#' Save Plot
#' This function saves all plots in the path/PlotName provided.
#'
#' @param  PlotName,myPlot
#' @keywords
#' @export
#' @examples
#'
#'
#' savePlot(PlotName,myPlot)
savePlot <- function(PlotName,myPlot) {
  pdf(PlotName)
  print(myPlot)
  dev.off()
}
