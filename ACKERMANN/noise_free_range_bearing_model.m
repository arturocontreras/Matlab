function [zn, z] = noise_free_range_bearing_model(x, landmarks_map)

xx = x(1);
yy = x(2);
theta = x(3);

mx = landmarks_map(1);
my = landmarks_map(2);
ms = landmarks_map(3);

r = sqrt((mx-xx)^2+(my-yy)^2);
phi = atan2(my - yy, mx - xx) - theta;
s = ms;
phi_n = pi_to_pi(phi);

zn = [r; phi_n; s];
z = [r; phi; s];

end