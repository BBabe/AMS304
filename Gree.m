function mat_green = Gree(k,coor,indx,indy)

x1 = coor(indx,1);
x2 = coor(indx,2);
x3 = coor(indx,3);
y1 = coor(indy,1);
y2 = coor(indy,2);
y3 = coor(indy,3);
r  = sqrt((x1-y1).^2+(x2-y2).^2+(x3-y3).^2);
vecGreen(r~=0) = exp(1i*k*r(r~=0)) ./ (4*pi*r(r~=0));
vecGreen(r==0) = 0;
sizeGreen = size(indx);
mat_green = reshape(vecGreen,sizeGreen);

end