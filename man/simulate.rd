\name{simulate}
\alias{simuldata_list}
\alias{simuldatacluster_list}

\title{Simulating data}
\usage{
simuldata_list(niter=50,n=500,p=1000,psig=50,q=5,muX=0,muZ=0)
simuldatacluster_list(niter=50,n=500,p=1000,psig=50,q=5,muX=0,muZ=0)
}
\arguments{
  \item{niter}{The number of data sets to be simulated.}
  \item{n}{The number of observations.}
  \item{p}{The number of microarray variables (genes).}
  \item{psig}{The number of significant microarray variables (must be <\code{p}).}
  \item{q}{The number of clinical variables.}
  \item{muX}{The class mean difference for the \code{psig} relevant genes.}
  \item{muZ}{The class mean difference for the \code{q} clinical variables.}
   }

\description{
This function simulates a list of data sets as described in Boulesteix et al (2008), section 3.1.
}

\details{
With the function \code{simuldata_cluster}, observations with \code{y=1} are assumed to come
from two different subgroups, 1a and 1b, each with probability 0.5. 
Relevant genes are generated such that they separate
 class 1a from the rest, whereas clinical variables separate class 1b from the rest.
}

\value{
A \code{niter}-list of simulated data sets. Each data set is given as a list with three elements:
\item{y}{the \code{n}-vector of class memberships, coded as 0,1.}
\item{x}{the \code{n x p} matrix of gene expressions levels. Each row corresponds to an observation, each column
to a variable (gene).}
\item{z}{the \code{n x q} matrix of clinical variables. Each row corresponds to an observation, each column
to a clinical variable.}
    }

\references{
Boulesteix AL, Porzelius C, Daumer M, 2008.
Microarray-based classification and clinical predictors: On combined classifiers and additional predictive value. Bioinformatics 24:1698-1706.
}

\author{
  Anne-Laure Boulesteix (\url{http://www.ibe.med.uni-muenchen.de/organisation/mitarbeiter/020_professuren/boulesteix/eng.html}) 
   
}
\seealso{\code{\link{testclass}}, \code{\link{testclass_simul}}, 
\code{\link{plsrf_x_pv}}, \code{\link{plsrf_xz_pv}}, \code{\link{plsrf_x}}, \code{\link{plsrf_xz}}, 
\code{\link{logistic_z}}, \code{\link{rf_z}}, \code{\link{svm_x}}.}

\examples{
# load MAclinical library
# library(MAclinical)

# Generating 3 simulated data sets
my.data<-simuldata_list(niter=3,n=100,p=150,psig=10,q=5,muX=2,muZ=1)
length(my.data)
dim(my.data[[1]]$x)
dim(my.data[[1]]$z)
length(my.data[[1]]$y)

}

\keyword{htest}
