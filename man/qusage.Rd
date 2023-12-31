 \name{qusage}
 \alias{qusage}
 \title{Run qusage on an expression dataset}
 \description{
   A wrapper function for the three primary steps in the qusage algorithm
 }
 \usage{
qusage(eset, labels, contrast, geneSets, pairVector=NULL,
       var.equal=FALSE, filter.genes=FALSE, n.points=2^12)
 }
 \arguments{
    \item{eset}{An objet of class \link[Biobase]{ExpressionSet} containing log normalized expression data (as created by the affy and lumi packages), OR a matrix of log2(expression values), with rows of features and columns of samples}
    \item{labels}{Vector of labels representing each column of eset}
    \item{contrast}{A string describing which of the groups in 'labels' we want to compare. This is usually of the form 'trt-ctrl', where 'trt' and 'ctrl' are groups represented in 'labels'}
    \item{geneSets}{Either a list of pathways to be compared, or a vector of gene names representing a single gene set. See Description for more details.}
    \item{pairVector}{A vector of factors (usually just 1,2,3,etc.) describing the sample pairings. This is often just a vector of patient IDs or something similar. If not provided, all samples are assumed to be independent.}
    \item{var.equal}{A logical variable indicating whether to treat the two variances as being equal. If TRUE then the pooled variance is used to estimate the variance otherwises the Welch approximation is used.}
    \item{filter.genes}{A boolean indicating whether the genes in eset should be filtered to remove genes with low mean and sd.}
    \item{n.points}{The number of points at which to sample the convoluted t-distribution. This should be increased when running qusage with a small number of samples (i.e. 6 or less in total). See \code{\link{aggregateGeneSet}} for more information.}

 }
 \details{
  This function runs the entire qusage method on the input data, returning a single QSarray object containing the results of the three primary steps in the qusage algorithm: \link{makeComparison}, \link{calcVIF}, and \link{aggregateGeneSet}. Many of the parameters are left out of this function for simplicity, so for greater control each of the functions must be called separately.
  
  Gene sets are commonly obtained from online databases such as Broad's Molecular Signatures Database. Gene set lists can be obtained from these sites in the form of .gmt files, which can be read into R using the \code{\link{read.gmt}} function. Once the data has been read into R, the information can be passed into the qusage function as either a vector describing a single gene set, or a list of vectors representing a group of gene sets. Each pathway must be a character vector with entries matching the row names of \var{eset}. If a pathway does not contain any values matching the rownames of \var{eset}, a warning will be printed, and the function will return NAs for the values of that pathway.
  
 }
 
 \value{
   A \link[=QSarray-class]{QSarray} object.
 }
 \examples{
 
##create example data - a set of 500 genes normally distributed across 20 patients
  eset = matrix(rnorm(500*20),500,20, dimnames=list(1:500,1:20))
  labels = c(rep("A",10),rep("B",10))
   
##create a number of gene sets with varying levels of differential expression.
  geneSets = list()
  for(i in 0:10){
    genes = ((30*i)+1):(30*(i+1))
    eset[genes,labels=="B"] = eset[genes,labels=="B"] + rnorm(1)
    
    geneSets[[paste("Set",i)]] = genes
  }
   
   
##calculate qusage results
  results = qusage(eset,labels, "B-A", geneSets)
 
 
 }





