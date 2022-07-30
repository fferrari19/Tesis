function [B] = Read_image_and_apply_LUT(filename)

info = dicominfo(filename);
dicom_img = dicomread(info);
dicom_img = int16(dicom_img) ;

maximo = double(max(dicom_img(:)));
minimo = double(min(dicom_img(:)));

N = maximo - minimo + 1;
n = 2^8;

LUT = uint8(ones(1,N)*255);
LUT(1,1:N) = (0:(n-1)/(N-1):n-1);
 
B = LUT(dicom_img - minimo + 1);
end

