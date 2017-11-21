function [weights, points] = gauss_legendre(nbpoints)

T = zeros(nbpoints);
for i = 1 : nbpoints - 1
   [T(i,i+1), T(i+1,i)] = deal(i/(sqrt(4*i^2-1)));
end

[V,D] = eig(T);
weights = 2*V(1,:).^2;
nb_vap = length(D);
points = zeros(nb_vap,1);
for i = 1 : nb_vap
    points(i) = D(i,i);
end

end