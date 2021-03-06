function xp = sample_motion_model_velocity(x, u, dt, alpha)
% SAMPLE_MOTION_MODEL_VELOCITY Implementa el algoritmo de movimiento
%                                  del robot libre de ruido 
%
% SALIDAS
%     xp: Nueva configuracion del robot
% 
% ENTRADAS
%      x: Configuracion del robot
%      u: Vector de controles [v; w]
%     dt: Delta de tiempo(seg)

global B

%--------------------------------------------------------------------------
% 1. CONFIGURACION INICIAL
%--------------------------------------------------------------------------
%  1.1. LEEMOS LOS COMPONENTES DE LA CONFIGURACION
%   -> Posicion
xx = x(1);
yy = x(2);
%   -> Orientacion
theta = x(3);
if(theta > pi || theta <= -pi)
    error('SAMPLE_MOTION_MODEL_VELOCITY: El angulo theta no esta en el rango')
end

%  1.1. LEEMOS LAS VELOCIDADES
v = u(1);
phi = u(2);

%  1.2. LEEMOS ALPHA
a1 = alpha(1);
a2 = alpha(2);
a3 = alpha(3);
a4 = alpha(4);
a5 = alpha(5);
a6 = alpha(6);

%--------------------------------------------------------------------------
% 2. CALCULO DE LA NUEVA CONFIGURACION
%--------------------------------------------------------------------------
sigma_v = a1*v^2 + a2*phi^2;
sigma_phi = a3*v^2 + a4*phi^2;
sigma_g = a5*v^2 + a6*phi^2;

vr = v + sqrt(sigma_v)*randn(1);
phir = phi + sqrt(sigma_phi)*randn(1);
gr = sqrt(sigma_g)*randn(1);

    
% 2.1. Calculo de la nueva configuracion
xx_p = xx + dt*vr*cos(theta + phir);
yy_p = yy + dt*vr*sin(theta + phir);
theta_p = theta + dt*(v/B)*sin(phir) + gr;      

%--------------------------------------------------------------------------
% 3. SETEAMOS LA NUEVA CONFIGURACION
%--------------------------------------------------------------------------
%  3.1. NOS ASEGURAMOS QUE LA ORIENTACION ESTE EN EL RANGO [-pi pi]
theta_p = pi_to_pi(theta_p);
%  3.2. SETEAMOS LA NUEVA CONFIGURACION
xp = [xx_p; yy_p; theta_p];

end
