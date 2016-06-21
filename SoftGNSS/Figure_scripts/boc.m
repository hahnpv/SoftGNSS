% Demonstration of BOC modulation principle

% February 13, 2006

% Written by Kai Borre and Darius Plasinaitis
phi = linspace(0,12,600);

figure(1);
%Spreading Code
chips = [ones(1, 400), -1 * ones(1, 200)];
% plot(phi, data +7)
plot(phi, chips +10)
hold on

%Sub-carrier
subCarrier = square(phi*pi);
% plot(phi, subCarrier+4)
plot(phi, subCarrier +7)

%BOC signal, no carrier
plot(phi, (subCarrier.*chips) +4)

%Carrier wave
carrier = sin(phi*4*pi);
plot(phi, carrier+1)

%Modulated Carrier Phase
signal = carrier.* subCarrier .* chips;   
plot(phi, signal - 2) 
axis([-1 13 -4 11])
axis off
hold off

print -deps boc
%%%%%%%%%%%%%% boc.m  %%%%%%%%%%%%%%%%%%%% 



