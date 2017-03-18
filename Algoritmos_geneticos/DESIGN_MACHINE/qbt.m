function y = qbt(h,w,Lamda,V,t)
ni=size(t,2);
for i=1:ni
if (t(i)>=10) && (t(i)<=(2*Lamda/V+10))
    y(i) = h/2*(cos(w*t(i))-1);
else
    y(i)=0;
end
end