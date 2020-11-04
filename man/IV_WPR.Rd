\name{IV_WPR}
\alias{IV_WPR}
\title{IV_WPR: A weighting scheme to handle the presence of idiosyncratic pleiotropy}
\usage{
IV_WPR(data,beta=0,mu_gamma,s_gamma,s_alpha,rho=0,modified.EM ="TRUE", h, w=NA, rho_null="FALSE", tol=1e-8, n_iter=1000)
}
\description{
IV_WPR is a weighting scheme to handle the presence of idiosyncratic pleiotropy, where thes model parameters are estimated by maximizing a weighted likelihood function with a modified EM algorithm
}
\arguments{
  \item{data}{A matrix or dataframe cosists of four columns: The 1st(2nd) column contains the estiamted genetic effects on the outcome (exposure); the 3rd (4th) column contains the estiamted standard errors of the estimated genentic effects on the outcome (exposure).}
  \item{beta}{The initial value of the causal effect in the (modified) EM algorithm. The default value is zero}
  \item{mu_gamma}{The initial value for the mean of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, the sample mean of the estimated genentic effects on the exposure will be used.}
  \item{s_gamma}{The initial value for the standard deviation of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the estiamted genetic effects on the exposure.}
  \item{s_alpha}{The initial value for the standard deviation of the pleiotropy effects on the outcome in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the  estiamted genetic effects on the outcome.}
  \item{rho}{The initial value of correlation coefficient of the genetic effects between traits in the EM algorithm. The default value is zero.}
  \item{modified.EM}{If it is "TRUE", then a modified EM algorithm will be used which contains the updating steps for the weights. Otherwise, the weights should be provided in the argument w.}
  \item{h}{The bandwidth used for the kernel estimation in the Pearson residuals. The value of h should be provided when the modified.EM is set to be "TRUE".}
  \item{w}{The weights for the genetic variants. This argument will be ignored when modified.EM=="TRUE".}
  \item{rho_null}{If it is "TRUE", then the parameters in MRCIP will be estiamted when rho is fixed at zero.}
  \item{tol}{The tolenrence used in the modified EM algorithm. The default value is 1e-8.}
  \item{n_iter}{The maximum number of iterations in the modified EM algorithm. The default value is 1000.}
}


