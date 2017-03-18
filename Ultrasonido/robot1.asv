%%%%%%%%%%%prueba de interfaz de mapeo%%%%%%%%%%%%%%%%%%%
clear all;close all;clc
%--------------------Parametos generales-----------------
pause( );
a=0.2;
b=0.2;
c=0.2;
d=0.2;
L=0.3;
p=45;%angulo alpha
d1=0.2;
d2=0.2;
d3=0.2;
d4=0.2;
r=20;%rango del sensor
A=[];
B=[];

%%%-------------------GEOMETRIA FIJA--------------------

%%coordenadas de la parte frontal del movil%%%%%%%%%%%%%%
for i=0:0.1:28

if i<4    
tt=0
C=[0 i];%traaslacion, centro
elseif i>=4 && i<8
tt=90 ;%rotacion
C=[-(i-4) 4];%traaslacion, centro
plot(C(1),C(2),'r')
elseif i>=8 && i<12
tt=0 ;%rotacion
C=[-4 (i-4)];%traaslacion, centro
elseif i>=12 && i<20
tt=-90 ;%rotacion
C=[(i-16) 8];%traaslacion, centro
elseif i>=20 && i<24
tt=-180 ;%rotacion
C=[4 28-i];%traaslacion, centro
elseif i>=24 && i<28
tt=90 ;%rotacion
C=[28-i 4];%traaslacion, centro
end


Z1=[-(a+b+cosd(p)*(c+d)),L-(c+d)*sind(p)]
Z1m=tras_rot(Z1,C,tt) %Z modificado

Z2=[-(a+b),L]
Z2m=tras_rot(Z2,C,tt) %Z2 modificado

Z3=[(a+b),L]
Z3m=tras_rot(Z3,C,tt) %Z3 modificado

Z4=[(a+b+cosd(p)*(c+d)),L-(c+d)*sind(p)]
Z4m=tras_rot(Z4,C,tt) %Z4 modificado

%%coordenadas de los sensores ultrasonicos
U1=[-(a+b+c*cosd(p)),L-c*sind(p)];
U1m=tras_rot(U1,C,tt) %U1 modificado

U2=[-a,L];
U2m=tras_rot(U2,C,tt) %U2 modificado

U3=[a,L];
U3m=tras_rot(U3,C,tt) %U3 modificado

U4=[(a+b+c*cosd(p)),L-c*sind(p)];
U4m=tras_rot(U4,C,tt) %U4 modificado

fig=figure(1)
set(fig, 'name', 'Plan de Recorrido en terreno agricola')
axis([-10,10,0,10])
grid on
xlabel('x(m)')
ylabel('y(m)')

hold on


%%%%%%%%%%%% ploteo estatico--------------------------------

%ploteamos la cara
plot([Z1(1) Z2(1)],[Z1(2) Z2(2)],'b','LineWidth',4)
plot([Z2(1) Z3(1)],[Z2(2) Z3(2)],'b','LineWidth',4)
plot([Z3(1) Z4(1)],[Z3(2) Z4(2)],'b','LineWidth',4)
%ploteamos los sensores como circulos
display_circle(U1,0.03,'r')
display_circle(U2,0.03,'r')
display_circle(U3,0.03,'r')
display_circle(U4,0.03,'r')

%ploteamos la cara
plot([Z1m(1) Z2m(1)],[Z1m(2) Z2m(2)],'b','LineWidth',4)
plot([Z2m(1) Z3m(1)],[Z2m(2) Z3m(2)],'b','LineWidth',4)
plot([Z3m(1) Z4m(1)],[Z3m(2) Z4m(2)],'b','LineWidth',4)
%ploteamos los sensores como circulos
display_circle(U1m,0.03,'r')
display_circle(U2m,0.03,'r')
display_circle(U3m,0.03,'r')
display_circle(U4m,0.03,'r')
%
display_circle([0 4],0.06,'r')
display_circle([-4 4],0.06,'r')
display_circle([-4 8],0.06,'r')
display_circle([4 8],0.06,'r')
display_circle([4 4],0.06,'r')

pause(0.02)
clf(fig)
end

plot(A,B)
