% LEEMOS LA IMAGEN Y LE APLICAMOS LA LUT:
        B = Read_image_and_apply_LUT('ETCHAR02.dcm');
        % ELEGIMOS EL FRAME RECORTAMOS:
        B = B(:,:,:,50); 
        B= B(71:522,267:654);
        
        figure(2)
        imshow(B)
        
        % SACAMOS LA ROI A PARTIR DE LA MÁSCARA:
        [mask,B2] = get_mask(B); 
        %bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.2);
        bw = activecontour(B2,mask,500,'Chan-Vese','ContractionBias',0.4);

%         imwrite(bw,strcat('ROI_', paciente, '.png'))
        figure(3)
        % IMAGEN + ROI PARA VER RESULTADO DE LA SEGMENTACION:
        fuse = imfuse(bw,B,'blend');
        imshow(fuse);
        Im_cont=imcrop(fuse);
        
        imshow(Im_cont);
        % ver de hacer improfile para las intensidades de la linea inf
%         p=improfile (5);
        
        
        
        [R,C]=size(Im_cont);
        for i=1:R
            for j=1:C
                if Im_cont(i,j)==60 || Im_cont(i,j)==61
                    Im_cont(i,j)=255;
                end
            end
        end
        
         