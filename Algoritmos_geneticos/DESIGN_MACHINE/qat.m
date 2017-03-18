function y = qat(h,w,tau,Lamda,V,t)
ni=size(t,2);
for i=1:ni
if (t(i)>=tau+10) && (t(i)<=(tau+2*Lamda/V+10))
    y(i) = h/2*(cos(w*(t(i)-tau))-1);
else
    y(i)=0;
end
end