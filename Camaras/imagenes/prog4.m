clc; clear all; close all

inputs = load('DB_I.txt');
inputs = inputs';
targets = load('DB_T.txt');
targets = targets';
RedClas = create_pr_net(inputs,targets);

objVideo = camera2;
preview(objVideo) % permite previsualizar el web cam

esc = [0.24; 0.08; 0.20];
col = {'Rojo';'Verde';'Azul'};
fig = {'Circulo';'Cuadrado';'Triangulo'};
esp = ' ';

while(1)
    
    pause % Pausa hasta que se abre totalmente la web cam
    data = getsnapshot(objVideo); % getsnapshot(objeto) script para captura uan imágen desde el hardware (web cam) configurado
    for i = 1:3                
        color = data(:,:,i);
        % Escala de grises (Y = 0.299R + 0.587G + 0.114B)
        gray = rgb2gray(data);
        % Diferencia
        diff_im = imsubtract(color, gray);
        % Filtrado
        imfilt = medfilt2(diff_im, [3 3]);
        % Binrizacion
        imbin = im2bw(imfilt,esc(i));
        % Descarte
        desc = bwareaopen(imbin,1000);
        % Etiquetado
        bw = bwlabel(desc, 8);
        % Obtener caracteristicas
        stats = regionprops(bw, 'BoundingBox', 'Centroid', 'Area', 'Perimeter');
        
        
        
        for k = 1:length(stats)
            A = stats(k).Area;
            P = stats(k).Perimeter;
            R = P^2/A;            
            out = sim(RedClas,R);
            mp = max(out);
            if(mp > 0.9)
                idx = find(out == mp);
                figura = fig(idx);
                colour = col(i);
                disp(strcat(figura,esp,colour))      
                               
            end
            
        end
                        
    end
end

closepreview % cierra la ventana de previsualización de la web cam