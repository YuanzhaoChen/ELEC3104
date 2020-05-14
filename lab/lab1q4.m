%ELEC3104 LAB1 QUESTION 4
close all
clear
clc

samples = 1000;
f1 = 50;
f2 = 150;
fc = 3000;
fs = 10000;
n = [0:samples-1];
x = [0:samples-1];
xc = [0:samples-1];
xam = [0:samples-1];
theta = [-pi:2*pi/999:pi]
for i=1:length(n)
   x(i) = cos(2*pi*f1*i/fs);
   xc(i) = cos(2*pi*fc*i/fs);
   xam(i) = x(i)*xc(i);
end

figure(1)
subplot(2,2,1)
plot(0:499,x(1:500))
title('x[n]')
subplot(2,2,2)
plot(0:499,xc(1:500))
title('xc[n]')
subplot(2,2,3)
plot(0:499,xam(1:500))
title('xam')

