function [Gvec,angles] = transfert2(s,r0,r,k,L_transf)
%%
% s et transfert_fun contiennent plusieurs valeurs (celles de la quadrature)
% ATTENTION !! Mettre les coordonnées sphériques de s et r0 en LIGNE !
%
%%
%
Nquad = size(s,1); % Plus grosse dimension
kr0 = k*norm(r0);

r0_mat = repmat(r0,[Nquad,1]); % pour utiliser dot en simultané
angles = dot(s,r0_mat,2)/norm(r0);

Gvec = zeros(Nquad,1);
for p = 0 : L_transf
    tmp = legendre(p,angles);
    Pp = tmp(1,:);
    Pp = Pp';
    Hankel = sqrt(pi/(2*kr0)) * besselh(p+1/2,kr0);
    Gvec = Gvec + (2*p+1) * (1i)^p * Hankel * Pp;
end
r_mat = repmat(r,[Nquad,1]);
Gvec = exp(1i*k*dot(s,r_mat,2)) * 1i*k/(4*pi) .* Gvec;

end