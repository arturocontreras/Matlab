%% ARQUITECTURA DE LA RED
%P = R x Q1 matrix of Q1 sample R-element input vectors
%T=	SN x Q2 matrix of Q2 sample SN-element target vectors
%[numvar_P,numdatos_p]=size(P);
P=data(1:numobs,1:numvars-4);
%x=P;
P=P';
Ts=data(1:numobs,numvars-3:numvars);
%y=Ts;
Ts=Ts';
num_neuron_co=51;
%num_neuron_co2=30;
%W1=rand(51,numvars-4+1);%30 neuronas -> salida=30x1
%W2=rand(4,52);%4 neuronas -> salida 4x1
%T2=rand(1,numobs);
long_caden=num_neuron_co*(numvars-4+1)+4*(num_neuron_co+1);
% long_caden=num_neuron_co*(numvars-4+1)+4*(num_neuron_co2+1)+(num_neuron_co+1)*num_neuron_co2;
%Se configua el Algoritmo definiendo parámetros 
%análogos en la Genética
generaciones = 100; % iteraciones del algoritmo
n = 200;            % tamaño de la población de soluciones par
probabilidad = 0.65; % probabilidad de que cada gen mute
mutacion = ones(1,long_caden);   % máximo valor que puede mutar

%Se genera aleatoriamente una población inicial 
%de posibles soluciones. La primer columna representa 
%el gen que define la pendiente m de la recta. 
%La segunda columna representa el gen que define 
%la ordenada al origen b. Cada uno de los n 
%individuos (renglones) representa una posible solución.
%poblacion = rand(n,2);

poblacion=5*(2*rand(n,long_caden)-1);

%La población de soluciones evoluciona mediante 
%la cruza y mutación
s = n;

hw = waitbar(0,'Evolucionando...');
for i = 1:generaciones
%% Orden aleatorio de parejas
poblacion(:,long_caden+1) = rand(s,1);
poblacion = sortrows(poblacion,long_caden+1);
% rev
    %% Cruza
%    poblacion=[poblacion; poblacion(1:2:end-1,1) poblacion(2:2:end,2)
%    zeros(fix(s/2),1); poblacion(2:2:end,1) poblacion(1:2:end-1,2) zeros(fix(s/2),1)];
    pos_caract1=floor((long_caden-1)*rand(1,250))+1; %50 caracteres transferidos
    pos_caract2=floor((long_caden-1)*rand(1,250))+1;
    comb1=poblacion(1:2:end,:);
    comb2=poblacion(2:2:end,:);
    comb1(:,pos_caract1)=poblacion(2:2:end,pos_caract1);
    comb1(:,pos_caract1)=poblacion(2:2:end,pos_caract2);
    comb2(:,pos_caract2)=poblacion(1:2:end,pos_caract1);
    comb2(:,pos_caract2)=poblacion(1:2:end,pos_caract2);
    poblacion=[poblacion;comb1;comb2];
    %rev
    %% Mutacion
    s = size(poblacion,1);
    poblacion=[poblacion; poblacion+[5*(rand(s,long_caden+1)<probabilidad).*(rand(s,long_caden+1)*2-1).*repmat([mutacion 0],s,1)]];
    %rev
    %% Cálculo de la aptitud (o viabilidad)
    % La tercer columna de poblacion representa la aptitud (viabilidad) de
    % la solución, menor es mejor.
    s = size(poblacion,1);
    
%     m = repmat(poblacion(:,1),1,100);
%     b = repmat(poblacion(:,2),1,100);
%     X = repmat(x,s,1);
%     Y = repmat(y,s,1);

    for j=1:s
        [W1,W2]=conver_vec_matrs(poblacion,j,num_neuron_co,26,4,num_neuron_co+1);
        % Funcion de activacion de la red
        n1=layer_nn_logsig(P,W1);
        Y2=layer_nn_purelin(n1,W2);
        Err1=abs(Ts-Y2);
        Err=(max(Err1));
        poblacion(j,long_caden+1)=sum(Err);
    end
    %% Seleccion
    poblacion = unique(poblacion,'rows');
    poblacion = sortrows(poblacion,long_caden+1);
    err_ini_max(i)=poblacion(1,long_caden+1);
    s = min([size(poblacion,1),n]);
    poblacion = poblacion(1:s,:);
    waitbar(i/generaciones,hw)
end
close(hw)
%Se compara el resultado obtenido con 
%AG contra el obtenido con mínimos cuadrados
error_ag = poblacion(1,long_caden+1)
[W1,W2]=conver_vec_matrs(poblacion,1,num_neuron_co,26,4,num_neuron_co+1);
% Funcion de activacion de la red
n1=layer_nn_logsig(P,W1);
Y2=layer_nn_purelin(n1,W2);
Err1=abs(Ts-Y2);
Err=(max(Err1))*100;
stem(Err)
figure
plot(1:generaciones,err_ini_max)
clear long_caden generaciones n probabilidad mutacion s pos_caract1;
clear comb1 comb2 num_neuron_co j hw n1 pos_caract2;
% p = polyfit(x,y,1);
% y3 = polyval(p,x);
% error_mc = sum(abs(y3-y));
% plot(x,y,'.',x,polyval(poblacion(1,1:2),x),x,y3,':')
% axis([0 100 -0.5 1.5])
% legend('Datos Sintéticos','Algoritmos Genéticos (AG)','Mínimos Cuadrados (MC)')
% text(1,-.167,['AG: Error = ' num2str(error_ag) ', m = ' num2str(poblacion(1,1)) ', b = ' num2str(poblacion(1,2))])
% text(1,-.333,['MC: Error = ' num2str(error_mc) ', m = ' num2str(p(1)) ', b = ' num2str(p(2))])