\name{read.gmt}
\alias{read.gmt}

\title{
  Read in gene set information from .gmt files
}
\description{
This function reads in and parses information from the MSigDB's .gmt files. Pathway information will be returned as a list of gene sets.
}
\usage{
read.gmt(file)
}

\arguments{
  \item{file}{The .gmt file to be read}
}
\details{
The .gmt format is a tab-delimited list of gene sets, where each line is a separate gene set. The first column must specify the name of the gene set, and the second column is used for a short description (which this function discards). For complete details on the .gmt format, refer to the Broad Institute's Data Format's page (url: \url{http://www.broadinstitute.org/cancer/software/gsea/wiki/index.php/Data_formats}).
}
\value{
  A list, where each index represents a separate gene set. 
}

\section{Warning}{
  The function does not check that the file is correctly formatted, and may return incorrect or partial gene sets, e.g. if the first two columns are omitted. Please make sure that files are correctly formatted before reading them in using this function.
}