% ELEC3104 lab2q2
clear
close all
clc
N = 250;
Fs = 4000;
theta1 = 0.5*pi;
theta2 = 0.7*pi;
theta3 = 0.8*pi;
A1 = 10;
A2 = 10;
A3 = 10;
y1 = [1:N+2];
y2 = [1:N+2];
y3 = [1:N+2];
y1(1) = A1;
y2(1) = A2;
y3(1) = A3;
y1(2) = A1*cos(theta1);
y2(2) = A2*cos(theta2);
y3(2) = A3*cos(theta3);
for i = 3:N+2
    y1(i) = 2*cos(theta1)*y1(i-1)-y1(i-2);
    y2(i) = 2*cos(theta2)*y2(i-1)-y2(i-2);
    y3(i) = 2*cos(theta3)*y3(i-1)-y3(i-2);
end
figure()
subplot(4,1,1)
plot([1:N+2],y1)
title('y1');
subplot(4,1,2)
plot([1:N+2],y2)
title('y2');
subplot(4,1,3)
plot([1:N+2],y3)
title('y3');
subplot(4,1,4)
plot([1:N+2],y1+y2+y3);
title('y1+y2+y3');
%To implement Notch filter
xN = [1:N+2];
yN = [1:N+2];
xN = y1+y2+y3;

for i = 3:N+2
    
   yN(i) =  1.874*cos(0.7*pi)*yN(i-1)-0.878*yN(i-2)+xN(i)+xN(i-2)-2*cos(0.7*pi)*xN(i-1);
    
end
figure()
magnitudeRes = abs(fft(yN));
mid = round(length(yN)/2);
subplot(2,1,1)
Y = y1+y2+y3;
Y = abs(fft(Y));
plot([0:0.5*Fs/(mid-1):0.5*Fs],Y(1:mid))
title('Before Notch filter')
xlabel('Frequency')
ylabel('Magnitude')
subplot(2,1,2)
plot([0:0.5*Fs/(mid-1):0.5*Fs],magnitudeRes(1:mid))
title('After Notch filter')
xlabel('Frequency')
ylabel('Magnitude')