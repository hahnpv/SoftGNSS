% Generates a stem plot showing the ACF 
% for a Gold sequnce

% Kai Borre, February 12, 2006

ca_codes
close all

figure(1)
pl = stem(0:51,[0 Corr11(1:50) 0],'.');
axis off
set(get(pl,'Baseline'),'linestyle','-')
set(pl,'Markersize',4,'linewidth',1.5)
axis tight

print -deps2  prn50
%%%%%%%%%%%%%%%%%%%%


