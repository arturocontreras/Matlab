function [zn,z] = range_bearing_model(x, landmarks_map, std_sensor)


%--------------------------------------------------------------------------
% 1. CONFIGURACION INICIAL
%--------------------------------------------------------------------------
%  1.1 CONFIGURACION DEL ROBOT
xx = x(1);
yy = x(2);
theta = x(3);

%  1.2 CONFIGURACION DE LA MARCA
mx = landmarks_map(1);
my = landmarks_map(2);
ms = landmarks_map(3);

%  1.3 RUIDOS
sigmaR = std_sensor(1);
sigmaB = std_sensor(2);
sigmaS = std_sensor(3);

%--------------------------------------------------------------------------
% 2. CALCULOS
%--------------------------------------------------------------------------
%  2.1 ELEMENTOS DE Z
r = sqrt((mx-xx)^2+(my-yy)^2) + sigmaR*randn(1);
phi = atan2(my - yy, mx - xx) - theta + sigmaB*randn(1);
s = ms + sigmaS*randn(1);
%  2.2 PHI NORMALIZADO
phi_n = pi_to_pi(phi);

%  2.2 CONSTRUCCION DE Z
zn = [r; phi_n; s];
z = [r; phi; s];

end