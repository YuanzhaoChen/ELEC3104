%ELEC3104 lab2q3
clc
close all
clear
N = 300;
%assume input is dirac delta
x = zeros(1,N+2);
x(3) = 1;
%---------------implement Hap(z)----------
yap = [1:N+2];
%no output before giving an input 
yap(1) = 0;
yap(2) = 0;
for i = 3:N+2
    yap(i) = 0.5*x(i)+x(i-1)+x(i-2)-yap(i-1)-0.5*yap(i-2);
end
Yap = abs(fft(yap));
X = abs(fft(x));
Hap = Yap./X;
plot(0:2*pi/(length(Hap)-1):2*pi,20*log(Hap))
axis([0 2*pi -1 1])
xlabel('theta');
ylabel('Magnitude(dB)')
title('Hap(z)')
%--------------------------------------------

%--------------implement Hm(z)--------------
ym = [1:N+2];
%no output before giving an input
ym(1) = 0;
ym(2) = 0;
for i = 3:N+2
    ym(i) = 2*x(i)+2*x(i-1)+x(i-2)+1.4*ym(i-1)-0.5525*ym(i-2); 
end
Ym = abs(fft(ym));
Hm = Ym./X;
figure()
plot(0:2*pi/(length(Hm)-1):2*pi,20*log(Hm))
xlabel('theta');
ylabel('Magnitude(dB)')
title('Hm(z)')
% --------------------------------------------

%--------------implement H(z)-----------------
y = [1:N+2];
y(1) = 0;
y(2) = 0;
for i = 3:N+2 
    y(i) = x(i)+2*x(i-1)+2*x(i-2)+1.4*y(i-1)-0.5525*y(i-2);
end
Y = abs(fft(y));
H = Y./X;
figure()
plot(0:2*pi/(length(H)-1):2*pi,20*log(H))
xlabel('theta');
ylabel('Magnitude(dB)')
title('H(z)')

%---------------------------------------------