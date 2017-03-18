function p = landmark_model_known_correspondence(z,x,landmark,std_sensor)

%--------------------------------------------------------------------------
% 1. CONFIGURACION INICIAL
%--------------------------------------------------------------------------
%  1.1 MEDIDA DE LA REFERENCIA
r = z(1);
phi = z(2);
s = z(3);

%  1.2 CONFIGURACION DEL ROBOT
xx = x(1);
yy = x(2);
theta = x(3);

%  1.3 CONFIGURACION DE LA MARCA
mx = landmark(1);
my = landmark(2);
ms = landmark(3);

%  1.4 RUIDOS
sigmaR = std_sensor(1);
sigmaB = std_sensor(2);
sigmaS = std_sensor(3);

%--------------------------------------------------------------------------
% 2. CALCULOS
%--------------------------------------------------------------------------
r_esp = sqrt((mx-xx)^2+(my-yy)^2);
phi_esp = atan2(my - yy, mx - xx) - theta;
phi_esp = pi_to_pi(phi_esp);
s_esp = ms;

error_r = r - r_esp;
error_phi = phi - phi_esp;
error_s = s - s_esp;

p_r = gauss_1D(0, sigmaR, error_r);
p_phi = gauss_1D(0, sigmaB, error_phi);
p_s = gauss_1D(0, sigmaS, error_s);

p = p_r*p_phi*p_s;

end