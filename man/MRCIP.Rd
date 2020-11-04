\name{MRCIP}
\alias{MRCIP}
\title{MRCIP: A robust Mendelian randomization method accounting for correlated and idiosyncratic pleiotropy}
\usage{
MRCIP(data,beta=0,mu_gamma=NA,s_gamma=NA,s_alpha=NA,rho=0,h,tol=1e-8,n_iter=1000)
}
\description{
MRCIP is a Mendelian randomization approach for the inference of causal relationship
between traits based on summary-level GWAS data, which accounting for the correlated pleiotropy and idiosyncratic pleiotropy.
}
\arguments{
  \item{data}{A matrix or dataframe cosists of four columns: the 1st(2nd) column contains the estiamted genetic effects on the outcome (exposure); the 3rd (4th) column contains the estiamted standard errors of the estimated genentic effects on the outcome (exposure).}
  \item{beta}{The initial value of the causal effect in the (modified) EM algorithm. The default value is zero}
  \item{mu_gamma}{The initial value for the mean of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, the sample mean of the estimated genentic effects on the exposure will be used.}
  \item{s_gamma}{The initial value for the standard deviation of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the estiamted genetic effects on the exposure.}
  \item{s_alpha}{The initial value for the standard deviation of the pleiotropy effects on the outcome in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the  estiamted genetic effects on the outcome.}
  \item{rho}{The initial value of correlation coefficient of the genetic effects between traits in the (modified) EM algorithm. The default value is zero.}
  \item{h}{The bandwidth used for the kernel estimation in the Pearson residuals.}
  \item{tol}{The tolenrence used in the modified EM algorithm. The default value is 1e-8.}
  \item{n_iter}{The maximum number of iterations in the modified EM algorithm. The default value is 1000.}
}

\value{
\item{beta}{The estiamted causal effect of the exposure on the outcome, the corresponding p value, the lower limit and upper limit of the 95 percent confidence interval.}
\item{rho}{The estiamted correlation coefficient of the genetic effect between the exposure and the outcome as well as the corresponding p value.}
\item{outlier}{The indices and and the weights of the genetic variants that have the weights less than 0.5.}
}

\examples{
  MRCIP(data=example, h=0.31)
}
