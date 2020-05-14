%ELEC3104 lab3q1
clear 
clc
close all
% from analytical part
fs = 7000;
Rp = 0.4;
Rs = 10;
%Normalized frequency
Wp = [1400 2100]/(fs/2);
Ws = [1050 2450]/(fs/2);
[n Wn] = buttord(Wp,Ws,Rp,Rs);
[b,a] = butter(n,Wn);
freqz(b,a,1000)
% ideal frequency response
%bpFilt = designfilt('bandpassiir', 'FilterOrder', 20, ...
%                  'PassbandFrequency1', 1400, 'PassbandFrequency2', ...
%                  2100, 'StopbandAttenuation1', 50, 'PassbandRipple', ...
%                   0.4, 'StopbandAttenuation2', 50, 'SampleRate', 7000);
%
%fvtool(bpFilt)
%
[z,p,k]=buttap(9);
b = z;
a = poly(p);

