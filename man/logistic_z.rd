\name{logistic_z}
\alias{logistic_z}

\title{Class prediction based on logistic regression using clinical parameters only}
\usage{
logistic_z(Xlearn=NULL,Zlearn,Ylearn,Xtest=NULL,Ztest,...)
}
\arguments{
  \item{Xlearn}{A nlearn x p matrix giving the microarray predictors for the learning data set. This argument is ignored.}
  \item{Zlearn}{A nlearn x q matrix giving the clinical predictors for the learning data set.}
  \item{Ylearn}{A numeric vector of length nlearn giving the class membership of the learning observations, coded
as 0,1. }
  \item{Xtest}{A ntest x p matrix giving the microarray predictors for the test data set. This argument is ignored.}
  \item{Ztest}{A ntest x q matrix giving the clinical predictors for the test data set.}
  \item{...}{Other arguments.}
}
\description{
This function builds a prediction rule based on the learning data (clinical predictors only)
and applies it to the test data. It uses the function \code{glm}. 
 }

\details{
See Boulesteix et al (2008).
}

\value{
A list with the element:
	\item{prediction}{A numeric vector of length \code{nrow(Xtest)} giving the predicted class for
	each observation from the test data set.}
         }

\references{
Boulesteix AL, Porzelius C, Daumer M, 2008.
Microarray-based classification and clinical predictors: On combined classifiers and additional predictive value. Bioinformatics 24:1698-1706.
}

\author{
  Anne-Laure Boulesteix (\url{http://www.ibe.med.uni-muenchen.de/organisation/mitarbeiter/020_professuren/boulesteix/}) 
   
}
\seealso{\code{\link{testclass}}, \code{\link{testclass_simul}}, \code{\link{simulate}}, 
\code{\link{plsrf_x_pv}}, \code{\link{plsrf_xz_pv}}, \code{\link{plsrf_x}}, \code{\link{plsrf_xz}}, 
\code{\link{rf_z}}, \code{\link{svm_x}}.}


\examples{
# load MAclinical library
# library(MAclinical)

# Generating zlearn, ylearn, ztest
zlearn<-matrix(rnorm(120),30,4)
ylearn<-sample(0:1,30,replace=TRUE)
ztest<-matrix(rnorm(80),20,4)

my.prediction<-logistic_z(Zlearn=zlearn,Ylearn=ylearn,Ztest=ztest)
my.prediction
}
\keyword{htest}
