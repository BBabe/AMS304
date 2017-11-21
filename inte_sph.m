%function [angles] = inte_sph(ordre_quad,L_transf)
ordre_quad = 10;
L_transf = 10;
% Arguments
k = 8;
file_name_in='sphere_mesh_0';
fid1=fopen('./status_error.log','w');
[coor,~,~]=read_meshfile(file_name_in,fid1);
indx = 1 ; x1 = coor(indx,1); x2 = coor(indx,2); x3 = coor(indx,3);
indy = 12; y1 = coor(indy,1); y2 = coor(indy,2); y3 = coor(indy,3);

r0  = [x1-y1,x2-y2,x3-y3];
r = [0,0,0];

%% Calcul approché de la fonction de Green
% Quadrature sur phi
nb_phi = 2*ordre_quad + 1;
nb_theta = ordre_quad + 1;
phis  = linspace(0,2*pi,nb_phi);
phis_rep = repmat(phis,[1,nb_theta]);
% Quadrature sur theta
[w_theta,thetas] = gauss_legendre(nb_theta);
thetas = thetas';
thetas_rep = repmat(thetas,[1,nb_phi]);
w_theta_rep = repmat(w_theta,[1,nb_phi]);
w_theta_rep = w_theta_rep';
% Somme
[s(:,1),s(:,2),s(:,3)] = sph2cart(phis_rep, thetas_rep, 1);
[array_transfert,angles] = transfert2(s,r0,r,k,L_transf);
res = 2*pi/nb_phi * dot(w_theta_rep,array_transfert);

%% Comparaison avec la définition de Green

res_th = Gree(k,coor,indx,indy);
%err = abs(res - res_th) / abs(res_th);

%end