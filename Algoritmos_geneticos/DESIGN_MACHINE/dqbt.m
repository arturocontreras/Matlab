function y = dqbt(h,w,Lamda,V,t)
ni=size(t,2);
for i=1:ni
if (t(i)>=10) && (t(i)<=(2*Lamda/V+10))
    y(i) = -h*w/2*sin(w*t(i));
else
    y(i)=0;
end
end