vid1 = videoinput('winvideo', 1);
vid2 = videoinput('winvideo', 2);
start([vid1 vid2]);

% handles.axes1 = subplot(1,2,1);
% axes(handles.axes1);
% handleToImageInAxes1 = image(zeros(800,600));
% preview(vid1, handleToImageInAxes1);
% handles.axes2 = subplot(1,2,2);
% axes(handles.axes2);
% handleToImageInAxes2 = image(zeros(800,600));
% preview(vid2, handleToImageInAxes2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all;clear all;clc;

% primero se captura un stream de video usando videoinput, con argumento
%de winvideo, numero de dispositivo y formato de la camara, si no sabes usa la
%funcion imaqtool para averiguarlo es YUY o RGB
imaqreset
%vid=videoinput('winvideo',1,'YUY2_640x480');
vid1 = videoinput('winvideo', 1,'YUY2_640x480');
vid2 = videoinput('winvideo', 2,'YUY2_640x480');
%640x480 160x120
% Se configura las opciones de adquision de video
set(vid1, 'FramesPerTrigger', Inf);
set(vid1, 'ReturnedColorspace', 'rgb')
vid1.FrameGrabInterval = 5;
%%%%%%%%%%%

set(vid2, 'FramesPerTrigger', Inf);
set(vid2, 'ReturnedColorspace', 'rgb')
vid2.FrameGrabInterval = 5;


%framegrabinterval significa que tomara cada 5 frame del stream de video adquirida
%con start(vid) se activa la adquisicion, pero todavia se toma la primera foto
%start(vid)
start([vid1 vid2]);

figure(1)
% cream[vid1 vid2]os un bucle que puede ser while always o while true en este caso
%y como mi compu es una netbook trucha(trucha=cagada=lenta=barata)
%hago que despues de 100 frames adquiridos se salga del bucle para evitar colgadas
while(vid1.FramesAcquired<=5000)

% se toma una snapshot del stream y se la almacena en data para trabajar mas
%facil
data1 = getsnapshot(vid1);
data2 = getsnapshot(vid2);

% ahora vamos a reconocer el color rojo en tiempo real
% tenemos que extraer el color rojo
% de la imagen en escala de grises de la imagen adquirida en data
diff_im1 = imsubtract(data1(:,:,2), rgb2gray(data1));
diff_im2 = imsubtract(data2(:,:,1), rgb2gray(data2));
%imsubstract sirve para sacar algun valor constante de una imagen, usamos como
%argumento el array de data y la funcion rgb2gray de data
%se usa medfilt2 para filtrar la senial del ruido
diff_im1 = medfilt2(diff_im1, [3 3]);
diff_im2 = medfilt2(diff_im2, [3 3]);

% Convertir la imagen en escala de grises a una imagen binaria.
diff_im1 = im2bw(diff_im1,0.08);
diff_im2 = im2bw(diff_im2,0.08);

% para determinar el tamanio a reconocer se usa bwareopen para descartar
%imagen de rojo de menos de 300 pixels
diff_im1 = bwareaopen(diff_im1,3);
diff_im2 = bwareaopen(diff_im2,3);

% Etiquetamos los elementos conectados en la imagen
bw1 = bwlabel(diff_im1, 8);
bw2 = bwlabel(diff_im2, 8);

% Ahora hacemos el analisis del "objeto" detectado(que solo son pixels rojos)
%agrupados de mas de 300
% onfiguramos la region etiquetada
stats1 = regionprops(bw1, 'BoundingBox', 'Centroid');
stats2 = regionprops(bw2, 'BoundingBox', 'Centroid');

% mostramos la imagen

subplot(1,2,1)
% imshow(diff_im)
imshow(data1)
hold on

for object1 = 1:length(stats1)
    
length(stats1)
bb1 = stats1(object1).BoundingBox;
bc1 = stats1(object1).Centroid;
rectangle('Position',bb1,'EdgeColor','r','LineWidth',2)
plot(bc1(1),bc1(2), '-m+')
a1=text(bc1(1)+15,bc1(2), strcat('X: ', num2str(round(bc1(1))), ' Y: ', num2str(round(bc1(2)))));
set(a1, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');

end
hold off

subplot(1,2,2)
imshow(data2)
% imshow(diff_im)
hold on
%este es un bucle para encerrar el objeto rojo en un rectangulp y una cruz en el
%centroide(solo es programacion basica de matlab)
for object2 = 1:length(stats2)

bb2 = stats1(object2).BoundingBox;
bc2 = stats1(object2).Centroid;

rectangle('Position',bb1,'EdgeColor','r','LineWidth',2)
plot(bc2(1),bc2(2), '-m+')
a2=text(bc2(1)+15,bc2(2), strcat('X: ', num2str(round(bc2(1))), ' Y: ', num2str(round(bc2(2)))));
set(a2, 'FontName', 'Arial', 'FontWeight', 'bold', 'FontSize', 12, 'Color', 'yellow');
end

hold off
end
% aqui terminan los 2 bucles

% detenemos la captura
stop([vid1 vid2]);


%FLUSHDATA remueve la imagen del motor de adquisicion y la almacena en el buffer
flushdata([vid1 vid2]);

% borramos todo(como en cualquier programa)
clear all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%