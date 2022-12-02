function [vec] = CM_placa(contorno)

m = 1:size(contorno,1);
tot_mass = m(:).*2;

R = m(:).*contorno(:,1); %X
C = m(:).*contorno(:,2); %Y

vec = (R+C)./tot_mass(:);


% tot_mass = sum(A(:));
% [ii,jj] = ndgrid(1:size(A,1),1:size(A,2));
% R = sum(ii(:).*A(:))/tot_mass;
% C = sum(jj(:).*A(:))/tot_mass;
% out = [tot_mass,R,C]

end

