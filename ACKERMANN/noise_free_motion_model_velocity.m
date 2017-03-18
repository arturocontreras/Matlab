function [xp] = noise_free_motion_model_velocity(x, u, dt)
% NOISE_FREE_MOTION_MODEL_VELOCITY Implementa el algoritmo de movimiento
%                                  del robot libre de ruido 
%
% SALIDAS
%     xp: Nueva configuracion del robot
% xc, yc: Coordenadas del centro del circulo de rotacion
%      r: Radio del circulo de rotacion
%      f: Flag(1: Movimiento Rot+Tras, 0: Traslacional puro)
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


%--------------------------------------------------------------------------
% 2. CALCULO DE LA NUEVA CONFIGURACION
%--------------------------------------------------------------------------

    
% 2.1. Calculo de la nueva configuracion
xx_p = xx + dt*v*cos(theta + phi);
yy_p = yy + dt*v*sin(theta + phi);
theta_p = theta + dt*(v/B)*sin(phi);

    
%--------------------------------------------------------------------------
% 3. SETEAMOS LA NUEVA CONFIGURACION
%--------------------------------------------------------------------------
%  3.1. NOS ASEGURAMOS QUE LA ORIENTACION ESTE EN EL RANGO [-pi pi]
theta_p = pi_to_pi(theta_p);
%  3.2. SETEAMOS LA NUEVA CONFIGURACION
xp = [xx_p; yy_p; theta_p];


end
