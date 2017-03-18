clear all;
close all;
clc;
%% Valores invariables
m1=132;m2=2040;I2=4630;mt=44;
ct=876;c3=2543;c4=2543;         % optimos c3=3169;c4=1918;
kt=262700;
h=0.102;l1=24.4;l2=3.05;
a=2.03;b=0.25;d=0.76;V=24.4;
g=9.81;

%% Valores Iniciales
k3=175127;k4=175127; % Valores a ser hallados 35025<k<175127
L=sqrt(l1^2+l2^2);
w=2*pi*V/L;
tau=(a+b+d)/V;
t=0:0.01:2*L/V+18;
qa=qat(h,w,tau,L,V,t);
dqa=dqat(h,w,tau,L,V,t);
qb=qbt(h,w,L,V,t);
dqb=dqbt(h,w,L,V,t);
n=size(qa,2);
%% Matrices basicas - ec dif - SS
% M=[m1,0,0,0;0,m2,0,0;0,0,I2,0;0,0,0,mt];
% C=[c3+ct,-c3,-a*c3,0;...
%     -c3,c3+c4,-a*c3+c4*(b+d),-c4;...
%     -c3*a,-c3*a+c4*(b+d),-c3*a^2+c4*(b+d)^2,-c4*(b+d);...
%     0,-c4,-c4*(b+d),c4+ct];
% K=[kt+k3,-k3,k3*a,0;...
%     -k3,k4+k3,k4*(b+d)-k3*a,-k4;...
%     k3*a,k4*(b+d)-k3*a,k4*(b+d)^2+k3*a^2,-k4*(b+d);...
%     0,-k4,-k4*(b+d),kt+k4];
Ft=[-mt*g+ct*dqa+kt*qa;...
    -m2*g*ones(1,n);...
    0*ones(1,n);...
    -mt*g+kt*qb+ct*dqb];

Ass=[0 1 0 0 0 0 0 0;...
    -(kt+k3)/mt -(ct+c3)/mt k3/mt c3/mt k3*a/mt c3*a/mt 0 0;...
    0 0 0 1 0 0 0 0;...
    k3/m2 c3/m2 -(k4+k3)/m2 -(c3+c4)/m2 -(k3*a-k4*(b+d))/m2 -(-c4*(b+d)+c3*a)/m2 k4/m2 c4/m2;...
    0 0 0 0 0 1 0 0;...
    k3*a/I2 c3*a/I2 -(-k4*(b+d)+k3*a)/I2 -(-c4*(b+d)+c3*a)/I2 -(k4*(b+d)^2+k3*a^2)/I2 -(c4*(b+d)^2+c3*a^2)/I2 -k4*(b+d)/I2 -c4*(b+d)/I2;...
    0 0 0 0 0 0 0 1;...
    0 0 k4/mt c4/mt -k4*(b+d)/mt -c4*(b+d)/mt -(kt+k4)/mt -(c4+ct)/mt];
Bss=[0 0 0 0;...
    1/mt 0 0 0;...
    0 0 0 0;...
    0 1/m2 0 0;...
    0 0 0 0;...
    0 0 1/I2 0;...
    0 0 0 0;...
    0 0 0 1/mt];
