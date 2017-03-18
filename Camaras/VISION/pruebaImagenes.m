% PRUEBA CON IMAGEN DE MANZANAS
clc; clear all; close all;

% Lectura de imagen
data = imread('frutos.jpg');
% Reconocimiento del color
color = data(:,:,1);
% Escala de grises (Y = 0.299R + 0.587G + 0.114B)
gray = rgb2gray(data);
% Diferencia
diff_im = imsubtract(color, gray);
% Filtrado
imfilt = medfilt2(diff_im, [3 3]);
% Binrizacion
imbin = im2bw(imfilt,0.19);
% Descarte
desc = bwareaopen(imbin,1000);
% Etiquetado
bw = bwlabel(desc, 8);
% Obtener caracteristicas
stats = regionprops(bw, 'BoundingBox', 'Centroid', 'Area', 'Perimeter');

bw = bw/max(max(bw));

figure(1)
subplot 233, imshow(data), title('Imagen')
subplot 231, imshow(color), title('Color')
subplot 232, imshow(gray), title('Grises') 
subplot 234, imshow(diff_im), title('Diferencia')
subplot 235, imshow(imfilt), title('Filtro')
subplot 236, imshow(imbin), title('Binario')

figure(2)
subplot 121, imshow(desc), title('Descarte')
subplot 122
imshow(bw), title('Etiquetado')
hold on
for object = 1:length(stats)
    if(4*pi*(stats(object).Area)/(stats(object).Perimeter)^2 > 0.5)
        bb = stats(object).BoundingBox;
        bc = stats(object).Centroid;
        rectangle('Position',bb,'EdgeColor','r','LineWidth',2)
        plot(bc(1),bc(2), '-m+')
        a=text(bc(1)+15,bc(2), strcat('X: ', num2str(round(bc(1))), ' Y: ', num2str(round(bc(2)))));
        set(a, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
    end

end

