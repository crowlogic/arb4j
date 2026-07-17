function [price, integrand] = NumericalIntegrationCall(K,phi,beta,midpoint,ubound,dA,eps)
    s0 = 1;
    k = log(K);
    alpha = beta - 1;
    
    psi = @(v) (  phi( v(:) - (alpha + 1)*1i  ) ./ ...
        ( alpha^2 + alpha - v(:).^2 + 1i*(2*alpha + 1).*v(:)  ) );
    integrand_col = @(vcol)(real(psi(vcol).*exp(-1i*vcol*k)).*(exp(-alpha*k)./pi));
    integrand = @(v)( reshape(integrand_col(v(:)), size(v)) );
    
    N = ceil((ubound - midpoint)/dA);
    price = MultiDomainIntegration(integrand,0,midpoint,ubound,N,eps);
    
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
    price = price + R;
    
end
