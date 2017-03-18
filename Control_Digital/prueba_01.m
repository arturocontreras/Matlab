clear all;close all;clc
A=[0.8 0.5;-0.4 0.3];
B=[0.6;0.6];
C=[1 0.5];
D=0;
[n,d]=ss2tf(A,B,C,D);
printsys(n,d,'z');
