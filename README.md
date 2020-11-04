# MRCIP:A robust Mendelian randomization method accounting for correlated and idiosyncratic pleiotropy
MRCIP is a Mendelian randomization approach for the inference of causal relationship between traits based on summary-level GWAS data, which accounts for the correlated pleiotropy and idiosyncratic pleiotropy.
## Setup
Use the following command in R to install the package:
```
library(devtools)
install_github("siqixu/MRCIP")
```
## Usage
The MAPCO tackles the idiosyncratic pleiotropy by using a weighting scheme. Generally, large bandwidth h in the kernel function leads to the weights closer to one and thus higher efficiency, while small h is more sensitive to outliers and leads to the weights closer to zero. Here, we select h over a grid of values by monitoring the empirical mean downweighting level. 

The plot_h function provides a scatter plot of the mean downweighting levels against a grid of bandwidth h.
```
plot_h(data,beta,mu_gamma,s_gamma,s_alpha,rho,h_start=0.01,h_step=0.01,tol_dw=1e-4,tol=1e-8,n_iter=1000,plot_h="TRUE")
```
Given h, the MRCIP function provides: 1) the estiamted causal effect of the exposure on the outcome, the corresponding p value and the 95% confidence interval; 2) the estiamted correlation coefficient of the genetic effect between the exposure and the outcome and the corresponding p value; and 3) the indices and the weights of the outliers that have the weights less than 0.5.
```
MRCIP(data,beta,mu_gamma,s_gamma,s_alpha,rho,h,tol=1e-8,n_iter=1000)
```
## Arguments 
data:	
A matrix or dataframe cosists of four columns: the 1st(2nd) column contains the estiamted genetic effects on the outcome (exposure); the 3rd (4th) column contains the estiamted standard errors of the estimated genentic effects on the outcome (exposure).

beta:	
The initial value of the causal effect in the (modified) EM algorithm. The default value is zero

mu_gamma:	
The initial value for the mean of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, the sample mean of the estimated genentic effects on the exposure will be used.

s_gamma:	
The initial value for the standard deviation of the genetic effects on the exposure in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the estiamted genetic effects on the exposure.

s_alpha:	
The initial value for the standard deviation of the pleiotropy effects on the outcome in the (modified) EM algorithm. If it is missing, it will be calculated based on the sample variance of the estiamted genetic effects on the outcome.

rho:	
The initial value of correlation coefficient of the genetic effects between traits in the (modified) EM algorithm. The default value is zero.

h:	
The bandwidth used for the kernel estimation in the Pearson residuals.

h_start:	
The start value in the grid search for the bandwidth used in the kernel estimation. The default value is 0.01.

h_step:	
The step size in the grid search for the bandwidth used in the kernel estimation. The default value is 0.01.

tol_dw:	
The grid search for the bandwidth stops when the diffence in the mean downweighting between two steps is less than the value given in tol_dw.

tol:	
The tolenrence used in the modified EM algorithm. The default value is 1e-8.

n_iter:	
The maximum number of iterations in the modified EM algorithm. The default value is 1000.

## Example 
```
library(MAPCO)
plot_h(data=example)
MRCIP(data=example, h=0.31)
```
