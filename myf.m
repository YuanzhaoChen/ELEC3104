clc
close all
clear
theta1 =0.5*pi;
b = fir1(50,[0.3 0.65]);
freqz(b,1,512)

b = [1 -2*cos(0.7*pi) 1];
a = [1 0.878 -1.874*cos(0.7*pi)];
figure()
freqz(b,a,1000)

b = [1 -cos(theta1)];
a = [1 -2*cos(theta1) 1];
figure()
freqz(b,a,1000)

%------------------
z1 = [1 0.95*1];
z2 = [1 0.95*-1];
z3 = [1 0.95*j];
z4 = [1 0.95*-j];
p1 = [1 0.995*exp(j*pi/4)];
p2 = [1 0.995*exp(j*3*pi/4)];
p3 = [1 0.995*exp(-j*pi/4)];
p4 = [1 0.995*exp(-j*3*pi/4)];
z = conv(conv(conv(z1,z2),z3),z4);
p = conv(conv(conv(p1,p2),p3),p4);
figure()
freqz(z,p,1000)
figure(4)