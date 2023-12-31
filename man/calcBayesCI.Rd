 \name{calcBayesCI}
 \alias{calcBayesCI}
 \title{Calculate pathway Confidence Intervals}
 \description{
   A function to calculate the confidence intervals for each of the gene sets in the \var{geneResults} object
 }
 \usage{
calcBayesCI(QSarray,low=0.025,up=1-low,addVIF=!is.null(QSarray$vif))
 }
 \arguments{
    \item{QSarray}{A \code{QSarray} object, as generated by either makeComparison or aggregateGeneSet}
    \item{low, up}{the lower and upper bounds of the confidence interval.}
    \item{addVIF}{a logical indicating whether the VIF should be used to calculate the variance of the pathway.}
 }
 \details{
 This function can be used to calculate a confidence interval (CI) for the gene sets in \code{QSarray}. By default, a 95\% CI is calculated, with the lower and upper bounds at \code{0.025\%} and \code{0.975\%}, respectively. This function is used in \link{plotCIs} to plot the confidence intervals of each pathway.
 }
 
 \value{
   Matrix of size (\code{2 x numPathways(QSarray)}) containing the lower and upper bounds of the confidence intervals for each pathway in \code{QSarray}.
 }
