% The ACF for the BOC signal as function of delay. 
% Eq. (2.68) and Figure 2.27 in Jon Winkel (2002).
% The infinite bandwidth and bandlimited cases

% Written by Kai Borre, February 26, 2005

no = 300;
t = linspace(-5,5,no);
Tc = 1;
Y = zeros(3,no);
n = 1;
k = 0;

% infinite bandwidth, b = infty
s = zeros(1,no);
s = ( 2*R(t./Tc-2*k,1) - R(t./Tc-2*k-1,1) -R(t./Tc-2*k+1,1));
Y(n,:) = s/2;

% bandlimited cases, b = 1 and 0.5
for i = 1:2
    if i == 1, b =1; else b = 0.5; end;
    s = ( 2.*R_BL(t./Tc-2.*k,b) - R_BL(t./Tc-2.*k-1,b) -R_BL(t./Tc-2.*k+1,b));
    Y(i+1,:) = s/2;
end

h1 = plot(t/2,Y(1,:)');
hold on
h2 = plot(t/2,Y(2,:)');
h3 = plot(t/2,Y(3,:)');
axis([-2.2 2.2 -.7 1.1])
set(h1,'linestyle','-');
set(h2,'linestyle','--');
set(h3,'linestyle','-.');
xlabel('Delay [chip]','fontsize',18)
ylabel('Normalized amplitude','fontsize',18)
legend('{\itb} = \infty', '{\itb} = 1', '{\itb} = 0.5')
hold off
box off
legend('boxoff')
set(gca,'FontSize',18)

print -deps2 acf_bocl
%%%%%%%%%%%% winkel4.m  %%%%%%%%%%%%%%

