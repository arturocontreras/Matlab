clear all;close all;clc

tau=0.5;
T=tau/5;
Gc=tf(2,[tau 1]);
Gd=c2d(Gc,T,'zoh')
Fd=feedback(Gd,1);
Fc=feedback(Gc,1);
tk=0:T:1;
t=0:0.01:1;
yd=step(Fd,tk);
yc=step(Fc,t);
subplot(211)
stairs(tk,yd,'k','LineWidth',1.5),hold
plot(t,yc,'k'),legend('TD','TC',4)



