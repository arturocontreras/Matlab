function plot_robot(x, L , color, NN)

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

if nargin < 4
    NN = 24;
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

ang = linspace(0, 2*pi, NN)';
x_circle = xx*ones(NN,1) + L*cos(ang);
y_circle = yy*ones(NN,1) + L*sin(ang);

plot(x_circle, y_circle, color, 'LineWidth', 2)
hold on

%-------------------------------------------------------------------------
% PLOTEAMOS LA LINEA QUE INDICA LA DIRECCION
%-------------------------------------------------------------------------

xf = xx + L*cos(theta);
yf = yy + L*sin(theta);
plot([xx xf], [yy yf], color, 'LineWidth', 2)

end