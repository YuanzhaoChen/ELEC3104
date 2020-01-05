%ELEC3104 lab1 question 3 
clear 
close all
clc
[x,Fs] = audioread('s1_q3d.wav');
x = x';
theta = [0:0.002*pi:pi];
xDTFT = [0:length(theta)-1];
for i = 1:length(theta)
    
    xDTFT(i) = 0;
    
    for n = 0:length(x)-1
        
       xDTFT(i) = xDTFT(i) + x(n+1)*exp(-j*theta(i)*n);
       
    end
    
end
figure()
plot(theta,abs(xDTFT))
xlabel('theta')
ylabel('xDTFT')
title('magntude spectrum of s1_q3d')
f1 = 2100;
f2 = 2298;
N2 = 6000;
Fs  = 6000;
N1 = 5000;
signalModel = [1:length(theta)];
for n = 1:length(signalModel)
    signalModel(n) = cos(2*pi*n*f1/Fs)*(heaviside(n)-heaviside(n-N1))+cos(2*pi*n*f2/Fs)*(heaviside(n-N1)-heaviside(n-N2))+(heaviside(n)-heaviside(n-N1));
end
signalModelDTFT = abs(fft(signalModel));
figure()
plot(theta,signalModelDTFT)
