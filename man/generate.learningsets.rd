  \name{generate.learningsets}
\alias{generate.learningsets}

\title{Generating learning sets}
\usage{
generate.learningsets(n,method,fold=NULL,niter=NULL,nlearn=NULL)
}
\arguments{
  \item{n}{The total number of observations in the available data set.}
  \item{method}{One of "LOOCV" (leave-one-out cross-validation),"CV" (cross-validation),"MCCV"
(Monte-Carlo cross-validation, also called subsampling),"bootstrap" (bootstrap sampling - with replacement).}
  \item{fold}{Gives the number of CV-groups. Used only when \code{method="CV"}.}
  \item{niter}{Number of iterations.}
  \item{nlearn}{Number of observations in the learning sets. Used only for \code{method="MCCV"} and \code{method="bootstrap"}. When \code{method="bootstrap"}, the default is \code{nlearn=n}.}
}
\description{
This function generates a design matrix giving the indices of observations forming the learning
data set for several iterations. 
}

\details{
When \code{method="CV"}, \code{niter} gives the number of times
the whole CV-procedure is repeated. The output matrix has then \code{fold}x\code{niter} rows. When \code{method="MCCV"} or \code{method="bootstrap"}, \code{niter} is simply the number of considered
learning sets.
Note that \code{method="CV",fold=n} is equivalent to \code{method="LOOCV"}.
}

\value{
     A matrix giving the indices (from 1 to n) of the observations included in the learning sets.
Each row corresponds to a learning set. The order of the columns is not important. The number of rows
is equal to \code{n} when \code{method="LOOCV"}, \code{niter} when \code{method="MCCV"} or \code{method="bootstrap"}, \code{fold} when \code{method="CV"} and \code{niter} is null, and \code{fold} x \code{niter} when \code{method="CV"} and \code{niter} is non-null.
    }

\references{
Boulesteix AL, Porzelius C, Daumer M, 2008.
Microarray-based classification and clinical predictors: On combined classifiers and additional predictive value. Bioinformatics 24:1698-1706.
}


\author{
  Anne-Laure Boulesteix (\url{http://www.ibe.med.uni-muenchen.de/organisation/mitarbeiter/020_professuren/boulesteix/})

}
\seealso{\code{testclass}.}


\examples{
# load MAclinical library
# library(MAclinical)

# LOOCV
generate.learningsets(n=40,method="LOOCV")

# CV
generate.learningsets(n=40,method="CV",fold=5)
generate.learningsets(n=40,method="CV",fold=5,niter=3)

# MCCV
generate.learningsets(n=40,method="MCCV",niter=3,nlearn=30)

# bootstrap
generate.learningsets(n=40,method="bootstrap",niter=3)
}
\keyword{multivariate}
