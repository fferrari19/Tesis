    
% NO SE QUÉ TAN NECESARIO VAN A SER LOS PARÁMETROS DE LOS FRAMES SI YA
% LOS VAMOS A TENER ELEGIDOS PARA CADA PACIENTE.

% LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
B = Read_image_and_apply_LUT('ETCHAR00.dcm');
apellido = 'etchar';
% ELEGIMOS EL FRAME RECORTAMOS: 
%(RECORTAR IMÁGENES SELECCIONADAS PARA OBVIAR ESTE PASO)
B = B(:,:,:,50); 
B= B(71:522,267:654);

figure(1)
imshow(B)
H = imfreehand('Closed',1);
p = wait(H)


T = table(p(:,1),p(:,2));
T.Properties.VariableNames([1 2]) = {strcat(apellido,'_x') strcat(apellido,'_y')};

%range = strcat()

writetable(T,'Segmentos.xlsx','WriteMode','append')