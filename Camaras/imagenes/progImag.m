clc; clear all; close all

objVideo = camera;
preview(objVideo) % permite previsualizar el web cam


i = 81;
while(i<181)
    pause % Pausa hasta que se abre totalmente la web cam
    I_original = getsnapshot(objVideo); % getsnapshot(objeto) script para captura uan imágen desde el hardware (web cam) configurado
    imshow(I_original) % presenta la imagen capturada
    name = ['imag',int2str(i),'.jpg']
    imwrite(I_original,name)
    i = i + 1;
end

closepreview % cierra la ventana de previsualización de la web cam


