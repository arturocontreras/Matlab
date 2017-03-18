function [mup, Pp] = EKF_Prediction_step(mu, P, u, alpha_VELOCITY, dt)
%EKF_PREDICTION_VELOCITY Performs the predicion step

global B

%--------------------------------------------------------------------------
% 2. INITIAL CONFIGURATION
%--------------------------------------------------------------------------
%  2.1. GET THE CONTROLS
v = u(1);
phi = u(2);

%  2.2. GET THE ANGLE
theta = mu(3);


%  2.3. ALPHAS
alpha1 = alpha_VELOCITY(1);
alpha2 = alpha_VELOCITY(2);
alpha3 = alpha_VELOCITY(3);
alpha4 = alpha_VELOCITY(4);

%--------------------------------------------------------------------------
% 3. COMPUTE THE PREDICTED MEAN AT TIME "t"
%   -> We also get in "f" the kind of motion
%--------------------------------------------------------------------------
mup = noise_free_motion_model_velocity(mu, u, dt);   

%--------------------------------------------------------------------------
% 4. COMPUTE THE JACOBIANS NEEDED FOR THE LINARIARIZED MODEL
%--------------------------------------------------------------------------

    
G = [1  0   -v*dt*sin(theta+phi);
    0  1    v*dt*cos(theta+phi);
    0  0                 1];

V = [dt*cos(theta+phi)  -dt*v*sin(theta+phi);
     dt*sin(theta+phi)   dt*v*cos(theta+phi);
     dt*(1/B)*sin(phi)   dt*(v/B)*cos(phi)];

%--------------------------------------------------------------------------
% 5. COMPUTE THE PREDICTED COVARIANCE
%--------------------------------------------------------------------------
%  5.1. Compute the covariance matrix of the noise in control space

     
M = [alpha1*v^2+alpha2*phi^2                  0;
         0                      alpha3*v^2+alpha4*phi^2];
     
Pp = G*P*G' + V*M*V';


end