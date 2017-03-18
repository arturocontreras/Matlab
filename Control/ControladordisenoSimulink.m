clc,clear all,home
% Parámetros de la Planta

Gp=tf([0.1234 17.56],[1 5.094 17.5]);%planta de tres opanes
pole(Gp)
%%%%Primer diseño
% P=11.6361786353305;
% I=0.829752264462256;
% D=0.204031681999589;
% N=34.9170843196142;

%%%%segundo Diseño-> tiempo subida=0.807s; tiempo asentamiento=2.59s, 
%sobrepico=2.5%, pico=1.03(step de 1 voltio)
P=9.73976973940501e-05;
I=13900.7415961237;
D=0;
N=100;
%El segundo diseño es el mejor

Gc=tf([(P+P*D*N) (P*N+P*I) P*I*N ],[1 N 0]);

%tercer diseño
%Gc=tf([1.3539],[1 0]);

%Gc=tf([(P+D*N) (P*N+I) (I*N)],[1 N 0]);
L=series(Gc,Gp);
H=feedback(L,1,-1);
figure
t=0:0.001:10;
u=ones(size(t));
yp=lsim(H,u,t);
plot(t,u,'r')
axis([0 6 0 1.5])
grid on
hold on
plot(t,yp)

%Rediseño del controlador analogo via tustin
T=1e-3;
[N,D]=tfdata(Gc,'v');
N=poly2sym(N,'s');
D=poly2sym(D,'s');
syms z
Gd=N/D;
Gd=subs(Gd,{'s'},(2*(z-1))/(T*(z+1)));
Gd=simplify(Gd);
Gd=vpa(Gd,4);
[ND DD]=numden(Gd);
ND=sym2poly(ND);
DD=sym2poly(DD);
GD=tf(ND,DD,T);%Controlador Discretizado



