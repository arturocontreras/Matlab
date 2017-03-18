clc; clear all; close all
delete(instrfind({'Port'},{'COM8'})); %ajustar puerto serie
% Entrenamiento de red neuronal
inputs = load('DB_I.txt');
inputs = inputs';
targets = load('DB_T.txt');
targets = targets';
RedClas = create_pr_net(inputs,targets);

% Creacin de puerto de comunicación serial
sp = serial('COM8','BaudRate',9600);
fopen(sp)

% permite previsualizar el web cam
objVideo = camera2;
preview(objVideo)
pause(1)

%Ref(1): 1:rojo, 2:verde, 3:azul 
%Ref(2): 1:circulo, 2:cuadrado, 3:triangulo
ref = [1 1 1 2 2 2 3 3 3;1 2 3 1 2 3 1 2 3]';
msg = 0;

esc = [0.24; 0.08; 0.20];

while(1)
    pause(0.1)
    if (sp.BytesAvailable > 0)
        msg = fread(sp,1);
        disp('llego dato')
        disp(int2str(msg))
        flag = 0;
        %msg = msg-48;
    end

    
    if ((msg>0) & (msg<10))
        col = ref(msg,1);
        fig = ref(msg,2);
        
        while(sp.BytesAvailable == 0)
            pause(0.01)
            data = getsnapshot(objVideo);
            color = data(:,:,col);            
            gray = rgb2gray(data);           
            diff_im = imsubtract(color, gray);            
            imfilt = medfilt2(diff_im, [3 3]);            
            imbin = im2bw(imfilt,esc(col));            
            desc = bwareaopen(imbin,1000);           
            bw = bwlabel(desc, 8);           
            stats = regionprops(bw, 'BoundingBox', 'Centroid', 'Area', 'Perimeter');
            
            for k = 1:length(stats)
                A = stats(k).Area;
                P = stats(k).Perimeter;
                R = P^2/A;
                out = sim(RedClas,R);
                mp = max(out);
                if(mp > 0.85)
                    idx = find(out == mp);
                    if((fig == idx)&&(flag == 0))
                        disp('ELEMENTO ENCONTRADO')
                        fwrite(sp,1,'uint8') 
                        flag = 1;
                    end    
                end
            end
        end
    end
end

closepreview
fclose(sp)
delete(sp)