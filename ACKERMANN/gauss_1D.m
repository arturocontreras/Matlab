function y = gauss_1D(mu, var, x)

%-------------------------------------------------------------------------
% CONFIGURACION INICIAL
%-------------------------------------------------------------------------
N = size(x,1);

if (var < 1e-20)
    var = 1e-20;
end

%-------------------------------------------------------------------------
% CALCULAMOS VALORES DE LAS PROBABILIDADES
%-------------------------------------------------------------------------

% CALCULAMOS EL TERMINO EXPONENCIAL

y=exp(-0.5*((x-ones(N,1)*mu).^2)./var);

% AÑADIMOS EL FACTOR DE NORMALIZACION

y= y./sqrt((2*pi*var));

end