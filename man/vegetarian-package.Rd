\name{vegetarian-package}
\alias{vegetarian-package}
\alias{vegetarian}
\docType{package}
\title{Jost Diversity Measures for Community Data
}
\description{
This package computes diversity with uncertainty estimates for community data sets using the methods outlined by Jost (2006, 2007). While there are differing opinions on the ideal way to calculate diversity (e.g. Magurran 2004), this method offers the advantage of providing diversity 'numbers equivalents,' independent alpha and beta diversities, and the ability to incorporate 'order' (q) as a continuous measure of the importance of rare species in the metrics. The functions provided in this package largely correspond with the equations offered by Jost in the cited papers. The package computes alpha diversities, beta diversities, gamma diversities, and similarity indices. Uncertainty estimates for diversity measures are calculated using a bootstrap method described by Chao et al. (2008).  Traditional diversity measures can also be output.  For datasets with many samples (sites, plots), \code{sim.table} creates tables of all pairwise comparisons possible, and for grouped samples \code{sim.groups} calculates pairwise combinations of within- and between-group comparisons. }
\details{
\tabular{ll}{
Package: \tab vegetarian\cr
Type: \tab Package\cr
Version: \tab 1.2\cr
Date: \tab 2009-08-23\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}

The core of the vegetarian library is the \code{d} function, which calculates the basic alpha, beta, and gamma diversity 'numbers equivalents' from community data.  \code{H} uses \code{d} to calculate the standard diversity indices.  The functions \code{similarity}, \code{M.homog}, \code{Rel.homog}, and \code{turnover} call \code{d} to compare diversity across communities.  use \code{sim.table} and/or \code{sim.groups} to produce multiple pairwise similarity comparisons among many sample sites.  All functions can output standard errors by calling \code{bootstrap} internally.  For more detailed bootstrapping outputs, the user can call \code{bootstrap} seperately.  The function \code{normalize.rows} is called by \code{d} to convert count data into frequencies.  The simple function, \code{p.q.sum} is called internally as core part of the diversity calculations, and is probably of little use to the average user, though it may be used to create more complex diversity measures.
This update corrects an error in the \code{similarity} function and boostrap standard error estimates from earlier versions.

}
\author{
Noah Charney, Sydne Record

}
\references{
Chao, A, L. Jost, S. C. Chiang, Y.-H Jiang, R. L. Chazdon.  2008.  A two-stage probabilistic approach to multiple-community similarity indices.  Biometrics 64: 1178-1186.

Jost, L. 2006. Entropy and diversity. Oikos 113(2): 363-375.

Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10):  2427-2439.

Hill, M. 1973. Diversity and evenness: A unifying notation and its consequences. Ecology 54: 427-432.

}

\keyword{ package }

\examples{
data(simesants)
d(simesants[,-1], boot=TRUE) 
#remove column with site names 
#calculates alpha diversity of entire data-set with standard error

}
