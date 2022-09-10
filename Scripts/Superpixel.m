%% RECIBE LA IMAGEN, LE APLICA SUPERPIXEL Y DEVUELVE
function [BW]= Superpixel (B_sinlumen)

% B_equaliz = histeq(B);
% 
% B_mediana=medfilt2(B_equaliz);


[L,N] = superpixels(B_sinlumen,3);
figure
BW = boundarymask(L);
% imshow(imoverlay(B_sinlumen,BW,'cyan'),'InitialMagnification',67);
% BW= imoverlay(B_sinlumen,BW,'cyan');
end