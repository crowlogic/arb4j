addpath(genpath(pwd));
pkg load optim;
v_0=0.15^2; v_bar=0.15^2; alpha=0.6; lambda=2; xi=0.4; rho=-0.6; T=1; N=252; u=0;
phi = MomentGeneratingFunctionRoughHeston(v_0,alpha,lambda,v_bar,xi,rho,T,u,N);
disp(["phi(0)=",num2str(phi)]);
disp(["abs(phi(0)-1)=",num2str(abs(phi-1))]);
u2=-1i;
phi2 = MomentGeneratingFunctionRoughHeston(v_0,alpha,lambda,v_bar,xi,rho,T,u2,N);
disp(["phi(-i)=",num2str(phi2)]);
