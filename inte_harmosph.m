function I_lm = inte_harmosph(l,m,ordre_quad)

coeff = sqrt((2*l+1)/(4*pi)*factorial(l-m)/factorial(l+m));

nb_phi = 2*ordre_quad + 1;
phis  = linspace(0,2*pi,nb_phi);
quad_phi = 2*pi/nb_phi * sum(exp(1i*m*phis));

nb_theta = ordre_quad + 1;
[w_theta,thetas] = gauss_legendre(nb_theta);
legendre_m = legendre(l,thetas);
quad_theta = sum(w_theta.*legendre_m(m+1,:));

I_lm = coeff * quad_phi * quad_theta;

end