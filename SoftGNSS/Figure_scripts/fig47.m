% Frequency domain depiction of the GPS signal and thermal noise
% power

%Written by Kai Borre, October 1, 2005

f0 = 1.023e6;
delta_f =  linspace(-15e6, 15e6, 999); % difference with respect to f0
noise_floor  = 2*randn(1,length(delta_f))+db(2*1e-6);

% Interpolation for graph for  RF filter
 x = [-3*f0 0 3*f0]; 
 y = [-140 -115 -140];
 xi = f0*(-3:.5:3);
 yi = interp1(x,y,xi,'cubic'); 

figure(1);
h1 = plot(delta_f.*pi/2, db( (sinc(pi*delta_f/(2*f0))).^2./f0),...
                               'linewidth',1.5,'linestyle','-');
hold on
h2 = plot(delta_f.*pi/2, noise_floor,'linewidth',...
    1.5,'linestyle','--');
h3 = plot(xi,yi,':','linewidth',1);
legend('GPS C/A','Noise floor, 2 MHz BW','RF filter')
plot([0 3*f0], [-120 -120],'linewidth',1,'linestyle',':');
text(3.1*f0,-120,'{\it\approx -n} dBm');
text(3.1*f0,-126,'(> -120 dBm)');
set(gca,'XTick',[-5*1e6  -1e6 0 1e6  5*1e6])
set(gca,'XTickLabel',{'-5','-1','0','1','5'})
axis([-5*f0 5*f0 -190 -70]);  
set(gca,'FontSize',16)
hold off
ylabel('Power  [dBm]')
xlabel('Frequency  [MHz]')
%title('Center Frequency 1575.42 MHz')
box off
legend('boxoff')

print -deps2 fig4_7
%%%%%%%%%%%%%%%%%%%%%% end fig47.m  %%%%%%%%%%%%%%%


