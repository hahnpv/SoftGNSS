% R_X(tau) as given by Nunes & Sousa & Leitao (2004).

%Written by Kai Borre
% February 26, 2005

Tc = 1;
t = linspace(-1,1,1000);

for p = [1,2,4]
    k = ceil(2*p.*abs(t)/Tc);
    f = (-1).^(k+1);
    R(p,:) = f.*((-k.^2+2*k.*p+k-p)/p - (4*p-2.*k+1).*(abs(t)./Tc));
end

h1 = plot(t,R(1,:));
hold on
h2 = plot(t,R(2,:));
h4 = plot(t,R(4,:));
set(h1,'linestyle','-','linewidth',1)
set(h2,'linestyle','--','linewidth',1)
set(h4,'linestyle','-.','linewidth',1)
xlabel( 'Delay  [chip]','fontsize',18)
ylabel('Correlation','fontsize',18)
legend('{\itp} = 1', '{\itp} = 2','{\itp} = 4')
set(gca,'FontSize',18)
axis([-1.2 1.2 -0.9 1.1])
box off
legend('boxoff')
hold off

print -deps  fig3-3 
%%%%%%%%%%%% end winkel8.m  %%%%%%%%
