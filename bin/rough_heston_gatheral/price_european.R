#!/usr/bin/env Rscript
# Rough Heston pricer wrapper (jgatheral/RationalRoughHeston, Adams scheme)
# Issue #1200 interface:
#   price_european.R S0 K T H lambda theta nu rho r
# Prints a single line:  call_price put_price
# Convention (Gatheral): nu = vol-of-vol, xiCurve = forward variance (= theta),
#   al = H + 1/2, lam = lambda. Prices use S0=1 normalized OTM then scale by S0.
args <- commandArgs(trailingOnly=TRUE)
S0    <- as.numeric(args[1])
K     <- as.numeric(args[2])
T     <- as.numeric(args[3])
H     <- as.numeric(args[4])
lam   <- as.numeric(args[5])
theta <- as.numeric(args[6])   # long-run variance -> xiCurve constant
nu    <- as.numeric(args[7])   # vol-of-vol
rho   <- as.numeric(args[8])
r     <- as.numeric(args[9])

source("roughHestonAdamsLambda.R")
source("BlackFormula.R")

params <- list(al=H+0.5, lam=lam, nu=nu, rho=rho)
xiCurve <- function(t){ rep(theta, length(t)) }

nSteps <- 252
k <- log(K / S0)

otm <- function(kk){ S0 * otmRoughHeston.Adams(params, xiCurve, nSteps)(kk, T) }

# otm(k) returns the out-of-the-money option price at log-moneyness k.
# CALL: if K >= S0 (k >= 0) it is the OTM call; else use put-call parity (r=0): call - put = S0 - K
# PUT:  if K <= S0 (k <= 0) it is the OTM put;  else use parity.
if (k >= 0) {
  call_price <- otm(k)
  put_price  <- call_price - (S0 - K)
} else {
  put_price  <- otm(k)
  call_price <- put_price + (S0 - K)
}

cat(sprintf("%.12f %.12f\n", call_price, put_price))
