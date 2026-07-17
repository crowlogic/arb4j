#!/usr/bin/env Rscript
source("roughHestonAdamsLambda.R")
params <- list(al=0.62, lam=0.1, nu=0.331, rho=-0.681)
xiCurve <- function(t){ 0.3156 }
n <- 252
t <- 0.003968253968253968
u <- 3 - 0.5i
dah <- dhA(params)(n=n, a=u, bigT=t)
h <- hA(params)(n=n, a=u, bigT=t)
cat("len dah:", length(dah), " len h:", length(h), "\n")
cat("dah dim:", dim(dah), " h dim:", dim(h), "\n")
ti <- (0:n)/n * t
xi <- xiCurve(ti)
cat("len xi:", length(xi), "\n")
cat("class dah:", class(dah), "\n")
