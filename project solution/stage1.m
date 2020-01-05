% ELEC3104 project stage1
%The program can record sound via microphone or read .wav files 
%and then analyse it's freqency as well as energy in REAL TIME
%freqeucny resolution and rate at which energy changes are adjustable
clc
close all
clear
commandsline = 'Press 1 to read existing file\nPressbench 2 to read from microphone\n';
commands  = input(commandsline);
%select mode 
if (commands == 1)
    close 
    commmandsline = 'Type your file name\n';
    fileName = input(commmandsline,'s');
    [ydata,Fs] = audioread(fileName);
    disp('File has been decteced!');
    Fs
elseif (commands == 2)
    
    % simulate in real time 
    timechunk = 10;
    typeFs = 'Specify the sampling frequency\n';
    typeSingletime = 'Specify rate at which energy changes(time)\n ';
    typeFreqRes = 'Specify frequency resolution\n';
    Fs = input(typeFs);
    singletime = input(typeSingletime);
    freqRes = input(typeFreqRes);
    
    N = round(singletime*Fs,1); 
    disp('Start speaking.')
    samples = zeros(N,1);
    samplesDTFT = zeros(freqRes,1);
    trace = 0;
    while 2>1
          tic;
        BigArray = zeros(freqRes,timechunk);
        for i =1:timechunk
            recObj = audiorecorder(Fs,24,1);
            recordblocking(recObj, singletime);
            y = getaudiodata(recObj);
%             recObj = audioDeviceReader(Fs,singletime*Fs);
%             y = step(recObj);
%             
            samples = y;
            N = round(singletime*Fs,-1);
            hold on
            subplot(2,1,1) 
            plot(y)
            xlabel('time')
            ylabel('magnitutde')
            axis([-inf inf -0.03 0.03])
            title('Audio input')
            theta = [0:pi/(freqRes-1):pi];
            for k = 1:freqRes
                samplesDTFT(k) = 0;
                for l = 1:N
                    samplesDTFT(k) = samplesDTFT(k) + samples(l)*exp(-j*theta(k)*l) ;
                end

            end
            samplesDTFT = abs(samplesDTFT);
            BigArray(:,i) = 20*log(samplesDTFT(:));
            subplot(2,1,2)
            xleft = trace*timechunk*singletime;
            xright = timechunk*singletime + trace*timechunk*singletime;
            x = [1:timechunk];
            y = [0:0.5*Fs/(freqRes-1):Fs/2];
            imagesc(x,y,BigArray)
            drawnow
            xlabel('time')
            ylabel('Frequency')
            title('Audio Spectrogram')
%             release(recObj);
        end
      toc
      
    end  
else
        fprintf('commands undefined,will read the sample wave file instead!\n')
        [ydata,Fs] = audioread('s1_q3d.wav');   
         Fs
end

% each time chunk we will have round(lentgh(y)/timechunk) samples
% import the samples into matrix
% round up the samples may trucate some datas at the very end of the file
% but it should be alright(hopefully)

typeTimechunk = 'Specify time chunk\n';
typefreqRes = 'Specify frequency resolution\n';
timechunk = input(typeTimechunk);
freqRes = input(typefreqRes);
N = round(length(ydata)/timechunk,-1);
singletime = N/Fs
samples   =  zeros(N,timechunk);
samplesDTFT = zeros(freqRes,timechunk);
theta = [0:pi/(N-1):pi];
m = 1;
for k = 1:timechunk
    
   for l = 1:N     
       samples(l,k) = ydata(m);
       m = m + 1;
       if(m>length(ydata))
        %break the loop if there's no more input data
        break
        
       end
       
   end
    
end
%only want positive frequency
theta = [0:pi/(freqRes-1):pi];
for k = 1:timechunk 
    
    for l = 1:freqRes
        
        for m = 1:freqRes
            
            samplesDTFT(l,k) = samplesDTFT(l,k) + samples(m,k)*exp(-j*m*theta(l));
        end
        
        samplesDTFT(l,k) = abs(real(samplesDTFT(l,k)));
        
    end
    
end
samplesEnergydB = 20*log(samplesDTFT);
xleft = singletime;
xright = timechunk*singletime;
x = [xleft:(xright-xleft)/(timechunk-1):xright];
y = [0:0.5*Fs/(freqRes-1):Fs/2];
%plot in 'real' time 

BigArray = zeros(freqRes,timechunk);
for i = 1:timechunk 
    BigArray(:,i) = samplesEnergydB(:,i);
    imagesc(x,y,BigArray)   
    drawnow;
    ylabel('frequency')
    xlabel('time')
    title('Spectrogram from .wav file')
    tic;
    while toc < singletime
        %stay inside the loop when it is not the time to plot        
    end
end
sound(ydata)

