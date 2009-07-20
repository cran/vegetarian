\name{similarity}
\alias{similarity}
\title{Similarity Summary Table}
\description{Creates a summary table of community overlap for all possible pairwise combinations of samples (e.g. sites, plots) using the \code{similarity} function.}
\usage{
similarity(abundances, abundances2 = FALSE, q = 1, boot = FALSE, boot.arg = list(s.sizes = 'default', num.iter = 100))
}
\arguments{
  \item{abundances}{Community data as a matrix where columns are individual species and rows are sites. Matrix elements are abundance data (e.g. counts, percent cover estimates).  May be given as a vector with abundances2 as a vector for a second community.}
  \item{abundances2}{Community data, a vector of different species within a site. Vector elements are abundance data (e.g. counts, percent cover estimates). If abundances is given a matrix, then abundances2 defaults to a logical FALSE statement.}
  \item{q}{Order of the diversity measure. Defaults to the Shannon case where q = 1.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}
}
\details{
 This function calculates pairwise similarity for two or more samples, so the abundance data must be a matrix with two or more rows (samples). Depending on the specification of the order (q), other different similarity indices may be calculated (e.g. Sorenson index when q=0, Horn index when q=1, Morisita-Horn index when q=2) (Jost 2007).
}
\value{

  \item{Similarity}{A matrix of pairwise similarities showing community overlap calculated using the similarity function.}
  \item{StdErr}{(optional) Standard error of value estimated through bootstrapping.}
}
\references{Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10): 2427-2439.}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{\code{\link{sim.table}}, \code{\link{sim.groups}}, \code{\link{bootstrap}}}
\examples{
data(simesants)
hemlock<-subset(simesants,Habitat=="Hemlock")[,-1]
hardwood<-subset(simesants,Habitat=="Hardwood")[,-1]
similarity(rbind(hemlock,hardwood))
similarity(hemlock,abundances2=hardwood)
similarity(hemlock,abundances2=hardwood,boot=TRUE)
similarity(hemlock,abundances2=hardwood,q=2,boot=TRUE,boot.arg=list(num.iter=200))
}
