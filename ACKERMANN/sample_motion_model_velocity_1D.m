function xp = sample_motion_model_velocity_1D(x, u, dt, alpha)
var = alpha*u^2;
v = u;
v_real = v + sqrt(var)*randn(1);
xp = x + v_real*dt;

end