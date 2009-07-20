\name{M.homog}
\alias{M.homog}
\title{MacArthur's Homogeneity Measure}
\description{
Macarthur's homogeneity measure provides a gauge of the amount of total diversity contained in an average community or sample (MacArthur 1965).  It can be derived from a transformation of the true beta diversity of order 1, the numbers equivalent of the beta Shannon entropy (Jost 2007 Equation 18).  If the N communities being compared are equally weighted, then other values of q can be specified to calculate other familiar similarity indices (e.g. Jaccard index when q=0, Morisita-Horn index when q=2) (Jost 2006).
}
\usage{
M.homog(abundances, abundances2 = NULL, q = 1, std = FALSE, boot = FALSE, boot.arg = list(s.sizes = NULL, num.iter = 100))
}

\arguments{
  \item{abundances}{Community data as a matrix where columns are individual species and rows are sites or a vector of different species within a site.  Matrix and vector elements are abundance data (e.g. counts, percent cover estimates).}
  \item{abundances2}{ Community data, a vector of different species within a site.  Vector elements are abundance data (e.g. counts, percent cover estimates).  If abundances is given a matrix, then abundances2 defaults to NULL.}
  \item{q}{Order of the diversity measure.  Defaults to the Shannon case where q = 1.}
  \item{std}{Logical statement.  If std = TRUE, then the data is standardized, so that the value returned is bounded between zero and one.  The default is std = FALSE where there is    no standardization of the data, and lower and upper limits of the value returned are 1/N and one, respectively.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}
}
\details{

}
\value{
  \item{M}{A scalar, MacArthur's homogeneity measure, where the lower limit (either 1/N or zero depending on the specification of the argument std) is the case when all communities are distinct and the upper limit (unity) occurs when all communities are exactly identical.}
  \item{StdErr}{(optional) Standard error of value estimated through bootstrapping.}

}
\references{
Jost, L. 2006. Entropy and diversity. Oikos 113(2): 363-375.

Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10):  2427-2439.

Hill, M. 1973. Diversity and evenness: A unifying notation and its consequences. Ecology 54: 427-432.
}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{
\code{\link{Rel.homog}}
\code{\link{bootstrap}}

}

\examples{
data(simesants)
M.homog(simesants[1:2,-1])
hemlock<-subset(simesants,Habitat=="Hemlock")[,-1]
hardwood<-subset(simesants,Habitat=="Hardwood")[,-1]
M.homog(abundances=hemlock,abundances2=hardwood)
M.homog(simesants[1:2,-1], q=2,std=TRUE,boot=TRUE)

}
