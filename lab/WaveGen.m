%Generate wave file
clc
clear
close all
Fs = 16000;
t = [0:(1/Fs):10];
f1 = 1000;
f2 = 2500;
f3 = 3500;
f4 = 5000;
f5 = 7000;
y = sin(2*pi*f1*t)+sin(2*pi*f2*t)+sin(2*pi*f3*t)+sin(2*pi*f4*t) + sin(2*pi*f5*t); 
plot(y);
audiowrite('sample2.wav',y,Fs);
%sound(y,Fs)
clear playsnd