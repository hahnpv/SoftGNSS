%Correlation and Discriminator functions

% Kai Borre, February 12, 2006

syms t

T = 1;
d = 1;

delta = 1;
figure(1);
hold on
t1 = ezplot(R(-1+t+d/2,T)); 
t2 = ezplot(R(-1+t+delta+d/2,T));
t3 = ezplot(-R(-1+t+d/2,T)+R(-1+t+delta+d/2,T));
line([-1.6 1.6], [0 0])
xlabel('Time Delay  [chip]','FontSize',24)
ylabel('Correlation','FontSize',24)
set(t3,'color','k','linewidth',1.5)
axis([-1.6 1.6 -.5 1.5])
axis equal
set(gca,'FontSize',24)
title('')
hold off
print -deps2 corrd1

delta = .5;
figure(2);
hold on
ezplot(R(-.75+t+d/2,T)); 
ezplot(R(-.75+t+delta+d/2,T));
t32 = ezplot(-R(-.75+t+d/2,T)+R(-.75+t+delta+d/2,T));
line([-1.5 1.5], [0 0])
xlabel('Time Delay  [chip]','Fontsize',24)
ylabel('Correlation','Fontsize',24)
set(t32,'color','k','linewidth',1.5)
axis([-1.5 1.5 -.5 1.5])
axis equal
set(gca,'FontSize',24);
title('')
hold off
print -deps2 corrd2

figure(3);
hold on
h1 = ezplot(R(t+d/2,T) - R(t-d/2,T));  % coherent discriminator
set(h1,'color','k','linewidth',1)
h2 = ezplot((R(t+d/2,T))^2 - (R(t-d/2,T))^2); % non-coherent product discriminato
set(h2,'color','k','linewidth',1,'linestyle','--')
xlabel('Time Delay  [chip]','FontSize',18)
title('')
axis equal
set(gca,'FontSize',18);
grid on
print -deps2 discr

%%%%%%%%%%%%%%%% discr.m  %%%%%%%%%%%%%%%%%%
