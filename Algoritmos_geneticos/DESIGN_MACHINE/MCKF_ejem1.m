clear all;
close all;
clc;
%% Valores iniciales
m=10;
k=1000;
c=14.0960;
h=0.01;
w=10*pi;
g=9.81;
t=0:0.001:10;
qa=h/2*(cos(w*t)-1);
dqa=-h*w/2*sin(w*t);
f1=c*dqa-m*g+k*qa;
%% Variables
A=[0 1;-k/m -c/m];
B=[0;1/m];
C=[-k/m -c/m];
D=[1/m];
sys1=ss(A,B,C,D);
[y,t]=lsim(sys1,f1,t);
plot(t,y);

%% GA
long_caden=1;
%Se configua el Algoritmo definiendo par�metros 
%an�logos en la Gen�tica
generaciones = 50; % iteraciones del algoritmo
n = 40;            % tama�o de la poblaci�n de soluciones par
probabilidad = 0.3; % probabilidad de que cada gen mute
mutacion = 5*ones(1,long_caden);   % m�ximo valor que puede mutar

%35025<=ki<=140102
poblacion=100*rand(n,long_caden);

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
        c=poblacion(j,1);
        A=[0 1;-k/m -c/m];
        B=[0;1/m];
        C=[-k/m -c/m];
        D=[1/m];
        sys1=ss(A,B,C,D);
        [y,t]=lsim(sys1,f1,t);
        y=abs(y);
        y1=norm(y)/size(y,1);
        y=max(y);
        y=y+0.2*y1;
        penalidad=0;
        if c<0
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
c=poblacion(1,1)
A=[0 1;-k/m -c/m];
B=[0;1/m];
C=[-k/m -c/m];
D=[1/m];
sys1=ss(A,B,C,D);
[y,t]=lsim(sys1,f1,t);
plot(t,y);
