function affichemaillage(nom_maillage, titre)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% affichemaillage: 
% pour visualiser un maillage triangulaire 2D
%
% SYNOPSIS affichemaillage(nom_maillage, titre)
%          
% INPUT  * nom_maillage : racine du fichier de maillage .msh (string) 
%        * titre (optionel) un titre (string)
%
% OUTPUT une fenetre graphique
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% control on the input args
if (nargin<2), titre = ''; end;
fid1=fopen('./status_error.log','w');

% lecture du fichier nom_maillage.amdba
[Coorneu,Numtri,Reftri]=read_meshfile(nom_maillage,fid1);
Nbpt = size(Coorneu,1);
Nbtri = size(Numtri,1);

%visualisation du maillage
figure;
hold on

% maillage
trimesh(Numtri,Coorneu(:,1),Coorneu(:,2),zeros(Nbpt,1));
view(2);
axis('equal');

% ajouter eventuellement un titre
title(titre);

hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        fin de la routine
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end