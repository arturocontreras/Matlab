function display_circle(x, L , color, NN)

%-------------------------------------------------------------------------
% CHEQUEO DE ARGUMENTOS
%-------------------------------------------------------------------------

if nargin < 2
    error('DISPLAY_CIRCLE: Numero insuficiente de argumentos')
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

%-------------------------------------------------------------------------
% PLOTEAMOS EL ROBOT
%-------------------------------------------------------------------------

ang = linspace(0, 2*pi, NN)';
x_circle = xx*ones(NN,1) + L*cos(ang);
y_circle = yy*ones(NN,1) + L*sin(ang);

plot(x_circle, y_circle, color, 'LineWidth', 2)
hold on

end