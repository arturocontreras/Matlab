%%recibir datos serial del microcontrolador para reconstruir las
%%coordenadas de tipo flotante
clear all;close all;clc
delete(instrfind({'Port'},{'COM7'})); %ajustar puerto serie!
format long
%crear objeto serie
s = serial('COM7','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)
t=0;
tic

description = sprintf('%s<br>%s</br><br>%s</br>', ...
   '3 Apple Hill Drive', 'Natick, MA. 01760', ...
   'http://www.notasutilesenperu.blogspot.com');

iconDir = fullfile(matlabroot,'toolbox','matlab','icons');
iconFilename = fullfile(iconDir, 'robot1.gif');

name = 'robot';
kmlDirectory = tempdir;
filename = fullfile(kmlDirectory, 'The_MathWorks.kml');
winopen(filename)
pause(5)

while t<tmax
    t = toc;
% leer del puerto serie
kmlDirectory = tempdir;

a2 = fread(s,9);

    if a2(1)=='S'
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
lat=-integracion_gps(a,b,c,d)
lon=-integracion_gps(e,f,g,h)

kmlwrite(filename, lat, lon, ...
   'Description', description, ...
   'Name', name, ...
   'Icon', iconFilename);
winopen(filename)

%input('');
pause(0.1)
  
end
% resultado del cronometro
fprintf('%g s de captura a %g cap/s \n',t,i/t);
 
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;
delete(instrfind({'Port'},{'COM7'})); %ajustar puerto serie!

