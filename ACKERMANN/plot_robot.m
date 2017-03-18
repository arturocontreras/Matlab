function plot_robot(x, B , color)

%-------------------------------------------------------------------------
% CHEQUEO DE ARGUMENTOS
%-------------------------------------------------------------------------

if nargin < 2
    error('PLOT_ROBOT: Numero insuficiente de argumentos')
end

if length(x) ~= 3
    error('PLOT_ROBOT: La configuracion debe ser de dimension 3')
end

if nargin < 3
    color = '-b';
end


%-------------------------------------------------------------------------
% CONFIGURACION DEL ROBOT
%-------------------------------------------------------------------------

xx = x(1);
yy = x(2);
theta = x(3);

if(theta > pi || theta <= -pi)
    error('PLOT_ROBOT: El angulo theta no esta en el rango valido')
end

%-------------------------------------------------------------------------
% PLOTEAMOS EL ROBOT
%-------------------------------------------------------------------------

p1 = [xx;yy];
p1d = [p1(1)+(B/2)*cos(theta-pi/2);p1(2)+(B/2)*sin(theta-pi/2)];
p1i = [p1(1)-(B/2)*cos(theta-pi/2);p1(2)-(B/2)*sin(theta-pi/2)];
p2 = [xx-B*cos(theta);yy-B*sin(theta)];
p2d = [p2(1)+(B/2)*cos(theta-pi/2);p2(2)+(B/2)*sin(theta-pi/2)];
p2i = [p2(1)-(B/2)*cos(theta-pi/2);p2(2)-(B/2)*sin(theta-pi/2)];

x_c = [p1(1) p2(1) NaN p1d(1) p1i(1) NaN p2d(1) p2i(1)];
y_c = [p1(2) p2(2) NaN p1d(2) p1i(2) NaN p2d(2) p2i(2)];

plot(x_c, y_c, color, 'LineWidth', 4)

end
