plot_h <- function(data,
                   beta=0, mu_gamma=NA, s_gamma=NA, s_alpha=NA, rho=0,
                   h_start=0.01, h_step=0.01, tol_dw=1e-4, tol=1e-8, n_iter=1000,
                   plot_h = "TRUE"){
  h = h_start
  theta = dw = w = numeric()
  d_dw = 1

  while (d_dw > tol_dw) {
    MRCIP_i = IV_WPR(data,
                     beta, mu_gamma, s_gamma, s_alpha, rho,
                     h=h, tol=tol, n_iter=n_iter)
    theta = rbind(theta,MRCIP_i[[1]])
    dw = rbind(dw,MRCIP_i[[2]])
    if(h!=h_start){
      d_dw = dw[nrow(dw)-1,1] - dw[nrow(dw),1]}
    h = h + h_step
  }
  if(plot_h=="TRUE"){
    # win.graph(width=6.5, height=6.5,pointsize=8)
    plot(dw[,"h"],dw[,"dw"],
         xlab = "h", ylab = "mean downweighting level")
  }
  out = list("dw" = dw)
  return(out)
}


