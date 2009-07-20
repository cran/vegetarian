\name{H}
\alias{H}
\title{'Standard Diversity Indices' for Alpha, Beta, and Gamma Diversities}
\description{
 Jost describes the conversion of common indices to 'true' or 'standard' diversities (see Table 1 Jost (2006)).  The H function calculates the alpha, beta, and gamma 'standard diversity indices.'  Specification of different arguments allows for the calculation of species richness, Shannon entropy, Simpson concentration, Gini-Simpson Index, HCDT entropy, and Renyi entropy.
}
\usage{
H(abundances, lev = "alpha", wts = FALSE, q = 1, HCDT = FALSE, gini = FALSE, boot = FALSE, boot.arg = list(s.sizes = NULL, num.iter = 100))
}

\arguments{
  \item{abundances}{ Community data as a matrix where columns are individual species and rows are sites.  Matrix elements are abundance data (e.g. counts, percent cover estimates).}
  \item{lev}{Level of diversity to be calculated.  Will accept: 'alpha,' 'beta,' or 'gamma.'}
  \item{wts}{ A vector of community weights whose length equals the number of communities being    compared.  See details below for examples of when community weights might be treated as equal or unequal. Defaults to wts=FALSE where all communities are equally weighted.}
  \item{q}{Order of the diversity measure.  Defaults to the Shannon case where q = 1.}
  \item{HCDT}{Logical statement.  If HCDT = TRUE, then the HCDT or 'Tsallis' entropy is calculated (Keylock 2005, Czachor and Knaudts 2002).  Defaults to HCDT = FALSE.}
  \item{gini}{Logical statement.  If gini = TRUE and q = 2, then the function calculates the  Gini-   Simpson index.  Defaults to gini = FALSE.}
  \item{boot}{Logical indicating whether to use bootstrapping to estimate uncertainty.}
  \item{boot.arg}{(optional) List of arguments to pass bootstrapping function: list(s.sizes = number you specify, num.iter = number you specify)}
}
\details{
Orders equal to zero, one, or two calculate species richness, Shannon entropy, and Simpson concentration, respectively.  Calculating HCDT entropy requires that q is not equal to zero, one, or two.

Determining how to set community weights depends on the types of comparisons about communities that a researcher wants to make.  For instance, Jost (2007) suggests that if species frequencies, but not the actual sizes of the communities are the topic of interest then communities should all be weighed equally.  In contrast, community weights are usually unequal when the sizes of the communities has a large influence on the comparisons being made.  For instance, when comparing the alpha and beta diversities of a landscape, using unequal community weights makes more sense. 

}
\value{
  \item{H.Value}{A scalar that gives the 'standard diversity index' of alpha, beta, or gamma diversity for the specified combination of 'order' (q), entropy or index, and community weights.}
  \item{StdErr}{(optional) Standard error of value estimated through bootstrapping.}

  ...
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
\code{\link{d}}
\code{\link{bootstrap}}
}
\examples{
data(simesants)
H(simesants[,-1]) #remove column with site names; calculates alpha diversity of entire data-set
hemlock<-subset(simesants,Habitat=="Hemlock")
H(hemlock[-1])#alpha diversity of just hemlock site
H(simesants[,-1],lev="gamma", q=0)#species richness for entire data set
H(simesants[,-1],q=2,boot=TRUE)
H(simesants[,-1],q=2,boot=TRUE,boot.arg=list(num.iter=1000))
simesants_freq<-normalize.rows(simesants[,-1])#not a necessary step, but just to show what you would do if your data were in the form of frequencies, not counts
H(simesants_freq,q=2,boot=TRUE,boot.arg=list(s.sizes=c(198,186,102,108,187)))

}

