function y = dqat(h,w,tau,Lamda,V,t)
ni=size(t,2);
for i=1:ni
if (t(i)>=tau+10) && (t(i)<=(tau+2*Lamda/V+10))
    y(i) = -h*w/2*sin(w*t(i)-tau);
else
    y(i)=0;
end
end