%%recibir datos serial del microcontrolador para reconstruir las
%%coordenadas de tipo flotante
clear all;close all;clc
delete(instrfind({'Port'},{'COM5'})); %ajustar puerto serie!
format long
%crear objeto serie
s = serial('COM5','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);


% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)
t=0;

tic
while t<tmax
    t = toc;
% leer del puerto serie

a2 = fread(s,9);

    if a2(1)=='x'
    %partes de la latitud
    a=a2(2);
    b=a2(3);
    c=a2(4);
    d=a2(5);
    %partes de la longitud
    e=a2(6)
    f=a2(7)
    g=a2(8)
    h=a2(9)
    
    end
  latitud=-integracion_gps(a,b,c,d)
  longitud=integracion_gps(e,f,g,h)

  pause(0.01)
    
end
% resultado del cronometro
fprintf('%g s de captura a %g cap/s \n',t,i/t);
 
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;