Css=[k3/m2-k3*a*b/I2 c3/m2-c3*a*b/I2 -(k4+k3)/m2+b*(-k4*(b+d)+k3*a)/I2 -(c3+c4)/m2+b*(-c4*(b+d)+c3*a)/I2 -(-k4*(b+d)+k3*a)/m2+b*(k4*(b+d)^2+k3*a^2)/I2 -(-c4*(b+d)+c3*a)/m2+b*(c4*(b+d)^2+c3*a^2)/I2 k4/m2+k4*b*(b+d)/I2 c4/m2+c4*b*(b+d)/I2];
Dss=[0 1/m2 -b/I2 0];
%% Resolución
sys1=ss(Ass,Bss,Css,Dss);
% bode(sys1)
[y,t]=lsim(sys1,Ft,t,[0 0 0 0 0 0 0 0]');
figure
subplot(211)
plot(t,y);
axis([10 20 -6 6]);
grid on
xlabel('tiempo');
ylabel('ddq1 (m/s2)');
%% GA
long_caden=2;
%Se configua el Algoritmo definiendo parámetros 
%análogos en la Genética
generaciones = 60; % iteraciones del algoritmo
n = 30;            % tamaño de la población de soluciones par
probabilidad = 0.2; % probabilidad de que cada gen mute
mutacion = 1000*ones(1,long_caden);   % máximo valor que puede mutar

%35025<=ki<=140102
poblacion=(140000*rand(n,long_caden)+30000);

%La población de soluciones evoluciona mediante 
%la cruza y mutación
s = n;

hw = waitbar(0,'Evolucionando...');
for i = 1:generaciones
%% Orden aleatorio de parejas
poblacion(:,long_caden+1) = rand(s,1);
poblacion = sortrows(poblacion,long_caden+1);

    %% Cruce
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

    %% Cálculo de la aptitud (o viabilidad)
    s = size(poblacion,1);

    for j=1:s
        k3=poblacion(j,1);
        k4=poblacion(j,2);
        Ass=[0 1 0 0 0 0 0 0;...
            -(kt+k3)/mt -(ct+c3)/mt k3/mt c3/mt k3*a/mt c3*a/mt 0 0;...
            0 0 0 1 0 0 0 0;...
            k3/m2 c3/m2 -(k4+k3)/m2 -(c3+c4)/m2 -(k3*a-k4*(b+d))/m2 -(-c4*(b+d)+c3*a)/m2 k4/m2 c4/m2;...
            0 0 0 0 0 1 0 0;...
            k3*a/I2 c3*a/I2 -(-k4*(b+d)+k3*a)/I2 -(-c4*(b+d)+c3*a)/I2 -(k4*(b+d)^2+k3*a^2)/I2 -(c4*(b+d)^2+c3*a^2)/I2 -k4*(b+d)/I2 -c4*(b+d)/I2;...
            0 0 0 0 0 0 0 1;...
            0 0 k4/mt c4/mt -k4*(b+d)/mt -c4*(b+d)/mt -(kt+k4)/mt -(c4+ct)/mt];
        Bss=[0 0 0 0;...
            1/mt 0 0 0;...
            0 0 0 0;...
            0 1/m2 0 0;...
            0 0 0 0;...
            0 0 1/I2 0;...
            0 0 0 0;...
            0 0 0 1/mt];
        Css=[k3/m2-k3*a*b/I2 c3/m2-c3*a*b/I2 -(k4+k3)/m2+b*(-k4*(b+d)+k3*a)/I2 -(c3+c4)/m2+b*(-c4*(b+d)+c3*a)/I2 -(-k4*(b+d)+k3*a)/m2+b*(k4*(b+d)^2+k3*a^2)/I2 -(-c4*(b+d)+c3*a)/m2+b*(c4*(b+d)^2+c3*a^2)/I2 k4/m2+k4*b*(b+d)/I2 c4/m2+c4*b*(b+d)/I2];
        Dss=[0 1/m2 -b/I2 0];
        sys1=ss(Ass,Bss,Css,Dss);
        [y,t]=lsim(sys1,Ft,t,[0 0 0 0 0 0 0 0]');
        y=abs(y);
        ndt=floor(size(t,1)/2);
        y3=y(ndt:end);
        t3=t(ndt:end);
        y1=norm(y3)/size(y3,1);
        y3=max(y3);
        y=0.9*y3+0.1*y1;
        penalidad=0;
        if k3<35025 || k4<35025
            penalidad=penalidad+Inf;
        end
        if k3>175127 || k4>175127
            penalidad=penalidad+Inf;
        end
        err=1e5-y-penalidad;
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
k3=poblacion(1,1)
k4=poblacion(1,2)
        Ass=[0 1 0 0 0 0 0 0;...
            -(kt+k3)/mt -(ct+c3)/mt k3/mt c3/mt k3*a/mt c3*a/mt 0 0;...
            0 0 0 1 0 0 0 0;...
            k3/m2 c3/m2 -(k4+k3)/m2 -(c3+c4)/m2 -(k3*a-k4*(b+d))/m2 -(-c4*(b+d)+c3*a)/m2 k4/m2 c4/m2;...
            0 0 0 0 0 1 0 0;...
            k3*a/I2 c3*a/I2 -(-k4*(b+d)+k3*a)/I2 -(-c4*(b+d)+c3*a)/I2 -(k4*(b+d)^2+k3*a^2)/I2 -(c4*(b+d)^2+c3*a^2)/I2 -k4*(b+d)/I2 -c4*(b+d)/I2;...
            0 0 0 0 0 0 0 1;...
            0 0 k4/mt c4/mt -k4*(b+d)/mt -c4*(b+d)/mt -(kt+k4)/mt -(c4+ct)/mt];
        Bss=[0 0 0 0;...
            1/mt 0 0 0;...
            0 0 0 0;...
            0 1/m2 0 0;...
            0 0 0 0;...
            0 0 1/I2 0;...
            0 0 0 0;...
            0 0 0 1/mt];
        Css=[k3/m2-k3*a*b/I2 c3/m2-c3*a*b/I2 -(k4+k3)/m2+b*(-k4*(b+d)+k3*a)/I2 -(c3+c4)/m2+b*(-c4*(b+d)+c3*a)/I2 -(-k4*(b+d)+k3*a)/m2+b*(k4*(b+d)^2+k3*a^2)/I2 -(-c4*(b+d)+c3*a)/m2+b*(c4*(b+d)^2+c3*a^2)/I2 k4/m2+k4*b*(b+d)/I2 c4/m2+c4*b*(b+d)/I2];
        Dss=[0 1/m2 -b/I2 0];
        sys1=ss(Ass,Bss,Css,Dss);
        [y,t]=lsim(sys1,Ft,t,[0 0 0 0 0 0 0 0]');
        subplot(212)
        plot(t,y);
        axis([10 20 -6 6]);
        grid on
        xlabel('tiempo');
        ylabel('ddq1 (m/s2)');
        disp('Maxima aceleracion en q1(m/s2):');
        max(abs(y(ndt:end)))