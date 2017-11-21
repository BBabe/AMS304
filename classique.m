%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
meshh = [0, 1, 2, 3];
kk    = [4, 8,16,40];
exper = 1;

file_name_in=['sphere_mesh_' int2str(meshh(exper))];
fid1=fopen('./status_error.log','w');
fid2=fopen('./sphere_mesh_0b.mesh','w'); 

%Read mesh
[coor,tri,ref_tri]=read_meshfile(file_name_in,fid1);
%nbElem=size(tri,1)
nbNode=size(coor,1);
vec = zeros(nbNode,1);
% [tri]=check_normal_cavity(coor,tri,nbElem);
% check_size_edges(coor,tri)

ind = linspace(1,nbNode,nbNode);
[XX,YY] = meshgrid(ind);
mat_green = Gree(kk(exper),coor,XX,YY);

vec_rho = ones(nbNode,1);
vec_V = mat_green * vec_rho;