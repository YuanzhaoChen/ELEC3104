%ELEC3104 lab2q1
close all
clc
clear all
N = 1:100;
f1 = 0.1;
f2 = 0.13;
a1 = 10;
b1 = 15;
%------- test s2q6a linear -------
x1 = sin(2*pi*N);
x2 = cos(2*pi*N);
y1 = s2q6a(x1);
y2 = s2q6a(x2);
y12 = s2q6a(x1+x2);
figure(1)
plot(N,real(y1+y2),'*');
hold on
plot(N,real(y12),'')
title('s2q6a')
legend('y1+y2','H(x1+x2)')
if any(y12~=(y1+y2)) == 1
   disp('s2q6a is not linear');
else
    disp('s2q6a is linear');
end
%-------------------------------------
%----- test s2q6a time invariant -----
delay = 10;
x1delay = sin(2*pi*(N-delay));
y1delay = s2q6a(x1delay);
figure(2)
%plot y[n-delay]
plot(N+delay,real(y1));
hold on
%plot H(x(n-delay))
plot(N,real(y1delay(N)),'r*');
title('s2q6a')
disp('s2q6a is time invariant')
%-----------------------------------------------
%------------test s2q6b linear------------------
y1 = s2q6b(x1);
y2 = s2q6b(x2);
y12 = s2q6b(x1+x2);
figure(3)
plot(N,y1+y2,'*');
hold on
plot(N,y12)
legend('y1+y2','H(x1+x2)');
title('s2q6b');
disp('s2q6b is linear');
%----------------------------------------------
%----------test s2q6b time invariant-----------
delay = 30;
x2delay = cos(2*pi*(N-delay));
y2delay = s2q6b(x2delay);
figure(4)
plot(N+delay,y2)
hold on
plot(N,real(y2delay),'*')
title('s2q6b');
disp('s2q6b is time variant');

%---------------------- test s2q6c --------------
xc = zeros(1,length(N));
xc(1) = 1;
yc = s2q6c(xc);
figure(5)
plot(N,yc)
hold on
plot(N,xc,'r')
disp('s2q6c is FIR because the output is finite')
legend('y','x')
title('s2q6c')
figure(6)
subplot(2,1,1)
H = fft(yc)./fft(xc);
%H = real(H);
A = angle(H);
plot(0:2*pi/(length(N)-1):2*pi,abs(H))
title('Maginitude')
subplot(2,1,2)
plot(0:2*pi/(length(N)-1):2*pi,A)
title('phase')
%-------------------------------------------------------