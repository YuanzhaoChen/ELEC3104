%ELEC3104 LAB1 QUESTION 1

%part C
close all
clear
clc
N = 20;
n = [0:10000];
xDTFT = [0:10000];
theta = [-pi:0.0002*pi:pi];
for i = 1:length(n)
        if(theta(i)==0)
            xDTFT(i) = 41;
            %calculated directly from the definition
        else
            xDTFT(i) = sin(N*theta(i)+0.5*theta(i))/sin(theta(i)/2);
            %notice that theta(i)~=0  
        end
end

figure(1)
plot(theta,abs(xDTFT))
xlabel('theta')
ylabel('magnitude')
title('magnitude of DFFT')
figure(2)
plot(theta,angle(xDTFT))
title('phase spectra')
%part D
yDTFT = [0:10000];
for i = 1:length(n)
   
    yDTFT(i) = xDTFT(i)*xDTFT(i);
   
end
figure(3)
plot(theta,yDTFT)
title('DTFT of y[n]')

% using integral theta is expected to be continuous

invyDTFT = [-40:40];

for k = 1:length(invyDTFT) 
    
    invyDTFT(k) = 0;
    
    for l = 1:10000
        
        invyDTFT(k) = invyDTFT(k) + yDTFT(l)*exp(j*(k-40)*theta(l))*0.0002*pi;
        %note that k=[1:81] here so we have to use (k-40) to 
        %represent the [-40:40] interval !
    end 
    
    invyDTFT(k) = invyDTFT(k)/(2*pi);
    
end
figure(4)

plot(-40:40,invyDTFT);

xlabel('n')

title('inverse DTFT of y')