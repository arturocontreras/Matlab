%%estudio numeros flotantes:
%-------------GPS-LATITUD-LONGITUD---------------------------
N= 1.275938490000000e+004 %S
Nh=07655.6331 %W

%paso desintegracion:
a=fix(N/100)
b=fix(N-a*100)
c=fix(N*100-(a*10000+b*100))
d=N*10000-(a*1000000+b*10000+c*100)

%paso de integracion:
%N=F(a,b,c,d)

N1=a*100+b+c/100+d/10000
N2=a+b/100+c/10000+d/1000000