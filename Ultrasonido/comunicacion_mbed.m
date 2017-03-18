%%%%%%%%%%%prueba de interfaz de mapeo%%%%%%%%%%%%%%%%%%%
clear all;close all;clc

%--------COMUNICACION SERIAL---------------------------

delete(instrfind({'Port'},{'COM7'})); %ajustar puerto serie!
%crear objeto serie
s = serial('COM7','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);

%%%%%%%%%%%% ploteo dinamico--------------------------------
i = 1;
t = 0;
% ejecutar bucle cronometrado
tmax=100;
tic

while t<tmax
t = toc;
% leer del puerto serie
a2 = fread(s,5);
    if a2(1)=='S'
    a = a2(2)
    b = a2(3)
    c = a2(4)
    d = a2(5)
    latitud=-integracion_gps(a,b,c,d)
    end
    
    
% resultado del cronometro
end
fprintf('%g s de captura a %g cap/s \n',t,i/t);
 
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;
delete(instrfind({'Port'},{'COM7'})); %ajustar puerto serie!
