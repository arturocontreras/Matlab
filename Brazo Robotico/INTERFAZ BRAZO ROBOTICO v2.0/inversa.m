
clc;close all

%en centimetros

Pf=input('ingrese posicion final = ')
Q=input('ingrese Q inicial = ')
L1=8;
L2=20;
L3=12;
L4=10;
%Q=[0.1;0.3;0.4;0.8]%en radianes
q1=Q(1,1);
q2=Q(2,1);
q3=Q(3,1);
q4=Q(4,1);

Px=(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*cos(q1);
Py=(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*sin(q1);
Pz=L1+L2*sin(q2)+L3*sin(q2+q3)+L4*sin(q2+q3+q4);

P=[Px;Py;Pz]

a=-(L2*sin(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*sin(q1);
b=-L2*cos(q1)*sin(q2)-L3*cos(q1)*sin(q2+q3)-L4*cos(q1)*sin(q2+q3+q4);
c=-L3*cos(q1)*sin(q1+q3)-L4*cos(q1)*sin(q2+q3+q4);
d=-L4*cos(q1)*sin(q2+q3+q4);

e=(L2*sin(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*cos(q1);
f=-L2*sin(q1)*sin(q2)-L3*sin(q1)*sin(q2+q3)-L4*sin(q1)*sin(q2+q3+q4);
g=-L3*sin(q1)*sin(q1+q3)-L4*sin(q1)*sin(q2+q3+q4);
h=-L4*sin(q1)*sin(q2+q3+q4);

i=0;
j=L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4);
k=L3*cos(q2+q3)+L4*cos(q2+q3+q4);
l=L4*cos(q2+q3+q4);


J=[a b c d;e f g h;i j k l]

%matriz para la pseudoinversa

M=J'*J

Qf=Q+inv(M)*J'*(Pf-P)

Qfsexag=Qf*180/pi

%%%%%%%%%%%%%%%%%%%%%%%5

%GRAFICAR
%puntos de cada union de eslabones para poder graficar los vectores 
q1=Qf(1,1);
q2=Qf(2,1);
q3=Qf(3,1);
q4=Qf(4,1);

P0=[0,0,0];
P1=[0,0,L1];
P2=[L2*cos(q2)*cos(q1),L2*cos(q2)*sin(q1),L1+L2*sin(q2)];
P3=[(L2*cos(q2)+L3*cos(q2+q3))*cos(q1),(L2*cos(q2)+L3*cos(q2+q3))*sin(q1),L1+L2+sin(q2)+L3*sin(q2+q3)];
P4=[(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*cos(q1),(L2*cos(q2)+L3*cos(q2+q3)+L4*cos(q2+q3+q4))*sin(q1),L1+L2*sin(q2)+L3*sin(q2+q3)+L4*sin(q2+q3+q4)]

x1=P0(1):0.01:P1(1);
y1=P0(2):0.01:P1(2);
z1=P0(3):0.01:P1(3);

x2=P1(1):(P2(1)-P1(1))/10:P2(1);
y2=P1(2):(P2(2)-P1(2))/10:P2(2);
z2=P1(3):(P2(3)-P1(3))/10:P2(3);

x3=P2(1):(P3(1)-P2(1))/10:P3(1);
y3=P2(2):(P3(2)-P2(2))/10:P3(2);
z3=P2(3):(P3(3)-P2(3))/10:P3(3);

x4=P3(1):(P4(1)-P3(1))/10:P4(1);
y4=P3(2):(P4(2)-P3(2))/10:P4(2);
z4=P3(3):(P4(3)-P3(3))/10:P4(3);


figure(1)
hold on

plot3(x1,y1,z1,'d')
plot3(x2,y2,z2,'g')
plot3(x3,y3,z3,'b')
plot3(x4,y4,z4,'m')

hold off
grid on





