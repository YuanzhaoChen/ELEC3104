%ELEC3104 lab2q5
close all
clear
clc
N = 1000; % how many samples
if mod(N,2)==1
   delay =  (N-1)/2;
else
    delay = N/2;
end
delay = delay+1;
hdelay = [1:N];
for  i = 1:N
    if i-delay ==0
       hdelay(i) = 3; 
    else
        hdelay(i) = 4*sin(3*pi*(i-delay)/4)/((i-delay)*pi);
    end
end
H = abs(fft(hdelay));
mid = round(length(H)/2);
figure()
plot(0:pi/(length(1:mid)-1):pi,H(1:mid))
xlabel('theta');
ylabel('|H(theta)|');
grid on
figure()
a  = [-3*pi/4:(3*pi/2)/(N-1):3*pi/4];
A = angle(exp(-j.*a));
plot(a,A)
title('phase response')
xlabel('theta')
ylabel('argH(theta)')
grid on

%figure()
%b = fir1(N,[0.00001 3/4]);
%freqz(b,1,1000);