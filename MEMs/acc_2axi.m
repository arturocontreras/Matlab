%%%%%%%%%%%prueba de interfaz de mapeo%%%%%%%%%%%%%%%%%%%
clear all;close all;clc

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

for i=1:10
    
angulo=input('insertar phi = ');
angulo2=input('insertar rho = ');

phi=angulo*pi/180;
rho=angulo2*pi/180;

p1(1)=CG(1)+a*cos(phi);
p1(2)=CG(2)-b*cos(rho);
p1(3)=CG(3)-a*sin(phi)-b*sin(rho);

p2(1)=CG(1)+a*cos(phi);
p2(2)=CG(2)+b*cos(rho);
p2(3)=CG(3)-a*sin(phi)+b*sin(rho);

p3(1)=CG(1)-a*cos(phi);
p3(2)=CG(1)+b*cos(rho);
p3(3)=CG(1)+a*sin(phi)+b*sin(rho);

p4(1)=CG(1)-a*cos(phi);
p4(2)=CG(1)-b*cos(rho);
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


end


