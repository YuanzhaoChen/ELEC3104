%ELEC3104 project stage2
%uicontrol
clc
clear 
close all
clear sound
[y,Fs] = audioread('sample.wav'); 
y = y';
% universal passband ripple and stop band attenuation
Rp = 0.4;
Rs = 20;
resolution = 1000;
gain1 = 1;
gain2 = 1;
gain3 = 1;
gain4 = 1;
gain5 = 1;
%-------------1st filter----------
%Normalized frequency
Wp1 = 1500/(Fs/2);
Ws1 = 1700/(Fs/2);
[n1 Wn1] = buttord(Wp1,Ws1,Rp,Rs)
[b1,a1] = butter(n1,Wn1);

b1 = b1*gain1;

figure()
freqz(b1,a1,resolution)
axis([-inf inf -10 5])
%------------2nd filter------------
%Normalized frequency
Wp2 = [1800 3000]/(Fs/2);
Ws2 = [1600 3200]/(Fs/2);
[n2 Wn2]= buttord(Wp2,Ws2,Rp,Rs)
[b2,a2] = butter(n2,Wn2);

b2 = b2*gain2;

figure(1)
hold on
freqz(b2,a2,resolution)
%--------------3rd filter-------------
Wp3 = [3400 4600]/(Fs/2);
Ws3 = [3200 4800]/(Fs/2);
[n3 Wn3]= buttord(Wp3,Ws3,Rp,Rs)
[b3,a3] = butter(n3,Wn3);

b3 = b3*gain3;

freqz(b3,a3,resolution)
%--------------4th filter--------------
Wp4 = [5000 6200]/(Fs/2);
Ws4 = [4800 6400]/(Fs/2);
[n4 Wn4]= buttord(Wp4,Ws4,Rp,Rs)
[b4,a4] = butter(n4,Wn4);

b4 = b4*gain4;

freqz(b4,a4,resolution)
%--------------5th filter--------------
Wp5 = [6600]/(Fs/2);
Ws5 = [6300]/(Fs/2);
[n5 Wn5]= buttord(Wp5,Ws5,Rp,Rs)
[b5,a5] = butter(n5,Wn5,'high');

b5 = b5*gain5;

freqz(b5,a5,resolution)
%--------------------------------------
%---------impliment to 1st filter------
k = length(a1);
m = length(b1);
frac1 = 0;
frac2 = 0;
start = max(k,m)+1;
filt1 = zeros(1,length(y)-start);
for i = start:length(y)
    for p = 1:k
        frac1= frac1 + a1(p)*y(i-p);
    end
    for q = 1:m;
        frac2 = frac2 + b1(q)*filt1(i-q);
    end
        filt1(i) = frac1 + frac2;
end
 %---------------------------------------
 %---------implement 2nd filter----------
k = length(a2);
m = length(b2);
frac1 = 0;
frac2 = 0;
start = max(k,m)+1;
filtY2 = zeros(1,length(y)-start);
for i = start:length(y)
    for p = 1:k
        frac1= frac1 + a2(p)*y(i-p);
    end
    for q = 1:m;
        frac2 = frac2 + b2(q)*filtY2(i-q);
    end
        filtY2(i) = frac1 + frac2;
 end
 %----------------------------------------
 %--------implement 3rd filter------------
k = length(a3);
m = length(b3);
frac1 = 0;
frac2 = 0;
start = max(k,m)+1;
filtY3 = zeros(1,length(y)-start);
for i = start:length(y)
    for p = 1:k
        frac1= frac1 + a3(p)*y(i-p);
    end
    for q = 1:m;
        frac2 = frac2 + b3(q)*filtY3(i-q);
    end
        filtY3(i) = frac1 +frac2;
 end
 %--------------------------------------------
 %----------implement 4th filter--------------
k = length(a4);
m = length(b4);
frac1 = 0;
frac2 = 0;
start = max(k,m)+1;
filtY4 = zeros(1,length(y)-start);
for i = start:length(y)
    for p = 1:k
        frac1= frac1 + a4(p)*y(i-p);
    end
    for q = 1:m;
        frac2 = frac2 + b4(q)*filtY4(i-q);
    end
        filtY4(i) = frac1 + frac2;
end
 %--------------------------------------------
 %------------implement 5th filter-------------
k = length(a5);
m = length(b5);
frac1 = 0;
frac2 = 0;
start = max(k,m)+1;
filtY5 = zeros(1,length(y)-start);
for i = start:length(y)
    for p = 1:k
        frac1= frac1 + a5(p)*y(i-p);
    end
    for q = 1:m;
        frac2 = frac2 + b5(q)*filtY5(i-q);
    end
        filtY5(i) = frac1 + frac2;
end
%-----------------------------------------------
%filtY = zeros(1,length(y));
filtY = (filt1+filtY2+filtY3+filtY4+filtY5);
y1 = myFilter(b1,a1,y);
y2 = myFilter(b2,a2,y);
y3 = myFilter(b3,a3,y);
y4 = myFilter(b4,a4,y);
y5 = myFilter(b5,a5,y);
Y = y1+y2+y3+y4+y5  ;
sound(Y,Fs);