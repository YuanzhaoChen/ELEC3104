%ELEC3104 lab1q4B
clc
clear all

typeSample = 'specify sample quantity\n';
samples = input(typeSample);
f1 = 50;
f2 =150;
fc = 3000;
Fs = 10000;
theta = [0:pi/(samples-1):pi];
for i = 1:samples
    
   x(i) = cos(2*pi*f1*i/Fs)+cos(2*pi*f2*i/Fs);
   xc(i) = cos(2*pi*fc*i/Fs);
   xam(i) = x(i)*xc(i); 
    
end
xDTFT = [1:length(theta)];
xcDTFT = [1:length(theta)];
xamDTFT = [1:length(theta)];
for i = 1:samples
    xDTFT(i) = 0;
    xcDTFT(i) = 0;
    xamDTFT(i) = 0;
   for k = 1:samples
       xDTFT(i) = xDTFT(i) + x(k)*exp(-j*theta(i)*k);
       xcDTFT(i) = xcDTFT(i) + xc(k)*exp(-j*theta(i)*k);
       xamDTFT(i) = xamDTFT(i) + xam(k)*exp(-j*theta(i)*k);
       
   end
    
end
figure()
subplot(3,1,1)
plot(theta,abs(xDTFT))
subplot(3,1,2)
plot(theta,abs(xcDTFT))
subplot(3,1,3)
plot(theta,abs(xamDTFT))

