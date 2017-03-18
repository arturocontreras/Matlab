function keep = simple_resample(w)


%--------------------------------------------------------------------------
% 1. CONFIGURACION INICIAL
%--------------------------------------------------------------------------
%  1.1. NUMERO DE PARTICULAS
M = length(w);

%  1.2. MATRIZ PARA GUARDAR INDICES DE LAS PARTICULAS
keep = zeros(1,M);

%  1.3. NORMALIZACION DE LOS PESOS
w = w/sum(w);

%--------------------------------------------------------------------------
% 1. CODIGO PRINCIPAL
%--------------------------------------------------------------------------
for m = 1:M
    
    % a. Generamos un numero aleatorio U[0-1]
    r = rand(1);
    
    % b. Calculamos el indice
    c = w(1);
    i = 1;
    while(r > c)
        i = i + 1;
        if( i > M)
            i = 1;
        end
        c = c + w(i);
    end
    
    % c. Guardar resultados
    keep(m) = i;
    
end

end