%ELEC3104 lab3q4
clc
clear
close all
order = 300;
f1 = fir1(order,[0.301 0.304]);
f2 = fir1(order,[0.333 0.335]);
f3 = fir1(order,[0.368 0.371]);
f4 = fir1(order,[0.173 0.176]);
f5 = fir1(order,[0.191 0.194]);
f6 = fir1(order,[0.212 0.214]);
f7 = fir1(order,[0.234 0.237]);

F1 = freqz(f1,1,1000);
F2 = freqz(f2,1,1000);
F3 = freqz(f3,1,1000);
F4 = freqz(f4,1,1000);
F5 = freqz(f5,1,1000);
F6 = freqz(f6,1,1000);
F7 = freqz(f7,1,1000);
figure()
plot([1:length(F1)],abs(F1));
hold on
plot([1:length(F2)],abs(F2));
plot([1:length(F3)],abs(F3));
plot([1:length(F4)],abs(F4));
plot([1:length(F5)],abs(F5));
plot([1:length(F6)],abs(F6));
plot([1:length(F7)],abs(F7));
