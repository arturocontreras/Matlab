%%%%%%%%%%%prueba de interfaz de mapeo%%%%%%%%%%%%%%%%%%%
clear all;close all;clc

%--------COMUNICACION SERIAL---------------------------

delete(instrfind({'Port'},{'COM4'})); %ajustar puerto serie!
%crear objeto serie
s = serial('COM4','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
 
%--------------------Parametos generales----------------

%medidas plano
a=0.2;
b=0.1;

%angulos de entrada

phi=20*pi/180;
rho=30*pi/180;
theta=40*pi/180;

CG=[0 0 0];
p1=[];
p2=[];
p3=[];
p4=[];

% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)
%--------------------Parametos generales-----------------
t=0;

tic

while t<tmax

t = toc;
% leer del puerto serie

angulo = fread(s,1);
angulo = - ( angulo - 90) %conversion 
phi=angulo*pi/180;

%clf;

p1(1)=CG(1)+a*cos(phi);
p1(2)=CG(2)-b;
p1(3)=CG(3)-a*sin(phi);

p2(1)=CG(1)+a*cos(phi);
p2(2)=CG(2)+b;
p2(3)=CG(3)-a*sin(phi);

p3(1)=CG(1)-a*cos(phi);
p3(2)=CG(1)+b;
p3(3)=CG(1)+a*sin(phi);

p4(1)=CG(1)-a*cos(phi);
p4(2)=CG(1)-b;
p4(3)=CG(1)+a*sin(phi);

x = [p1(1) p2(1) p3(1) p4(1)];
y = [p1(2) p2(2) p3(2) p4(2)];
z = [p1(3) p2(3) p3(3) p4(3)];


fill3(x, y, z, 1);
xlabel('x'); ylabel('y'); zlabel('z');  
%hold on

axis([-0.5 0.5 -0.5 0.5 -0.5 0.5])
view(25,50);
grid

pause(0.02);

end
% resultado del cronometro
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;

