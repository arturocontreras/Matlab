function Zm = tras_rot( Z,C,tt )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Zm=C+Z*[cosd(tt) sind(tt);-sind(tt) cosd(tt)]; %Z modificado
end

