\name{bootstrap}
\alias{bootstrap}
\title{Estimates Uncertainties with Bootstrapping}
\description{
Diversity measure provided in the vegetarian library call bootstrap to estimate standard error for the parameter outputs.  Bootstrap generates simulated populations from a multinormal distribution centered around the community matrix provided and applies the function of interest to the simulated data.  Requires stats package.}
\usage{
bootstrap(abundances, s.sizes = "default", num.iter = 100, func, func.arg = "blank", sim.pop = FALSE, sim.par = FALSE)
}
\arguments{
  \item{abundances}{	Community data as a matrix where columns are individual species and rows are sites.  Matrix elements are abundance data (e.g. counts, percent cover estimates).  }
  \item{s.sizes}{ A vector of the total abundances at each site.  If no vector is provided, then the scores in the abundance matrix will be treated as counts, and sample size of each site will be computed as the row sum. }
  \item{num.iter}{An integer giving the number of bootstrapping iterations.}
  \item{func}{ The function on which bootstrapping will be performed.  The function output must be a scalar.}
  \item{func.arg}{A list containing any additional arguments that must be fed to the function specified by func.}
  \item{sim.pop}{ A logical specifying whether or not to output the simulated populations for each iteration.}
  \item{sim.par}{A logical specifying whether or not to output the individual parameters calculated on each simulated population.}
}
\details{
The procedure is outlined in Chao et al. (2008).  For each site (row) of the original data set, the total sample size and the relative proportions of each species are used to construct a multinomial distribution.  Scores are drawn from this multinomial distribution to generate a simulated population at that site.  This is done for each row until an entire simulated community matrix is generated.  The supplied function (func) is then applied to this simulated matrix to calculate the focal parameter for that iteration.  This process of sampling from the multinormal distributions and applying the function is repeated for as many times as is specified by num.iter.  The standard deviation of the bootstrap parameter values serves as the standard error for the parameter estimate based on the real data.

While this function is called internally by other functions in the vegetarian library, only the standard error is reported by those functions.  The user may wish to call bootstrap directly to access the simulated populations and measure uncertainty in other ways.
}

\value{
  \item{StdErr}{Bootstrap Standard Error for parameter estimate}
  \item{Simulated.Populations}{(optional) Array containing simulated populations}
  \item{Simulated.Parameters}{(optional) Vector containing parameter for each simulated population}

}
\references{
Chao, A, L. Jost, S. C. Chiang, Y.-H Jiang, R. L. Chazdon.  2008.  A two-stage probabilistic approach to multiple-community similarity indices.  Biometrics 64: 1178-1186.
}
\author{Noah Charney, Sydne Record}
\note{}
\seealso{\code{\link{d}}}
\examples{
data(simesants)
bootstrap(simesants[,-1], func=d)
boot_output<-bootstrap(simesants[,-1], func=d, num.iter=10, sim.pop=TRUE, sim.par=TRUE)
boot_output$Simulated.Parameters
boot_output$Simulated.Populations
simesants_freq<-normalize.rows(simesants[,-1])#not a necessary step, but just to show what you would do if your data were in the form of frequencies, not counts
bootstrap(simesants_freq, func=d, num.iter=1000, s.sizes=c(198,186,102,108,187))
}
\keyword{ robust }
\keyword{ nonparametric }
