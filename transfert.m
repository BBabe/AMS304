function Gvec = transfert(s,r0,k,L_transf)
% s et transfert_fun contiennent plusieurs valeurs (celles de la quadrature)
% ATTENTION !! Mettre les coordonnées sphériques de s et r0 en LIGNE !
Nquad = length(s); % Plus grosse dimension
kr0 = k*norm(r0);

r0_mat = repmat(r0,[s,1]); % pour utiliser dot en simultané
angles = dot(s,r0_mat,2)/norm(r0);

Gvec = zeros(Nquad,1);
Pp = zeros(Nquad,2); % il suffit de garder 2 éléments

% Premier élément
Pp(:,1) = 1;
Hankel = sqrt(pi/(2*kr0)) * (sin(kr0) - 1i*cos(kr0)) / kr0;
Gvec = Gvec + Hankel*Pp(:,1);
% Deuxième élément
Pp(:,2) = angles;
Hankel = sqrt(pi/(2*kr0))...
    * ( ( sin(kr0)/kr0 - cos(kr0) ) - 1i * ( cos(kr0) + sin(kr0) ) ) / kr0;
Gvec = Gvec + 3 * 1i * Hankel * Pp(:,2);

% Autres éléments
for p = 2 : L_transf
    Pp_tmp = ( (2*p -1)*angles.*Pp(:,2) + (p-1)*Pp(:,1) ) / p;
    Hankel = sqrt(pi/(2*kr0)) * besselh
    Pp(:,1) = Pp(:,2);
    PP(:,2) = Pp_tmp;
end

Gvec = i*k/(4*pi) * Gvec;

end