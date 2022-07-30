close all
clear all
clc

% IMAGENES PARA MOSTRAR
% ETCHAR00.dcm
% GARCIA06 (2).dcm
% LAMBER02.dcm
% MATAXX02.dcm
% SOBRAD02.dcm

% ?
% ARANCI00.dcm
% CERLON04.dcm
% GARCIA08.dcm


info = dicominfo('PRINSI04.dcm')
dicom_img = dicomread(info);




maximo = double(max(dicom_img(:)));
minimo = double(min(dicom_img(:)));

N = maximo - minimo + 1;
n = 2^8;
x = minimo:maximo; %Rango dinámico
 

LUT = uint8(ones(1,N)*255);
LUT(1,1:N) = (0:(n-1)/(N-1):n-1);
 
B = LUT(dicom_img - minimo + 1);

figure('Name','Video')
for i=1:size(dicom_img,4)
imshow(B(:,:,:,i));   
i
end
