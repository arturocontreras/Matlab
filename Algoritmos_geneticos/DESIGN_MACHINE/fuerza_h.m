clear all;
close all;
clc;
%% Valores invariables
m1=0.2; m2=5; I2=0.2964; mt=0.4;
ct=10;c3=30;c4=30;         % optimos c3=3169;c4=1918;
kt=50;
h=0.04;l1=0.01;l2=0.2;
a=0.43;b=0.02;d=0.34;
V=10; % 36 km/h
g=9.81;

%% Valores Iniciales
k3=50;k4=50;
L=sqrt(l1^2+l2^2);
w=2*pi*V/L;
tau=(a+b+d)/V;
t=0:0.001:2*L/V+18;
qa=qat(h,w,tau,L,V,t);
dqa=dqat(h,w,tau,L,V,t);
ddqa=ddqat(h,w,tau,L,V,t);
qb=qbt(h,w,L,V,t);
dqb=dqbt(h,w,L,V,t);
ddqb=ddqbt(h,w,L,V,t);
n=size(qa,2);

%% Hallando la aceleracion maxima
% La fuerza horizontal en las ruedas se da por el cambio de pendiente
% en el trayecto, de aca que la aceleracion

ay_max=max(ddqa);
M=(2*mt+m2);
Fx=M*(ay_max+g)*pi*h/L
%plot(ddqa)