clc,clear all,home

% Par�metros de la Planta
syms zeta
Mp=0.05;% maximo sobre-impulso
tr=2; %tiempo de asentamiento
x=solve(Mp==exp(-zeta*pi/sqrt(1-zeta^2)));
zeta=vpa(x,4);
wn=1.8/tr;
a=zeta*wn;a=sym2poly(a);
b=wn*sqrt(1-zeta^2);b=sym2poly(b);
%%los polos deseados son -a+-b*j
%a=1.16;b=1.1579;
syms s
Gplanta=tf([0.1234 17.56],[1 5.094 17.5]);%planta identificada de los 3 opanes
Gplantaens=(0.1234*s+17.56)/(s^2+5.094*s+17.5);
Np=[0.1234 17.56];
Dp=[1 5.094 17.5];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%%%Root Locus Method
X1=(1/(2*b))*imag(-1/subs(Gplantaens,'s',-a+b*j))+(1/(2*a))*real(-1/subs(Gplantaens,'s',-a+b*j));
X2=(1/(2*b))*imag(-1/subs(Gplantaens,'s',-a+b*j))-(1/(2*a))*real(-1/subs(Gplantaens,'s',-a+b*j));
Graya=tf(conv(Np,[1 2*a (a^2+b^2)]), 2*a*(conv([1 0],Dp)+conv(X2*Np,[1 0 0])-[0 0 (a^2+b^2)*X1*Np]));
figure (1)
rlocus(Graya)
Kpr=5;%%%elegimos el Kpr de modo que los polos no dominante este a una 
%distancia por m de polos dominantes (m=3 � 5), esto se hace de forma
%visual con el root locus.
Kir=((a^2+b^2)/(2*a))*Kpr-(a^2+b^2)*X1;
Kdr=(1/(2*a))*Kpr+X2;
Gcr=tf([Kdr Kpr Kir],[1 0]);
Lr=series(Gcr,Gplanta);
Hr=feedback(Lr,1,-1);
figure (2)
t=0:0.001:6;
u=ones(size(t));
yp=lsim(Hr,u,t);
plot(t,u,'r')
grid on
hold on
plot(t,yp)




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%nyquist plot method
Nn=X2*conv(Np,[1 0 0])-[0 0 (a^2+b^2)*X1*Np];
Dn=conv(Dp,[1 0]);
FTnyquist=tf(Nn,Dn);

%step 1
polesGo=vpa(solve(poly2sym(Dn)),4)%% asumimos m=3,3 raices caen fuera de la 
%region deseada (m*a=s=-3.5) por lo tanto PGo+=3

%step 2
figure (3)
nyquistplot(FTnyquist)
%contamos el numero de circulos que van en la direccion de agujas del reloj
%y que pasan por -1+0*j, a este numero le llamamos NGo+, en nuestro caso
%NGo+=-1
%El numero de polos de Graya fuera de la region deseada
%es->PG+=(PGo+)+(NGo+)=2

%step 3
figure (4)
nyquistplot(Graya)
% Hallamos el rango de Kpn para los cuales los circulos horarios con
% respecto a (-1/Kpn,0) son en total (2-PG+), en nuestro caso 2-PG+=0
%rango de Kpn ->[0,inf+]
Kpn=1;
Kin=((a^2+b^2)/(2*a))*Kpn-(a^2+b^2)*X1;
Kdn=(1/(2*a))*Kpn+X2;
Gcn=tf([Kdn Kpn Kin],[1 0]);
Ln=series(Gcn,Gplanta);
Hn=feedback(Ln,1,-1);
figure (5)
t=0:0.001:10;
u=ones(size(t));
yp=lsim(Hn,u,t);
plot(t,u,'r')
grid on
hold on
plot(t,yp)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Redise�o del controlador analogo via tustin
T=1e-3;
[N,D]=tfdata(Gcr,'v');
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
GDrlocus=tf(ND,DD,T);%controlador discreto root-locus

[N,D]=tfdata(Gcn,'v');
N=poly2sym(N,'s');
D=poly2sym(D,'s');
Gd=N/D;
Gd=subs(Gd,{'s'},(2*(z-1))/(T*(z+1)));
Gd=simplify(Gd);
Gd=vpa(Gd,4);
[ND DD]=numden(Gd);
ND=sym2poly(ND);
DD=sym2poly(DD);
GDnyquits=tf(ND,DD,T);%controlador discreto nyquist


