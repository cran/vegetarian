\name{sim.groups}
\alias{sim.groups}
\title{Within- and Between-Group Similarities}
\description{Given two groups with multiple samples (e.g. sites, plots) the sim.groups function calculates all possible pairwise combinations of within- and between-group comparisons.
}
\usage{
sim.groups(abundances1, abundances2, q = 1, labels = FALSE, boot = FALSE, boot.arg = list(s.sizes = NULL, num.iter = 100))
}
\arguments{
  \item{abundances1}{Community data as a matrix where columns are individual species and rows are sites or a vector of different species within a site.  Matrix and vector elements are abundance data (e.g. counts, percent cover estimates).}
  \item{abundances2}{Community data, a vector of different species within a site.  Vector elements are abundance data (e.g. counts, percent cover estimates).  If abundances1 is given a matrix, then abundances2 defaults to a logical FALSE statement.}
  \item{q}{Order of the diversity measure.  Defaults to the Shannon case where q = 1.}
  \item{labels}{Logical statement.  If labels=TRUE, then site names are given as the first column of the abundance matrix.  The default is labels=FALSE where no site names are given in the abundance matrix.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.  If boot=TRUE, only standard errors will be output in table; to get both values and standard error of similarities, must call sim.groups twice, setting boot to both TRUE and FALSE}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}
}
\details{
 Depending on the specification of the order (q), other different similarity indices may be calculated (e.g. Sorenson index when q=0, Horn index when q=1, Morisita-Horn index when q=2) (Jost 2007). 
}
\value{
  \item{within.1}{Within-group similarities (or standard errors) for first group.}
  \item{within.2}{Within-group similarities (or standard errors) for second group.}
  \item{between}{Between group similarities (or standard errors).}
}
\references{Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10):  2427-2439.}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{\code{\link{similarity}}, \code{\link{sim.table}}
}
\examples{
data(simesants)
sim.groups(simesants[1:3,],simesants[4:5,],labels=TRUE,boot=TRUE)
sim.groups(simesants[1:3,-1],simesants[4:5,-1])
sim.groups(simesants[1:3,-1],simesants[4:5,-1],labels=TRUE,boot=TRUE)#gives standard errors only
sim.groups(simesants[1:3,-1],simesants[4:5,-1],labels=TRUE,boot=TRUE,boot.arg=list(num.iter=200))#gives standard errors only
}
