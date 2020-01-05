% record audio signal from mic and then write it as .wav file 
clc 
clear 
close all
Fs = 16000;
singletime = 10;
disp('start speaking...');
recObj = audiorecorder(Fs,24,1);
recordblocking(recObj, singletime);
y = getaudiodata(recObj);
audiowrite('sample.wav',y,Fs);
disp('END');
fprintf('Data length: %d\nSampling frequecny: %d\n',length(y),Fs);
