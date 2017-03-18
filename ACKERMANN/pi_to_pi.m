function angle = pi_to_pi(angle)

%-------------------------------------------------------------------------
% NORMALIZAMOS AL INTERVALO [-2*pi, 2*pi]
%-------------------------------------------------------------------------

twopi = 2*pi;
angle = angle - twopi*fix(angle/twopi);

%-------------------------------------------------------------------------
% NORMALIZAMOS AL INTERVALO [-pi, pi]
%-------------------------------------------------------------------------

% PARA ANGULOS 'angle > pi'
i = find(angle > pi);
angle(i) = angle(i) - twopi;

% PARA ANGULOS 'angle < -pi'
i = find(angle <= -pi);
angle(i) = angle(i) + twopi;

end