function [vlm,Nobs] = get_visible_landmarks(x,mapa,MAX_RANGE)

% OBTENEMOS LA POSICION DEL ROBOT
xx = x(1);
yy = x(2);
theta = x(3);

% NUMERO DE MARCAS TOTAL 
N = size(mapa,2);

% CODIGO PRINCIPAL
vlm = [];
for i = 1:N
    % OBTIENE UNA MARCA
    marca = mapa(:,i);
    xm = marca(1);
    ym = marca(2);        
    r = sqrt((xm-xx)^2+(ym-yy)^2);
    
    PHI = atan2(ym-yy,xm-xx)-theta;
    
    if((r<=MAX_RANGE) && (abs(PHI)<pi/2))
        vlm = [vlm marca];
    end   
end

Nobs = size(vlm,2);

end