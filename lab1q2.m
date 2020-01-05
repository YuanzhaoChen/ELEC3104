%ELEC3104 LAB1 QUESTION 2
clear 
close all
clc
clear sound
N = 1000;
commands = 'specify the the sampling rate\n';
Fs = input(commands);
f1 = 700;
f2 = 1000;
f3 = 3000;
y = [1:N];
for i=1:N
    
   y(i) = 0.94*cos(2*pi*(f1/Fs)*i)+0.89*cos(2*pi*(f2/Fs)*i)+0.55*cos(2*pi*(f3/Fs)*i);
     
end
% find magnitude
M = 300; % length of yDTFT
theta = [0:pi/(M-1):pi];
yDTFT =[1:M];
for i = 1:length(yDTFT)
    yDTFT(i) = 0; %initialize
    for k = 1:N 
        
       yDTFT(i) = yDTFT(i) + exp(-j*theta(i)*k)*y(k);
       
    end
    
end
%plot magnitude 
plot(theta,abs(yDTFT));
%sound(y)