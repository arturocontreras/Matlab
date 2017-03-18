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

angulo = fread(s,3);
 angulo1 = (angulo(2)*360)/255  %conversion 
 angulo2 = -(angulo(1)*360)/255 %conversion 
 angulo3 =  (angulo(3)*360)/255  %conversion    

%clf;

phi=angulo1*pi/180;
rho=angulo2*pi/180;
theta=angulo3*pi/180;

p1(1)=CG(1)+a*cos(phi)*cos(theta)+b*cos(rho)*sin(theta);
p1(2)=CG(2)+a*cos(phi)*sin(theta)-b*cos(rho)*cos(theta);
p1(3)=CG(3)-a*sin(phi)-b*sin(rho);

p2(1)=CG(1)+a*cos(phi)*cos(theta)-b*cos(rho)*sin(theta);
p2(2)=CG(2)+a*cos(phi)*sin(theta)+b*cos(rho)*cos(theta);
p2(3)=CG(3)-a*sin(phi)+b*sin(rho);

p3(1)=CG(1)-a*cos(phi)*cos(theta)-b*cos(rho)*sin(theta);
p3(2)=CG(1)-a*cos(phi)*sin(theta)+b*cos(rho)*cos(theta);
p3(3)=CG(1)+a*sin(phi)+b*sin(rho);

p4(1)=CG(1)-a*cos(phi)*cos(theta)+b*cos(rho)*sin(theta);
p4(2)=CG(1)-a*cos(phi)*sin(theta)-b*cos(rho)*cos(theta);
p4(3)=CG(1)+a*sin(phi)-b*sin(rho);

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

