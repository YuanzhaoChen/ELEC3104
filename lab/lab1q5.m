%ELEC3104 LAB1 QUESTION 5
close all
clear
clc
samples = 500;
n = [0:samples];
x1 = [0:samples];
x2 = [0:samples];
y1 = [0:samples];
for i = 1:length(n)
   x1(i) = 5*(heaviside(i) - heaviside(i-20));
   x2(i) = sin(pi*i/25)*( heaviside(i) - heaviside(i-100) ); 
end

for i = 2:length(n)
   y1(i) = x1(i) - x1(i-1) ;
   y2(i) = x2(i) - x2(i-1); 
end
figure(1)
plot(n,x1)
hold on
plot(n,y1)
hold off
legend('value of x','value of y')
figure(2)
plot(n,x2)
hold on
plot(n,y2)
hold off
legend('value of x','value of y')