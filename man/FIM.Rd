\name{FIM}
\alias{FIM}
\title{The estiamted Fisher infomation matrix for the paramters in MRCIP}
\usage{
FIM(sj_Gamma, sj_gamma, theta, w=NA)
}
\description{
This function provides an estiamted Fisher infomation matrix for the paramters in the MRCIP model.
}
\arguments{
  \item{sj_Gamma}{A vector containing the estiamted standard errors of the estimated genentic effects on the outcome.}
  \item{sj_gamma}{A vector containing the estiamted standard errors of the estimated genentic effects on the exposure.}
  \item{theta}{The estimates of the unknown parameters in MRCIP.}
  \item{w}{The weights for the genetic variants.}
}
