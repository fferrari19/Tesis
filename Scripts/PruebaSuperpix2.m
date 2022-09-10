% LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
B = Read_image_and_apply_LUT('ETCHAR02.dcm');
% ELEGIMOS EL FRAME RECORTAMOS:
B = B(:,:,:,50); 
B= B(71:522,267:654);

B_mediana=imadjust(B);
B_bin = imbinarize(im2double(B_mediana),'global');
B_sinlumen= B_bin.*im2double(B_mediana);
B_sinlumen=imcrop(B_sinlumen);

% SUPERPIXEL
perim_sup= Superpixel(B_sinlumen);

B_contorno= imoverlay(B_sinlumen,perim_sup,'cyan');
imshow(B_contorno);
B_contorno_gray = rgb2gray(B_contorno);
imshow(B_contorno_gray);
% ver de hacer improfile para las intensidades de la linea inf

p=improfile;     
% me quedo con la intensidad más repetida ? ver que cuan valido es
p=find(p~=0);
Intensidad = round(mode(p));
[R,C]=size(B_contorno_gray);

        for i=1:R
            for j=1:C
                if B_contorno_gray(i,j)== 148
                    
                    perim_sup(i,j)=255;
                end
            end
        end
        
imshow(perim_sup);