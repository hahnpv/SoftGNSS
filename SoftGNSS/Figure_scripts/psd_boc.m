% Power PSpectral Density for Galileo BOC(1,1) and GPS C/A

%Written by Kai Borre, February 14, 2005

f0 = 1.023e6;
alpha = 1;
beta = 1;
if rem(alpha/beta,2) == 0, 
    even = 'true'; 
else
    even = 'false';
end

delta_f =  linspace(-15e6,15e6,999); % difference with respect to L1
fs = alpha*f0;
fc = beta*f0;
n = 2*fs/fc;
r = rem(n,2);
if r == 0, even = 'true'; end
if even
    G = fc* (  tan(pi*delta_f/(2*fs)).*sin(pi*delta_f/fc)./(pi*delta_f+eps)  ).^2;
else
    G = fc* (  tan(pi*delta_f/(2*fs)).*cos(pi*delta_f/fc)./(pi*delta_f+eps)  ).^2;
end

figure(1);
h1 = semilogy(delta_f,G, 'linewidth',1); % BOC
hold on
h2 = semilogy(delta_f.*pi/2, (sinc(pi*delta_f/(2*fc))).^2./fc,...
                                              'linewidth', 1,'linestyle','-.'); % GPS
set(gca,'XTick',[-6*1e6  -4*1e6 -2*1e6 0 2*1e6  4*1e6  6*1e6])
set(gca,'XTickLabel',{'-6','-4','-2','0','2','4','6'})

legend('Galileo BOC(1,1)','GPS C/A')
xlabel('Frequency [MHz]','FontSize',18)
ylabel('Power','Fontsize',18)
%title('Center Frequency 1575.42 MHz','FontSize',18)
axis([-6e6 6e6 1e-10 1e-5]);
box off
legend('boxoff')    
hold off
set(gca,'FontSize',18)

print -deps2 psd_boc
%%%%%%%%%%%%%%%%%%%%%% end psd_boc.m  %%%%%%%%%%%%%%%


