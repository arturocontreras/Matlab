%%%%%%%%%%%prueba de interfaz de mapeo%%%%%%%%%%%%%%%%%%%
clear all;close all;clc
%--------------------Parametos generales-----------------
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

%%%-------------------GEOMETRIA FIJA--------------------

%%coordenadas de la parte frontal del movil%%%%%%%%%%%%%%
Z1=[-(a+b+cosd(p)*(c+d)),L-(c+d)*sind(p)]
Z2=[-(a+b),L]
Z3=[(a+b),L]
Z4=[(a+b+cosd(p)*(c+d)),L-(c+d)*sind(p)]

%%coordenadas de los sensores ultrasonicos
U1=[-(a+b+c*cosd(p)),L-c*sind(p)];
U2=[-a,L];
U3=[a,L];
U4=[(a+b+c*cosd(p)),L-c*sind(p)];

fig=figure(1)
set(fig, 'name', 'mapeo con ultrasonicos')
axis([-1,1,0,1])
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

%display dinamico de la deteccion de los sensores ultrasonicos
%handle para visualizacion dinamica

l1 = line(nan,nan,'Color','r','LineWidth',2);
l2 = line(nan,nan,'Color','r','LineWidth',2);
l3 = line(nan,nan,'Color','r','LineWidth',2);
l4 = line(nan,nan,'Color','r','LineWidth',2);

% %Primer Sensor U1
% K1 = 5;
% handle_sensor1 = zeros(1,K1);
% for f=1:K1
%     handle_sensor1(f) = plot(0,0, 'k','LineWidth',2);
% end
% 

%%%%%%%%%%%% ploteo dinamico--------------------------------
for i=1:5

%%%-------------------GEOMETRIA VARIABLE--------------------

%primera linea de vision:
P1x=-(a+b+c*cosd(p)+d1*secd(r/2)*cosd(90-r/2-p));
P2x=-(a+b+c*cosd(p)+d1*secd(r/2)*cosd(90+r/2-p));

P1y=L-c*sind(p)+d1*sind(90-r/2-p)*secd(r/2);
P2y=L-c*sind(p)+d1*sind(90+r/2-p)*secd(r/2);

%segunda linea de vision:
P3x=-(a+d2*tand(r/2));
P4x=-(a-d2*tand(r/2));

P3y=L+d2;
P4y=L+d2;

%tercera linea de vision:
P5x=a-d3*tand(r/2);
P6x=a+d3*tand(r/2);

P5y=L+d3;
P6y=L+d3;

%cuarta linea de vision:
P7x=a+b+c*cosd(p)+d4*secd(r/2)*cosd(90+r/2-p);
P8x=a+b+c*cosd(p)+d4*secd(r/2)*cosd(90-r/2-p);

P7y=L-c*sind(p)+d4*sind(90+r/2-p)*secd(r/2);
P8y=L-c*sind(p)+d4*sind(90-r/2-p)*secd(r/2);

%plot
set(l1,'xdata', [P1x P2x], 'ydata',[P1y P2y])
set(l2,'xdata', [P3x P4x], 'ydata',[P3y P4y])
set(l3,'xdata', [P5x P6x], 'ydata',[P5y P6y])
set(l4,'xdata', [P7x P8x], 'ydata',[P7y P8y])

% d1=input('ingresa d1= ')
% d2=input('ingresa d2= ')
% d3=input('ingresa d3= ')
% d4=input('ingresa d4= ')

d1=d1+sin(i/10);
d2=d2+sin(i/10);
d3=d3+sin(i/20);
d4=d4+sin(i/30);

pause()

end



