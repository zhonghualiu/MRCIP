MRCIP <- function(data,
                  beta=0, mu_gamma=NA, s_gamma=NA, s_alpha=NA, rho=0,
                  h, tol=1e-8, n_iter=1000){

  MRCIP_par = IV_WPR(data,
                     beta, mu_gamma, s_gamma, s_alpha, rho,
                     h=h, tol=tol,n_iter=n_iter)
  theta = MRCIP_par[[1]]
  w = MRCIP_par[[3]]
  outlier_id = MRCIP_par[[4]]

  beta_hat = theta[1,"beta"]
  s_beta = sqrt(solve(FIM(data[,2], data[,3], theta, w))[1,1])
  beta_pval = 2* pnorm(abs(beta_hat),0,s_beta,lower.tail = FALSE)
  beta_ul = beta_hat + qnorm(0.05/2,0,1,lower.tail = F) *s_beta
  beta_ll = beta_hat - qnorm(0.05/2,0,1,lower.tail = F) *s_beta

  rho_hat = theta[1,"rho"]
  rho_null  = IV_WPR(data,
                     beta, mu_gamma, s_gamma, s_alpha, rho,
                     modified.EM ="FALSE", w=w, rho_null="TRUE",tol=tol, n_iter=n_iter)
  lr = 2*(MRCIP_par[[1]][1,"maxlnL"] - rho_null[[1]][1,"maxlnL"])
  rho_pval = pchisq(lr,1,lower.tail = F)

  beta_est = cbind(beta_hat,beta_pval,beta_ll,beta_ul)
  rho_est = cbind(rho_hat,rho_pval)
  beta_est = round(beta_est,5)
  rho_est = round(rho_est,5)
  rownames(beta_est) = rownames(rho_est) = NULL
  colnames(beta_est) = c("beta_hat","pval","95%CI (ll)","95%CI (ul)")
  colnames(rho_est) = c("rho_hat","pval")

  out = list(beta=beta_est, rho=rho_est, outlier=outlier_id)
  return(out)
}






