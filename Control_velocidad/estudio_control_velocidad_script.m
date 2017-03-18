clear all;close all;clc
%borrar previos
delete(instrfind({'Port'},{'COM4'}));
%crear objeto serie
s = serial('COM4','BaudRate',115200,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)

% preparar la figura
f = figure('Name','Captura');
a = axes('XLim',[0 tmax],'YLim',[0 80]);
l1 = line(nan,nan,'Color','r','LineWidth',2);
l2 = line(nan,nan,'Color','b','LineWidth',2);
 
xlabel('Tiempo (s)')
ylabel('Velocidad (V)')
title('Estudio del Control de Velocidad')
grid on
hold on
% inicializar
v1 = zeros(1,tmax*rate);
v2 = zeros(1,tmax*rate);
i = 1;
t = 0;

envio = input('Valor de Referencia = ');
fwrite(s,envio,'uint8');
% ejecutar bucle cronometrado
tic
while t<tmax
    t = toc;
    % leer del puerto serie
    a = fread(s,2,'uint8');
    v1(i)=a(1);
    v2(i)=a(2);
    
    disp(v1(i));
    disp(v2(i));
    % dibujar en la figura
    x = linspace(0,i/rate,i);
    set(l1,'YData',v1(1:i),'XData',x);
    set(l2,'YData',v2(1:i),'XData',x);
    drawnow
    % seguir
    i = i+1;
end
% resultado del cronometro
clc;
delete(instrfind({'Port'},{'COM4'}));
fprintf('%g s de captura a %g cap/s \n',t,i/t);
%savefigure('captura_multi','s',[4.5 3],'po','-dpdf')
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;