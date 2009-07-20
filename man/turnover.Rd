\name{turnover}
\alias{turnover}
\title{Turnover Rate per Sample}
\description{
For numerous communities of equal weights, the numbers equivalent of the Shannon beta diversity and the number of samples (N) can be used to calculate the turnover rate per sample (Equation 25 from Jost 2007, Harrison et al. 1992).
}
\usage{
turnover(abundances, abundances2 = FALSE, q = 1, boot = FALSE, boot.arg = list(s.sizes = "default", num.iter = 100))
}
\arguments{
  \item{abundances}{Community data as a matrix where columns are individual species and rows are sites or a vector of different species within a site. Matrix and vector elements are abundance data (e.g. counts, percent cover estimates). }
  \item{abundances2}{Community data, a vector of different species within a site. Vector elements are abundance data (e.g. counts, percent cover estimates). If abundances1 is given a matrix, then abundances2 defaults to a logical FALSE statement.}
  \item{q}{Order of the diversity measure. Defaults to the Shannon case where q = 1.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}
}
\details{
}
\value{
  \item{Turnover}{A scalar ranging from zero (no turnover between samples) to one (completely different samples).}
  \item{StdErr}{(optional) Standard error of value estimated through bootstrapping.}
}
\references{
Jost, L. 2007. Partitioning diversity into independent alpha and beta components. Ecology 88(10): 2427-2439.
Harrison, S., S. Ross, and J. Lawton. 1992. Beta diversity on geographic gradients in Britain. Journal of Animal Ecology 61: 151-158.
}
\author{Noah Charney, Sydne Record}
\note{
}
\seealso{\code{\link{M.homog}}, \code{\link{Rel.homog}}, \code{\link{similarity}}, \code{\link{bootstrap}}}
\examples{
data(simesants)
turnover(simesants[,-1])
turnover(simesants[,-1],q=2,boot=TRUE)
turnover(simesants[,-1],q=2,boot=TRUE,boot.arg=list(num.iter=500))
}

