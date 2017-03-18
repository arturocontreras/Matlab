clc; clear all; close all;

database = [];
i = 1;
figure(1)
pause
while(i < 181)
    name = ['imag',int2str(i),'.jpg'];
    % Lectura de imagen
    data = imread(name);
    % Reconocimiento del color
    if i<61
        cc = 1;
        esc = 0.24;
    else
        if i<121
            cc = 2;
            esc = 0.08;
        else
            cc = 3;
            esc = 0.20;
        end
    end
    color = data(:,:,cc);
    % Escala de grises (Y = 0.299R + 0.587G + 0.114B)
    gray = rgb2gray(data);
    % Diferencia
    diff_im = imsubtract(color, gray);
    % Filtrado
    imfilt = medfilt2(diff_im, [3 3]);
    % Binrizacion
    imbin = im2bw(imfilt,esc);
    % Descarte
    desc = bwareaopen(imbin,1000);
    % Etiquetado
    bw = bwlabel(desc, 8);
    % Obtener caracteristicas
    stats = regionprops(bw, 'BoundingBox', 'Centroid', 'Area', 'Perimeter');
    
    if (i<21) || ((i>60)&(i<81)) || ((i>120)&(i<141))
        id = [1 0 0];
    end
    if ((i>20)&(i<41)) || ((i>80)&(i<101)) || ((i>140)&(i<161))
        id = [0 1 0];
    end
    if ((i>40)&(i<61)) || ((i>100)&(i<121)) || (i>160)
        id = [0 0 1];
    end
    
    A = stats(1).Area;
    P = stats(1).Perimeter;

    dato = [i, A, P, id]; 
    
    database = [database;dato];
    %database(i,:) = dato;
    
        
     subplot 121
     imshow(data), title('Imagen')
     
     subplot 122
     imshow(desc), title('Descarte')
     a=text(15,30, strcat('A=', num2str(A)));
     set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 15, 'Color', 'yellow');
     
     b=text(15,80, strcat('P=', num2str(P)));
     set(b, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 15, 'Color', 'yellow');
    
    
    i = i+5;
    pause(0.01)
end

%save data.txt database -ascii -tabs    % Guarda archivo de datos

% hold on
% for object = 1:length(stats)
%     if(4*pi*(stats(object).Area)/(stats(object).Perimeter)^2 > 0.5)
%         bb = stats(object).BoundingBox;
%         bc = stats(object).Centroid;
%         rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
%         plot(bc(1),bc(2), '-m+')
%         a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
%         set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
%     end
% 
% end
