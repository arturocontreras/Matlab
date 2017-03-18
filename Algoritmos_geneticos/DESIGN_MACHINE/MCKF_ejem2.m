clear all;
close all;
clc;
%% Valores iniciales
m=10;
I=0.1;
k1=388.4075;
k2=58.0618;
c1=14.0960;
c2=10;
a=0.1;
b=0.2;
h=0.01;
w1=10*pi;
w2=20*pi;
g=9.81;
t=0:0.001:10;
qa=h/2*(cos(w1*t)-1);
qb=h/2*(cos(w2*t+1)-1);
dqa=-h*w1/2*sin(w1*t);
dqb=-h*w2/2*sin(w2*t+1);
f1=c1*dqa+c2*dqb-m*g+k1*qa+k2*qb;
f2=-c1*a*dqa+c2*b*dqb+k1*a*qa+k2*b*qb;
u=[f1;f2];
%% Variables
A=[0 1 0 0;...
    -(k1+k2)/m -(c1+c2)/m -(k1*a+k2*b)/m -(c1*a+c2*b)/m;...
    0 0 0 1;...
    -(k1*a+k2*b)/I -(c2-c1)/I -(k1*a^2+k2*b^2)/I -(c2*b^2-c1*a^2)/I];
B=[0 0;1/m 0;0 0;0 1/I];
C=[-(k1+k2)/m+b*(k1*a+k2*b)/I -(c1+c2)/m+b*(c2-c1)/I -(k1*a+k2*b)/m+b*(k1*a^2+k2*b^2)/I -(c1*a+c2*b)/m+b*(c2*b^2-c1*a^2)/I];
D=[1/m -b/I];
sys1=ss(A,B,C,D);
[y,t]=lsim(sys1,u,t);
plot(t,y);

%% GA
long_caden=2;
%Se configua el Algoritmo definiendo par�metros 
%an�logos en la Gen�tica
generaciones = 50; % iteraciones del algoritmo
n = 40;            % tama�o de la poblaci�n de soluciones par
probabilidad = 0.3; % probabilidad de que cada gen mute
mutacion = 5*ones(1,long_caden);   % m�ximo valor que puede mutar

%35025<=ki<=140102
poblacion=10000*rand(n,long_caden);

%La poblaci�n de soluciones evoluciona mediante 
%la cruza y mutaci�n
s = n;

hw = waitbar(0,'Evolucionando...');
for i = 1:generaciones
%% Orden aleatorio de parejas
poblacion(:,long_caden+1) = rand(s,1);
poblacion = sortrows(poblacion,long_caden+1);

    %% Cruza
    pos_caract1=floor((long_caden-1)*rand(1,250))+1; %50 caracteres transferidos
    pos_caract2=floor((long_caden-1)*rand(1,250))+1;
    comb1=poblacion(1:2:end,:);
    comb2=poblacion(2:2:end,:);
    comb1(:,pos_caract1)=poblacion(2:2:end,pos_caract1);
    comb1(:,pos_caract1)=poblacion(2:2:end,pos_caract2);
    comb2(:,pos_caract2)=poblacion(1:2:end,pos_caract1);
    comb2(:,pos_caract2)=poblacion(1:2:end,pos_caract2);
    poblacion=[poblacion;comb1;comb2];

    %% Mutacion
    s = size(poblacion,1);
    poblacion=[poblacion; poblacion+[(rand(s,long_caden+1)<probabilidad).*(rand(s,long_caden+1)*2-1).*repmat([mutacion 0],s,1)]];

    %% C�lculo de la aptitud (o viabilidad)
    s = size(poblacion,1);

    for j=1:s
        k1=poblacion(j,1);
        k2=poblacion(j,2);
        A=[0 1 0 0;...
            -(k1+k2)/m -(c1+c2)/m -(k1*a+k2*b)/m -(c1*a+c2*b)/m;...
            0 0 0 1;...
            -(k1*a+k2*b)/I -(c2-c1)/I -(k1*a^2+k2*b^2)/I -(c2*b^2-c1*a^2)/I];
        B=[0 0;1/m 0;0 0;0 1/I];
        C=[-(k1+k2)/m+b*(k1*a+k2*b)/I -(c1+c2)/m+b*(c2-c1)/I -(k1*a+k2*b)/m+b*(k1*a^2+k2*b^2)/I -(c1*a+c2*b)/m+b*(c2*b^2-c1*a^2)/I];
        D=[1/m -b/I];
        sys1=ss(A,B,C,D);
        [y,t]=lsim(sys1,u,t);
        y=abs(y);
        y1=norm(y)/size(y,1);
        y=max(y);
        y=y+0.2*y1;
        penalidad=0;
        if c1<0 || c2<0
            penalidad=penalidad+100;
        end
        err=1e2-y-penalidad;
        if err<0
            y=Inf;
        end
        poblacion(j,long_caden+1)=y;
    end
    %% Seleccion
    poblacion = unique(poblacion,'rows');
    poblacion = sortrows(poblacion,long_caden+1);
    s = min([size(poblacion,1),n]);
    poblacion = poblacion(1:s,:);
    waitbar(i/generaciones,hw)
end
close(hw)

%% Mejor resultado
figure
k1=poblacion(1,1)
k2=poblacion(1,2)
A=[0 1 0 0;...
    -(k1+k2)/m -(c1+c2)/m -(k1*a+k2*b)/m -(c1*a+c2*b)/m;...
    0 0 0 1;...
    -(k1*a+k2*b)/I -(c2-c1)/I -(k1*a^2+k2*b^2)/I -(c2*b^2-c1*a^2)/I];
B=[0 0;1/m 0;0 0;0 1/I];
C=[-(k1+k2)/m+b*(k1*a+k2*b)/I -(c1+c2)/m+b*(c2-c1)/I -(k1*a+k2*b)/m+b*(k1*a^2+k2*b^2)/I -(c1*a+c2*b)/m+b*(c2*b^2-c1*a^2)/I];
D=[1/m -b/I];
sys1=ss(A,B,C,D);
[y,t]=lsim(sys1,u,t);
plot(t,y);
