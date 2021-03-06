clc; clear all; close all;

vid=videoinput('winvideo',2,'YUY2_640x480');
%640x480 160x120
% Se configura las opciones de adquision de video
set(vid, 'FramesPerTrigger', Inf);
set(vid, 'ReturnedColorspace', 'rgb')
vid.FrameGrabInterval = 5;
%framegrabinterval significa que tomara cada 5 frame del stream de video adquirida
%con start(vid) se activa la adquisicion, pero todavia se toma la primera foto
start(vid)
% MEDICION DE DISTANCIA CON LASER
a = [];
b = [];
while(vid.FramesAcquired<=500)
    data = getsnapshot(vid);
    hsv = rgb2hsv(data);
    %get the illuminance channel
    v = hsv(:,:,3);    
    %find the max pixel value
    max_v = max(max(v));    
    % find the position of pixels having this value.
    [r, c] = find(v == max_v);
    R = median(r);
    C = median(c);
    imshow(data)
    hold on
    plot(C, R, '-m+')
    D = 4/(tan(0.0015*(R-240)-0.0456)) 
    
end


% detenemos la captura
stop(vid);


%FLUSHDATA remueve la imagen del motor de adquisicion y la almacena en el buffer
flushdata(vid);

% borramos todo(como en cualquier programa)
clear all
