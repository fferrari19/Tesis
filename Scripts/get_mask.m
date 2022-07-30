function [mask,B2] = get_mask(img,T)


figure(1)
if ~exist('T','var')
      B_bin = imbinarize(im2double(img),'global');

else
      B_bin = imbinarize(im2double(img),T);
end
B_bin = imfill(B_bin,'holes');

imshow(B_bin)
title('Imagen binarizada')

B2 = B_bin.*im2double(img);
mask = roipoly;
end

