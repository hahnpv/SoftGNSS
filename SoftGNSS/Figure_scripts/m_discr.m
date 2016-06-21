% Constructive and destructive multipath interference

% Kai Borre, March 27, 2006

syms  delta t 

T = 1;       % chip length
d = 1;       % correlator spacing
alpha  = .3;   % amplitude of multipath signal

figure(1);  % constructive interference
hold on
h1 = ezplot( R(t-d/2,T));
h2 = ezplot(alpha*R(-.6+t-d/2,T));
h3 = ezplot(R(t-d/2,T)+alpha*R(-.6+t-d/2,T)); %-
line([-1 2.5], [ 0 0]);
set(h2,'linestyle', '--');
set(h3,'linewidth', 1.5);
xlabel('Time delay [chip]','FontSize',24)
set(gca,'FontSize',24)
title('');
axis([-1 2.5 -.3 1.3])
hold off
print -deps2 m_discr1

figure(2);  % destructive interference
hold on
h1 = ezplot( R(t-d/2,T));
h2 = ezplot(-alpha*R(-.6+t-d/2,T));
h3 = ezplot(R(t-d/2,T)-alpha*R(-.6+t-d/2,T)); %+
line([-1 2.5], [ 0 0]);
set(h2,'linestyle', '--');
set(h3,'linewidth', 1.5);
xlabel('Time delay [chip]','FontSize',24)
set(gca,'FontSize',24)
title('');
axis([-1 2.5 -1 1.3])
hold off
print -deps2 m_discr2

%%%%%%%%%%%%%%%%%%%%% end m_discr.m  %%%%%%%%%%%%
