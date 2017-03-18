%% ARQUITECTURA DE LA RED
%P = R x Q1 matrix of Q1 sample R-element input vectors
%T=	SN x Q2 matrix of Q2 sample SN-element target vectors
P=data(1:numobs,1:numvars-4);
P=P';
Ts=data(1:numobs,numvars-3:numvars);
Ts=Ts';
num_neuron_co=51;

%longitud de la cadena de genes
long_caden=num_neuron_co*(numvars-4+1)+4*(num_neuron_co+1);
generaciones = 600; % iteraciones maxima del algoritmo
n = 200;            % tamaño de la población de soluciones par
probabilidad = 0.6; % probabilidad de que cada gen mute
err_mut=1;
mutacion = ones(1,long_caden);   % máximo valor que puede mutar
porc_gen_transf=40; % porcentaje de genes que se transferiran por cruzamiento

% numero de Genes transferidos
num_gen_transf=floor(porc_gen_transf*long_caden/100);
%poblacion
%poblacion=10*(2*rand(n,long_caden)-1);
s = n;

hw = waitbar(0,'Evolucionando...');
i=1;
while i ~= generaciones
%% Orden aleatorio de parejas
poblacion(:,long_caden+1) = rand(s,1);
poblacion = sortrows(poblacion,long_caden+1);
% rev
    %% Cruza
    pos_caract1=floor((long_caden-1)*rand(1,num_gen_transf))+1; %50 caracteres transferidos
    pos_caract2=floor((long_caden-1)*rand(1,num_gen_transf))+1;
    comb1=poblacion(1:2:end,:);
    comb3=poblacion(1:2:end,:);
    comb2=poblacion(2:2:end,:);
    comb4=poblacion(2:2:end,:);
    %Dos hijos por pareja
    comb1(:,pos_caract1)=poblacion(2:2:end,pos_caract1);
    comb3(:,pos_caract2)=poblacion(2:2:end,pos_caract2);
    comb2(:,pos_caract1)=poblacion(1:2:end,pos_caract1);
    comb4(:,pos_caract2)=poblacion(1:2:end,pos_caract2);
    poblacion=[poblacion;comb1;comb2;comb3;comb4];
    %rev
    %% Mutacion
    s = size(poblacion,1);
    poblacion=[poblacion; poblacion+[err_mut*(rand(s,long_caden+1)<probabilidad).*(rand(s,long_caden+1)*2-1).*repmat([mutacion 0],s,1)]];
    %rev
    %% Cálculo de la aptitud (o viabilidad)
    s = size(poblacion,1);
    for j=1:s
        [W1,W2]=conver_vec_matrs(poblacion,j,num_neuron_co,26,4,num_neuron_co+1);
        % Funcion de activacion de la red
        n1=layer_nn_logsig(P,W1);
        Y2=layer_nn_purelin(n1,W2);
        Err1=abs(Ts-Y2);
        Err=max(Err1);
        poblacion(j,long_caden+1)=max(Err);
    end
    %% Seleccion
    poblacion = unique(poblacion,'rows');
    poblacion = sortrows(poblacion,long_caden+1);
    err_ini_max(i)=poblacion(1,long_caden+1);
    err_temp=100*poblacion(1,long_caden+1);
    s = min([size(poblacion,1),n]);
    poblacion = poblacion(1:s,:);
    waitbar(i/(generaciones),hw)
    i=i+1;
    if err_temp<=1
        i=generaciones;
    end
    if i==200
        err_mut=err_mut/5;
    end
    if i==400
        err_mut=err_mut/2;
    end
    if i==600
        err_mut=err_mut/2;
    end
    if i==800
        err_mut=err_mut/2;
    end
end
%waitbar(1,hw)
close(hw)
i=length(err_ini_max);
error_ag = 100*poblacion(1,long_caden+1)
[W1,W2]=conver_vec_matrs(poblacion,1,num_neuron_co,26,4,num_neuron_co+1);
% Funcion de activacion de la red
n1=layer_nn_logsig(P,W1);
Y2=layer_nn_purelin(n1,W2);
Err1=abs(Ts-Y2);
Err=(max(Err1))*100;
figure
subplot(211)
stem(Err)
subplot(212)
plot(1:i,err_ini_max)
%axis([1 i err_ini_max(i) err_ini_max(1)])
clear long_caden generaciones n probabilidad mutacion s pos_caract1;
clear comb1 comb2 comb3 comb4 num_neuron_co j hw n1 pos_caract2;