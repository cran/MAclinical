\name{svm_x}
\alias{svm_x}

\title{Classification based on support vector machines using microarray data only}
\usage{
svm_x(Xlearn,Zlearn=NULL,Ylearn,Xtest,Ztest=NULL,ordered=NULL,nbgene=NULL,...)
}
\arguments{
  \item{Xlearn}{A nlearn x p matrix giving the microarray predictors for the learning data set.}
  \item{Zlearn}{A nlearn x q matrix giving the clinical predictors for the learning data set. This argument is ignored.}
  \item{Ylearn}{A numeric vector of length nlearn giving the class membership of the learning observations, coded
as 0,1.}
  \item{Xtest}{A ntest x p matrix giving the microarray predictors for the test data set.}
  \item{Ztest}{A ntest x q matrix giving the clinical predictors for the test data set. This argument is ignored.}
  \item{ordered}{A vector of length p giving the order of the microarray predictors in terms of relevance for prediction. For instance, if the three first elements of \code{ordered} are 30,2,2400, it means that the most relevant genes are the genes
 in the 30th, 2nd and 2400th columns of the gene expression data matrix \code{Xlearn}. Note: if \code{ordered=NULL},
 the columns of \code{Xlearn} and \code{Xtest} are assumed to be already ordered.}
  \item{nbgene}{The number of genes to be selected for use in dimension reduction. Default is \code{nbgene=NULL}, in which case all genes	are used.}
 \item{...}{Other arguments to be passed to the function \code{svm} from the \code{e1071} package.}
}
\description{
This function builds a prediction rule based on the learning data (microarray predictors only)
and applies it to the test data. Prediction is performed based on support vector machines. 
The function \code{svm_x} uses the function \code{svm} from the package \code{e1071}.
 }

\details{
This function is included in the package for comparison.
}

\value{
A list with the element
	\item{prediction}{A numeric vector of length \code{nrow(Xtest)} giving the predicted class for
	each observation from the test data set.}


   }

\references{
Boulesteix AL, Porzelius C, Daumer M, 2008.
Microarray-based classification and clinical predictors: On combined classifiers and additional predictive value. Bioinformatics 24:1698-1706.
}

\author{
  Anne-Laure Boulesteix (\url{http://www.ibe.med.uni-muenchen.de/organisation/mitarbeiter/020_professuren/boulesteix/eng.html}) 
   
}
\seealso{\code{\link{testclass}}, \code{\link{testclass_simul}}, \code{\link{simulate}}, 
\code{\link{plsrf_x_pv}}, \code{\link{plsrf_xz}}, \code{\link{plsrf_xz_pv}}, \code{\link{rf_z}},
\code{\link{logistic_z}}.}


\examples{
# load MAclinical library
# library(MAclinical)

# Generating xlearn, zlearn, ylearn, xtest, ztest
xlearn<-matrix(rnorm(3000),30,100)
ylearn<-sample(0:1,30,replace=TRUE)
xtest<-matrix(rnorm(2000),20,100)

my.prediction1<-svm_x(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest)

ordered<-sample(100)
my.prediction2<-svm_x(Xlearn=xlearn,Ylearn=ylearn,Xtest=xtest,ordered=ordered,nbgene=20)


}
\keyword{htest}
