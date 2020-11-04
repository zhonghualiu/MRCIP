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
## Example 
```
library(MAPCO)
plot_h(data=example)
MRCIP(data=example, h=0.31)
```
