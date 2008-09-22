\name{plsrf_xz}
\alias{plsrf_xz}

\title{Classification based on PLS dimension reduction and random forests using
both clinical and microarray predictors}
\usage{
plsrf_xz(Xlearn,Zlearn,Ylearn,Xtest,Ztest,ncomp=0:3,ordered=NULL,nbgene=NULL,...)
}
\arguments{
  \item{Xlearn}{A nlearn x p matrix giving the microarray predictors for the learning data set.}
  \item{Zlearn}{A nlearn x q matrix giving the clinical predictors for the learning data set.}
  \item{Ylearn}{A numeric vector of length nlearn giving the class membership of the learning observations, coded
as 0,...,K-1 (where K is the number of classes).}
  \item{Xtest}{A ntest x p matrix giving the microarray predictors for the test data set.}
  \item{Ztest}{A ntest x q matrix giving the clinical predictors for the test data set.}
  \item{ncomp}{A numeric vector giving the candidate numbers of PLS components. All numbers must be >=0. The number 0 corresponds to prediction based on clinical parameters only.}
  \item{ordered}{A vector of length p giving the order of the microarray predictors in terms of relevance for prediction. For instance, if the three first elements of \code{ordered} are 30,2,2400, it means that the most relevant genes are the genes
 in the 30th, 2nd and 2400th columns of the gene expression data matrix \code{Xlearn}. Note: if \code{ordered=NULL},
 the columns of \code{Xlearn} and \code{Xtest} are assumed to be already ordered.}
  \item{nbgene}{The number of genes to be selected for use in dimension reduction. Default is \code{nbgene=NULL}, in which case all genes are used.} 
\item{...}{Other arguments to be passed to the function \code{cforest_control} from the \code{party} package.}
}
\description{
This function builds a prediction rule based on the learning data (both clinical and microarray predictors)
and applies it to the test data. The classifier consists of two steps: PLS dimension reduction (without
pre-validation step) for summarizing microarray data, and random forests applied to both PLS components 
and clinical predictors. See Boulesteix et al (2008) for more details.

The function \code{plsrf_xz}
 uses the functions \code{cforest} and \code{varimp} from the package \code{party} and the function
\code{pls.regression} from the package \code{plsgenomics}.

 }

\details{
See Boulesteix et al (2008).
}

\value{
A list with the elements:
	\item{prediction}{A numeric vector of length \code{nrow(Xtest)} giving the predicted class for
	each observation from the test data set.}
        \item{importance}{The variable importance information output
	by the function \code{varimp} from the package \code{party} for the corresponding forest.}
	\item{bestncomp}{The best number of PLS components, as obtained using the model selection method based on the out-of-bag error.}
	\item{OOB}{A numeric vector of length \code{ncomp} giving the out-of-bag error of the forest constructed with the corresponding number of PLS components.}
    }

\references{
Boulesteix AL, Porzelius C, Daumer M, 2008.
Microarray-based classification and clinical predictors: On combined classifiers and additional predictive value. Bioinformatics 24:1698-1706.
}


\author{
  Anne-Laure Boulesteix (\url{http://www.slcmsr.net/boulesteix}) 
   
}
\seealso{\code{\link{testclass}}, \code{\link{testclass_simul}}, \code{\link{simulate}}, 
\code{\link{plsrf_x_pv}}, \code{\link{plsrf_xz_pv}}, \code{\link{plsrf_x}}, \code{\link{rf_z}}, 
\code{\link{logistic_z}}, \code{\link{svm_x}}.}


\examples{
# load MAclinical library
# library(MAclinical)

# Generating xlearn, zlearn, ylearn, xtest, ztest
xlearn<-matrix(rnorm(3000),30,100)
zlearn<-matrix(rnorm(120),30,4)
ylearn<-sample(0:1,30,replace=TRUE)
xtest<-matrix(rnorm(2000),20,100)
ztest<-matrix(rnorm(80),20,4)

my.prediction1<-plsrf_xz(Xlearn=xlearn,Zlearn=zlearn,Ylearn=ylearn,Xtest=xtest,Ztest=ztest)

ordered<-sample(100)
my.prediction2<-plsrf_xz(Xlearn=xlearn,Zlearn=zlearn,Ylearn=ylearn,
Xtest=xtest,Ztest=ztest,ordered=ordered,nbgene=20)


}
\keyword{htest}
