\name{plot_h}
\alias{plot_h}
\title{A plot of the mean downweighting level against the bandwidth in the kernel estimation}
\usage{
plot_h(data,beta=0,mu_gamma,s_gamma,s_alpha,rho=0,h_start=0.01,h_step=0.01,tol_dw=1e-4,tol=1e-8,n_iter=1000,plot_h="TRUE")
}
\description{
This function provides a plot of the mean downweighting level against the bandwidth in the kernel estimation}
\arguments{
  \item{data}{A matrix or dataframe cosists of four columns: the 1st (2nd) column contains the estiamted genetic effects on the outcome (exposure); the 3rd (4th) column contains the estiamted standard errors of the estimated genentic effects on the outcome (exposure).}
  \item{beta}{The initial value of the causal effect in the (modified) EM algorithm. The default value is zero}
  \item{mu_gamma}{The initial value for the mean of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, the sample mean of the estimated genentic effects on the exposure will be used.}
  \item{s_gamma}{The initial value for the standard deviation of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the estiamted genetic effects on the exposure.}
  \item{s_alpha}{The initial value for the standard deviation of the pleiotropy effects on the outcome in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the  estiamted genetic effects on the outcome.}
  \item{rho}{The initial value of correlation coefficient of the genetic effects between traits in the EM algorithm. The default value is zero.}
  \item{h_start}{The start value in the grid search for the bandwidth used in the kernel estimation. The default value is 0.01.}
\item{h_step}{The step size in the grid search for the bandwidth used in the kernel estimation. The default value is 0.01.}
\item{tol_dw}{The grid search for the bandwidth stops when the diffence in the mean downweighting between two steps is less than the value given in tol_dw.}
  \item{tol}{The tolenrence used in the modified EM algorithm. The default value is 1e-8.}
  \item{n_iter}{The maximum number of iterations in the modified EM algorithm. The default value is 1000.}
  \item{plot_h}{If it is "TRUE", then a plot of the mean downweighting level against the bandwidth will be produced.}
}

\value{
This function returns a matrix containing two colunms. The 1st column is the bandwidth used in the kernel estimation. The 2nd column is the corresponding mean downweighting level when the bandwidth is given.
}

\examples{
  plot_h(data=example)
}
