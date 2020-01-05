%ELEC3104 lab2q6
clc
close all
clear
N = 300;
A = 2;
theta = 0.05 *pi;
x = zeros(1,N+2);
%impules
x(2) = 1;
y = [1:N+2];
%y(1) = 0;
y(2) = A*cos(theta);
y(2) = 0;
for i=3:N+2
    y(i) = A*x(i)-A*cos(theta)*x(i-1)+2*cos(theta)*y(i-1)-y(i-2);
end
figure()
plot([1:N+2],y);