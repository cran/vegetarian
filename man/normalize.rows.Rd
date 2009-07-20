\name{normalize.rows}
\alias{normalize.rows}
\title{Converts absolute abundances to relative proportions of species using row normalization}
\description{
Generic function that takes a matrix of community data (where species are columns and rows are sites) and converts absolute abundances, in the form of counts or percent cover estimates, to relative proportions of species using row normalization.
}
\usage{
normalize.rows(abundance.matrix)
}
\arguments{
  \item{abundance.matrix}{Community data as a matrix where columns are individual species and rows are sites.  Matrix elements are abundance data (e.g. counts, percent cover estimates).}
}
\details{
All of Jost's calculation for partitioning diversity are based on relative proportions of species in a community dataset (Jost 2006, Jost 2007).  The \code{normalize.rows} function performs this necessary step of converting absolute abundances to relative proportions of species for Jost's subsequent calculations of diversity and similarity indices.  The normalize.rows function is built in to the D function for Jost's calculations, but we provide it here for more general usage.  For example, this function will also be useful when researchers are most interested in relative proportions of species within a community rather than absolute comparisons of species abundances across multiple sites.}
\value{
 A matrix of community data where the elements are relative proportions of species across sites (rows).  
}
\references{
Jost, L. 2006. Entropy and diversity. Oikos 113(2): 363-375.
Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10):  2427-2439.
Hill, M. 1973. Diversity and evenness: A unifying notation and its consequences. Ecology 54: 427-432.
}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{\code{\link{d}}
}
\examples{
data(simesants)
simesants_freq<-normalize.rows(simesants[,-1])
}
