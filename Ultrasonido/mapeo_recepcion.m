%%%%%%%%%%%prueba de interfaz de mapeo%%%%%%%%%%%%%%%%%%%
clear all;close all;clc

%--------COMUNICACION SERIAL---------------------------

delete(instrfind({'Port'},{'COM7'})); %ajustar puerto serie!
%crear objeto serie
s = serial('COM7','BaudRate',9600,'Terminator','CR/LF');
warning('off','MATLAB:serial:fscanf:unsuccessfulRead');
%abrir puerto
fopen(s);
 
% parámetros de medidas
tmax = 100; % tiempo de captura en s
rate = 33; % resultado experimental (comprobar)
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
r=60;%rango del sensor

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

%%%%%%%%%%%% ploteo dinamico--------------------------------
i = 1;
t = 0;
% ejecutar bucle cronometrado
tic

while t<tmax
    t = toc;
% leer del puerto serie

a2 = fread(s,5);

    if a2(1)=='S'
    d1=a2(2)/400;
    d2=a2(3)/400;
    d3=a2(4)/400;
    d4=a2(5)/400;
    end
    
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
drawnow
set(l2,'xdata', [P3x P4x], 'ydata',[P3y P4y])
drawnow
set(l3,'xdata', [P5x P6x], 'ydata',[P5y P6y])
drawnow
set(l4,'xdata', [P7x P8x], 'ydata',[P7y P8y])
drawnow

end
% resultado del cronometro
fprintf('%g s de captura a %g cap/s \n',t,i/t);
 
%% Limpiar la escena del crimen
fclose(s);
delete(s);
clear s;

