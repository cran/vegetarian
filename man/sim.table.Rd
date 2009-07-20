\name{sim.table}
\alias{sim.table}
\title{Similarity Summary Table}
\description{
Creates a summary table of community overlap for all possible pairwise combinations of samples (e.g. sites, plots) using the similarity function.
}
\usage{
sim.table(abundances, q = 1, labels = FALSE, half = TRUE, diag = TRUE, boot = FALSE, boot.arg = list(s.sizes = NULL, num.iter = 100))
}
\arguments{
  \item{abundances}{Community data as a matrix where columns are individual species and rows are sites. Matrix elements are abundance data (e.g. counts, percent cover estimates).}
  \item{q}{Order of the diversity measure. Defaults to the Shannon case where q = 1.}
  \item{labels}{Logical statement. If labels=TRUE, then site names are given as the first column of the abundance matrix. The default is labels=FALSE where no site names are given in the abundance matrix.}
  \item{half}{Logical statement that changes the display of the resulting matrix. The default is half=TRUE, where the similarities are not repeated and are given as NaN values on one side of the diagonal in the resulting matrix. If half=FALSE, then the displayed similarities are repeated on either side of the diagonal of the resulting matrix.}
  \item{diag}{Logical statement that changes the display of the resulting matrix. The default is diag=TRUE, where the elements in the diagonal of the resulting similarity matrix are all equal to one because a sample should be completely identical to itself. If diag=FALSE, then then the elements in the diagonal of the resulting similarity matrix are given NaN values.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.  If boot=TRUE, only standard errors will be output in table; to get both values and standard error of similarities, must call sim.groups twice, setting boot to both TRUE and FALSE}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}

}
\details{
This function calculates pairwise similarity for two or more samples, so the abundance data must be a matrix with two or more rows (samples). Depending on the specification of the order (q), other different similarity indices may be calculated (e.g. Sorenson index when q=0, Horn index when q=1, Morisita-Horn index when q=2) (Jost 2007).}
\value{A matrix of pairwise similarities showing community overlap calculated using the similarity function. }
\references{Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10): 2427-2439.}
\author{Noah Charney, Sydne Record}
\note{  
}
\seealso{\code{\link{similarity}}, \code{\link{sim.groups}}}



\examples{
data(simesants)
sim.table(simesants[,-1])
sim.table(simesants,labels=TRUE)
sim.table(simesants,labels=TRUE, diag=FALSE)
sim.table(simesants,labels=TRUE, half=FALSE)
sim.table(simesants,labels=TRUE,boot=TRUE)#standard errors only
sim.table(simesants,labels=TRUE,boot=TRUE, boot.arg=list(num.iter=200), q=2)#standard errors only

}
