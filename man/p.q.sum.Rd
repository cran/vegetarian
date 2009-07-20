\name{p.q.sum}
\alias{p.q.sum}
\title{Sum of proportional abundance of species}
\description{
 Nearly all diversity indices are based on a basic sum of the proportional abundances of species: sum (p_i^q), where p_i is the proportion of species i and q is the 'order' of the diversity measure.  According to Jost (2007), order is a diversity measure's sensitivity to rare or common species.  If referring to Jost 2007, p.q.sum calculates Equation 1.  The p.q.sum function is built in to the D.gamma and D.alpha functions for Jost's calculations, but we provide it here for more general usage.  For example, if a researcher wanted to build their own diversity index then they could use p.q.sum as a  starting point.
}
\usage{
p.q.sum(p, q = 1)
}
\arguments{
  \item{p}{A vector or matrix of relative proportions of species.}
  \item{q}{Order of the diversity measure.  Defaults to the Shannon case where q = 1.}
}
\details{
 Orders higher than one are more sensitive to common species, and orders less than one are more sensitive to rare species.  Species richness are diversity measures of q = 0.  Shannon diversity measures are first order or q =1.  Simpson diversity measures are second order or q = 2.  
}
\value{
 A scalar that is the sum of proportional abundances of species in the input community data (given as a vector or matrix).

}
\references{Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10):  2427-2439.}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{\code{\link{d}}}
\examples{}
