function [muc, Pc] = EKF_Update_step(mup, Pp, z, lm, std_sensor)
% EKF_UPDATE_STEP Performs the update step
%
% DESCRIPTION
%
%  This function computes the "correction or update step" of the EKF-
%  Localization filter

%--------------------------------------------------------------------------
% 2. CONFIGURACION INICIAL
%--------------------------------------------------------------------------
%  2.1. DESVIACIONES ESTANDAR DEL SENSOR
sigmaR = std_sensor(1);
sigmaB = std_sensor(2);
sigmaS = std_sensor(3);

%  2.2. MATRIZ Q
Q = [sigmaR       0           0;
        0       sigmaB        0;
        0           0       sigmaS];
    

%--------------------------------------------------------------------------
% 3. CODIGO PRINCIPAL
%--------------------------------------------------------------------------
%  3.1. COORDENADAS DE LA REFERENCIA QUE CORRESPONDE A LA MEDIA
mx = lm(1);
my = lm(2);
ms = lm(3);
q = (my - mup(2))^2 + (mx - mup(1))^2;

%  3.2. MEDIDA ESPERADA "PREDECIDA" POR EL ROBOT
zpred = [sqrt(q);
         atan2(my - mup(2), mx - mup(1)) - mup(3);
         ms];
zpred(2) = pi_to_pi(zpred(2));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% zpred = noise_free_range_bearing_model(mup, lm);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%

%  3.3. CALCULO DE LA MATRIZ JACOBIANA H
if(q == 0)
    disp('Cuidado con H')
    H = [0  0   0;
         0  0  -1;
         0  0   0];
else
    H = [-(mx - mup(1))/sqrt(q)     -(my - mup(2))/sqrt(q)      0;
            (my - mup(2))/q            -(mx - mup(1))/q         -1;
                    0                       0                   0];                
end

%  3.4. CALCULO DE LA MATRIZ "S"
PHt = Pp*H';
S = H*PHt + Q;

%  3.5. GANANCIA DE KALMAN
K = PHt*inv(S);

%  3.6. VECTOR DE INNOVACION - ERROR EN LAS MEDIDAS
v = z - zpred;
v(2) = pi_to_pi(v(2));

%  3.7. CORRECCION
%   -> Corregimos la media
muc = mup + K*v;
muc(3) = pi_to_pi(muc(3));
%   -> Corregimos la covarianza
Pc = (eye(3) - K*H)*Pp;

end