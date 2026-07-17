function [price, integrand] = NumericalIntegrationCall(K,phi,beta,midpoint,ubound,dA,eps)
disp(["NICALL ENTER: K=",num2str(K)," beta=",num2str(beta)," midpoint=",num2str(midpoint)," ubound=",num2str(ubound)," dA=",num2str(dA)," eps=",num2str(eps)]);

    s0 = 1;
    k = log(K);
    alpha = beta - 1;
    disp(["NICALL alpha=",num2str(alpha)," k=",num2str(k)]);
    
    psi = @(v) (  phi( v(:) - (alpha + 1)*1i  ) ./ ...
        ( alpha^2 + alpha - v(:).^2 + 1i*(2*alpha + 1).*v(:)  ) );
    integrand_col = @(vcol)(real(psi(vcol).*exp(-1i*vcol*k)).*(exp(-alpha*k)./pi));
    integrand = @(v)( reshape(integrand_col(v(:)), size(v)) );
    
    N = ceil((ubound - midpoint)/dA);
    disp(["NICALL going to MultiDomainIntegration with N=",num2str(N)]);
    price = MultiDomainIntegration(integrand,0,midpoint,ubound,N,eps);
    disp(["NICALL MultiDomainIntegration returned price=",num2str(price)]);
    
    R = 0;
    if alpha <= 0
        R = R + s0;
    end
    if alpha <= -1
        R = R - K;
    end
    if alpha==0
        R = R - 0.5*s0;
    end
    if alpha==-1
        R = R + 0.5*K;
    end
    disp(["NICALL residue R=",num2str(R)]);
    price = price + R;
    disp(["NICALL EXIT price=",num2str(price)]);
    
end
