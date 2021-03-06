clear all;
close all;
clc;
%% Valores Iniciales
x1=0:0.1:10;
tx=size(x1,2);
dx=(rand(1,tx)-0.5);
x2=x1+dx;
y=3*x1+2;
plot(x2,y,'o');
hold on
plot(x1,y,'k');
%% GA
long_caden=2;
%Se configua el Algoritmo definiendo par�metros 
%an�logos en la Gen�tica
generaciones = 60; % iteraciones del algoritmo
n = 30;            % tama�o de la poblaci�n de soluciones par
probabilidad = 0.2; % probabilidad de que cada gen mute
mutacion = 1*ones(1,long_caden);   % m�ximo valor que puede mutar

%Sea una funcion de la forma y=ax+b, hallar [a,b]
poblacion=(1*rand(n,long_caden));

%La poblaci�n de soluciones evoluciona mediante 
%la cruza y mutaci�n
s = n;

hw = waitbar(0,'Evolucionando...');
for i = 1:generaciones
%% Orden aleatorio de parejas
poblacion(:,long_caden+1) = rand(s,1);
poblacion = sortrows(poblacion,long_caden+1);

    %% Cruce
    pos_caract1=floor((long_caden)*rand(1,1))+1; %50 caracteres transferidos
    pos_caract2=floor((long_caden)*rand(1,1))+1;
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
        y1=poblacion(j,1)*x1+poblacion(j,2);
        err=abs(y-y1);
        err=norm(err)/tx;
        poblacion(j,long_caden+1)=err;
    end
    %% Seleccion
    poblacion = unique(poblacion,'rows');
    poblacion = sortrows(poblacion,long_caden+1);
    s = min([size(poblacion,1),n]);
    poblacion = poblacion(1:s,:);
    waitbar(i/generaciones,hw)
end
close(hw)

%% Aplicando Regresion por minimos cuadrados
    coef_regr=polyfit(x2,y,1)
    poblacion(1,1:2)
    y2=coef_regr(1,1)*x1+coef_regr(1,2);
    err_regr=abs(y-y2);
    err_regr=norm(err_regr)
    y1=poblacion(1,1)*x1+poblacion(1,2);
    err_ga=abs(y-y1);
    err_ga=norm(err_ga)