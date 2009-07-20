\name{Rel.homog}
\alias{Rel.homog}
\title{Relative Homogeneity}
\description{
Provides a comparison between communities with unequal weights based on the numbers equivalent of the Shannon beta diversity (Jost 2007).  When community weights are not equal, the Shannon measures of diversity where q=1, are still valid and can be used to calculate a relative measure of homogeneity derived from MacArthur's homogeneity measure (Equation 22 from Jost 2007).
}
\usage{
Rel.homog(abundances, abundances2 = "default", wts = FALSE, boot = FALSE, boot.arg = list(s.sizes = "default", num.iter = 100))
}
\arguments{
  \item{abundances}{Community data as a matrix where columns are individual species and rows are sites or a vector of different species within a site.  Matrix and vector elements are abundance data (e.g. counts, percent cover estimates).}
  \item{abundances2}{Community data, a vector of different species within a site.  Vector elements are abundance data (e.g. counts, percent cover estimates).  If abundances is given a matrix, then abundances2 defaults to 'default.'}
  \item{wts}{A vector of community weights whose length equals the number of communities being compared.  See details below for examples of when community weights might be treated as equal or unequal. Defaults to wts=FALSE where all communities are equally weighted.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}
}
\details{This measure assumes the Shannon case where the order q=1.}
\value{
  \item{REL.HOMOG}{A scalar between zero (all communities distinct) and one (all communities identical).}
  \item{StdErr}{(optional) Standard error of value estimated through bootstrapping.}
}
\references{Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10):  2427-2439.}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{
\code{\link{M.homog}}, \code{\link{similarity}}, \code{\link{turnover}}.
}
\examples{
data(simesants)
Rel.homog(simesants[1:2,-1])
hemlock<-subset(simesants,Habitat=="Hemlock")[,-1]
hardwood<-subset(simesants,Habitat=="Hardwood")[,-1]
Rel.homog(abundances=hemlock,abundances2=hardwood)
Rel.homog(simesants[1:2,-1], boot=TRUE)
}
