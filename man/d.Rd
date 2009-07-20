\name{d}
\alias{d}
\title{'Numbers Equivalents' for Alpha, Beta and Gamma Diversity Indices}
\description{The \code{d} function calculates the numbers equivalent or effective numbers of species for alpha, beta or gamma diversity as described by Jost (2006, 2007).  These are sometimes referred to as 'Hill numbers' (Hill 1973).  Jost's interpretation of these number equivalents are more general than Hill's because as the order (q) changes, the sensitivity of the diversity to rare and common species changes.  According to Jost (2007), for alpha diversity \code{d} calculates Equation 11a for the general case for q and Equation 11b for the Shannon case where q = 1.  See Jost (2006) for more on the history and theory behind diversity indices and numbers equivalents.
}
\usage{
d(abundances, lev = "alpha", wts = FALSE, q = 1, boot = FALSE, boot.arg = list(s.sizes = "default", num.iter = 100))
}
\arguments{
  \item{abundances}{ Community data as a matrix where columns are individual species and rows are sites.  Matrix elements are abundance data (e.g. counts, percent cover estimates).}
  \item{lev}{Level of diversity to be calculated.  Will accept: 'alpha,' 'beta,' or 'gamma.'}
  \item{wts}{ A vector of community weights whose length equals the number of communities being compared.  See details below for examples of when community weights might be treated as equal or unequal. Defaults to wts=FALSE where all communities are equally weighted.}
  \item{q}{Order of the diversity measure.  Defaults to the Shannon case where q = 1.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes=number you specify, num.iter=number you specify)}
}
\details{
Orders higher than one are more sensitive to common species, and orders less than one are more sensitive to rare species.  Species richness are diversity measures of q = 0.  Shannon diversity measures are first order or q =1.  Simpson diversity measures are second order or q = 2.    

Determining how to set community weights depends on the types of comparisons about communities that a researcher wants to make.  For instance, Jost (2007) suggests that if species frequencies, but not the actual sizes of the communities are the topic of interest then communities should all be weighed equally.  In contrast, community weights are usually unequal when the sizes of the communities has a large influence on the comparisons being made.  For instance, when comparing the alpha and beta diversities of a landscape, using unequal community weights makes more sense.  
}
\value{
  \item{D.Value }{A scalar that gives the numbers equivalent of alpha, beta, or gamma diversity for the specified 'order' (q) and community weights.}
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
\code{\link{bootstrap}},\code{\link{H}}
}
\examples{
data(simesants)
d(simesants[,-1]) #remove column with site names; calculates alpha diversity of entire data-set
hemlock<-subset(simesants,Habitat=="Hemlock")
d(hemlock[-1])#alpha diversity of just hemlock site
d(simesants[,-1],lev="gamma", q=0)#species richness for entire data set
d(simesants[,-1],q=2,boot=TRUE)
d(simesants[,-1],q=2,boot=TRUE,boot.arg=list(num.iter=1000))
simesants_freq<-normalize.rows(simesants[,-1])#not a necessary step, but just to show what you would do if your data were in the form of frequencies, not counts
d(simesants_freq,q=2,boot=TRUE,boot.arg=list(s.sizes=c(198,186,102,108,187)))
}
