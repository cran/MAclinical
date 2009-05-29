  \name{testclass}
\alias{testclass}

\title{Evaluating a classification method based on several learning subsets}
\usage{testclass(x=NULL,y,z=NULL,learningsets,classifier,ncomp=0:3,
varsel=NULL,nbgene=NULL,fold=10,...)}

\arguments{
  \item{x}{A n x p matrix giving the gene expression levels of p genes (columns) for n patients (rows).}
  \item{y}{A numeric vector of length n giving the class membership of the n patients, coded as 0,...,K-1 (where
	K is the number of classes).}
  \item{z}{A n x q data frame giving the q clinical predictors for the n patients. Nominal variables should be
		given as factors, variables with an at least ordinal scale should be given as numeric.}
  \item{learningsets}{A matrix with niter rows giving the indices of the
arrays to be included in the learning sets for the niter iterations, as generated by the function \code{\link{generate.learningsets}}. 
The i-th row gives the indices of the arrays included in the learning set for
the i-th iteration. For instance, in LOOCV, the i-th row of the matrix \code{learningsets} 
contains all the integers from 1 to n except i. Note that an observation may be included twice or more in the
same learning set (for instance in bootstrap sampling).}
  \item{classifier}{The function used to construct a classifier. The function must have the same structure as \code{\link{plsrf_xz_pv}}. }
  \item{ncomp}{The candidate numbers of PLS components (if PLS dimension reduction is used).}
  \item{varsel}{A niter x p matrix giving the indices of the genes ordered
by the chosen gene selection criterion. For example, the element in the first
row and the first column is the index of the gene that is ranked best using the first learning set.}
  \item{nbgene}{The number of genes to use for classifier construction. Default is \code{nbgene=NULL}, corresponding
		to all genes.}
  \item{fold}{The number of folds for the pre-validation step. See Boulesteix et al (2008) for more details. Default is \code{fold=10}.}
 \item{...}{Other arguments to be passed to the function \code{cforest_control} from the \code{party} package 
or to the function \code{svm} from the package \code{e1071}, depending on the specified classifier.}
}

\description{
This function evaluates classifiers built using microarray data and/or clinical predictors, based on 
several pairs of learning and test data sets. 
}

\details{
For an overview of different methods used to generate the learning sets defined by \code{\link{generate.learningsets}},
see Boulesteix et al (2007). These methods include (repeated) cross-validation, subsampling, bootstrap sampling.
}

\value{
	\item{error}{A numeric vector of length \code{niter} giving the misclassification rate for each iteration.}
	\item{bestncomp}{A numeric vector of length \code{niter} giving the best number of (pre-validated) PLS components, as obtained using the model selection method based on the out-of-bag error by Boulesteix et al (returned only for the classifiers \code{\link{plsrf_xz_pv}}, \code{\link{plsrf_xz}}, \code{\link{plsrf_x_pv}}, \code{\link{plsrf_x}}).}
	\item{OOB}{A list of length \code{niter}, whose elements are numeric vectors of the same length as \code{ncomp} giving the
out-of-bag error of the forest constructed with the corresponding number of (pre-validated) PLS components
(returned only for the classifiers \code{\link{plsrf_xz_pv}}, \code{\link{plsrf_xz}}, \code{\link{plsrf_x_pv}}, \code{\link{plsrf_x}}, \code{\link{rf_z}}. For \code{\link{rf_z}}, no model selection is performed: \code{OOB} is just the out-of-bag error of the 
constructed forest.) }


    }

\references{
Boulesteix AL, Porzelius C, Daumer M, 2008.
Microarray-based classification and clinical predictors: On combined classifiers and additional predictive value. Bioinformatics 24:1698-1706.

Boulesteix AL, Strobl C, Augustin T, Daumer D, 2008.
Evaluating microarray-based classifiers: an overview. Cancer Informatics 6:77-97.
}

\author{
  Anne-Laure Boulesteix (\url{http://www.ibe.med.uni-muenchen.de/organisation/mitarbeiter/020_professuren/boulesteix/})

}
\seealso{\code{\link{testclass_simul}}, \code{\link{simulate}}, \code{\link{generate.learningsets}}, \code{\link{plsrf_xz_pv}}, \code{\link{plsrf_x_pv}}, \code{\link{plsrf_xz}}, \code{\link{plsrf_x}}, 
\code{\link{rf_z}}, \code{\link{svm_x}}, \code{\link{logistic_z}}.}



\examples{
# load MAclinical library
# library(MAclinical)

# Generate data
x<-matrix(rnorm(20000),100,200)
z<-matrix(rnorm(500),100,5)
y<-sample(0:1,100,replace=TRUE)

# Generate learningsets (5-fold CV)
my.learningsets<-generate.learningsets(n=100,method="CV",fold=5)

# Evaluate accuracy of the PLS-PV-RF method
my.eval<-testclass(x=x,y=y,z=z,learningsets=my.learningsets,classifier=plsrf_xz_pv,ncomp=5,
varsel=NULL,nbgene=NULL,fold=10)

# With variable selection
my.varsel<-matrix(0,5,200)
for (i in 1:5)
 {
 my.varsel[i,]<-order(abs(studentt.stat(X=x[my.learningsets[i,],],
 L=y[my.learningsets[i,]]+1)),decreasing=TRUE)
 }

my.eval<-testclass(x=x,y=y,z=z,learningsets=my.learningsets,classifier=plsrf_xz_pv,ncomp=5,
varsel=my.varsel,nbgene=15,fold=10)

}

\keyword{multivariate}
