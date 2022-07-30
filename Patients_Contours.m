% close all
% clear all
% clc

%% -------------------- SELECCIÓN DEL PACIENTE --------------------
paciente = input('Apellido del paciente:','s');

%% -------------------- PROCESAMIENTO DE LAS IMAGENES  --------------------
switch paciente
    
    case 'etchar'
        % LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
        B = Read_image_and_apply_LUT('ETCHAR02.dcm');
        % ELEGIMOS EL FRAME RECORTAMOS:
        B = B(:,:,:,50); 
        B= B(71:522,267:654);
        
        figure(2)
        imshow(B)
        
        % SACAMOS LA ROI A PARTIR DE LA MÁSCARA:
        [mask,B2] = get_mask(B); 
        bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.2);
        %bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.4);

        imwrite(bw,strcat('ROI_', paciente, '.png'))
        figure(3)
        % IMAGEN + ROI PARA VER RESULTADO DE LA SEGMENTACION:
        fuse = imfuse(bw,B,'blend');
        imshow(fuse);
        % GUARDAMOS PARA BORRAR EXCEDENTE CON PAINT:
        imwrite(bw,strcat('bw_', paciente, '.png'));
        
        pause % SEGUIMOS POST EDICIÓN MANUAL
        figure(4)
        % NOS QUEDAMOS CON EL CONTORNO A PARTIR DE LA IMAGEN EDITADA 
        cont = edge(rgb2gray(imread(strcat('bw_', paciente, '.png'))),'canny');
        imwrite(cont,strcat('placa_', paciente, '.png'));
        cont_img = imfuse(B,cont,'blend');
        imshow(cont_img)
        title('Contorno + Imagen')
        % GUARDAMOS CONTORNO SUPERPUESTO CON LA IMAGEN ORIGINAL
        imwrite(cont_img,strcat('cont&img_', paciente, '.png'))
        
% ------------------------------- 2- PRINSI  ----------------------------------------
     
    case 'prinsi'
        % LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
        B = Read_image_and_apply_LUT('PRINSI04.dcm');
        % ELEGIMOS EL FRAME RECORTAMOS:
        B = B(:,:,:,120); 
        B= B(71:344,306:616);
        
        % SACAMOS EL CONTORNO A PARTIR DE LA MÁSCARA:
        [mask,B2] = get_mask(B,0.145); 
        bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.02);      
        imwrite(bw,strcat('ROI_', paciente, '.png'))
        figure(3)
        % IMAGEN + ROI PARA VER RESULTADO DE LA SEGMENTACION:
        fuse = imfuse(bw,B,'blend');
        imshow(fuse);
        % GUARDAMOS PARA BORRAR EXCEDENTE CON PAINT:
        imwrite(bw,strcat('bw_', paciente, '.png'));
        
        pause % SEGUIMOS POST EDICIÓN MANUAL
        figure(4)
        % NOS QUEDAMOS CON EL CONTORNO A PARTIR DE LA IMAGEN EDITADA 
        cont = edge(rgb2gray(imread(strcat('bw_', paciente, '.png'))),'canny');
        imwrite(cont,strcat('placa_', paciente, '.png'));
        cont_img = imfuse(B,cont,'blend');
        imshow(cont_img)
        title('Contorno + Imagen')
        % GUARDAMOS CONTORNO SUPERPUESTO CON LA IMAGEN ORIGINAL
        imwrite(cont_img,strcat('cont&img_', paciente, '.png'))
        
% ------------------------------- 3-ORTIZ  ----------------------------------------
        
    case 'ortiz'
        % LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
        B = Read_image_and_apply_LUT('ORTIZX00.dcm');
        % ELEGIMOS EL FRAME RECORTAMOS:
        B = B(:,:,:,54); 
        B= B(71:522,267:654);
        
        figure(2)
        imshow(B)
        
        % SACAMOS LA ROI A PARTIR DE LA MÁSCARA:
        [mask,B2] = get_mask(B,0.29); 
        bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.08);
        %bw = activecontour(B2,mask,500,'Chan-Vese','SmoothFactor',0.7);

        imwrite(bw,strcat('ROI_', paciente, '.png'))
        figure(3)
        % IMAGEN + ROI PARA VER RESULTADO DE LA SEGMENTACION:
        fuse = imfuse(bw,B,'blend');
        imshow(fuse);
        % GUARDAMOS PARA BORRAR EXCEDENTE CON PAINT:
        imwrite(bw,strcat('bw_', paciente, '.png'));
        
        pause % SEGUIMOS POST EDICIÓN MANUAL
        figure(4)
        % NOS QUEDAMOS CON EL CONTORNO A PARTIR DE LA IMAGEN EDITADA 
        cont = edge(rgb2gray(imread(strcat('bw_', paciente, '.png'))),'canny');
        imwrite(cont,strcat('placa_', paciente, '.png'));
        cont_img = imfuse(B,cont,'blend');
        imshow(cont_img)
        title('Contorno + Imagen')
        % GUARDAMOS CONTORNO SUPERPUESTO CON LA IMAGEN ORIGINAL
        imwrite(cont_img,strcat('cont&img_', paciente, '.png'))

% -------------------------------4-CORDERO--------------------------------------------
    case 'cordero'
        % LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
        B = Read_image_and_apply_LUT('CORDER04.dcm');
        % ELEGIMOS EL FRAME RECORTAMOS:
        B = B(:,:,:,101); 
        B= B(71:522,267:654);
        
        figure(2)
        imshow(B)
        
        % SACAMOS LA ROI A PARTIR DE LA MÁSCARA:
        [mask,B2] = get_mask(B,0.25); 
        %bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.2);
        bw = activecontour(B2,mask,500,'Chan-Vese','SmoothFactor',0.7);

        imwrite(bw,strcat('ROI_', paciente, '.png'))
        figure(3)
        % IMAGEN + ROI PARA VER RESULTADO DE LA SEGMENTACION:
        fuse = imfuse(bw,B,'blend');
        imshow(fuse);
        % GUARDAMOS PARA BORRAR EXCEDENTE CON PAINT:
        imwrite(bw,strcat('bw_', paciente, '.png'));
        
        pause % SEGUIMOS POST EDICIÓN MANUAL
        figure(4)
        % NOS QUEDAMOS CON EL CONTORNO A PARTIR DE LA IMAGEN EDITADA 
        cont = edge(rgb2gray(imread(strcat('bw_', paciente, '.png'))),'canny');
        imwrite(cont,strcat('placa_', paciente, '.png'));
        cont_img = imfuse(B,cont,'blend');
        imshow(cont_img)
        title('Contorno + Imagen')
        % GUARDAMOS CONTORNO SUPERPUESTO CON LA IMAGEN ORIGINAL
        imwrite(cont_img,strcat('cont&img_', paciente, '.png'))

        
end

%% -------------------- DENOISING DEL CONTORNO --------------------

% Acá hay que ver si usamos la tool que uso florencia, si hay alguna
% funcion nativa de matlab q nos sirva y la metemos en una función nuestra
% para hacer el denoise de cada contorno.
