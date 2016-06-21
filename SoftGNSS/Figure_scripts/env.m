%Multipath envelope, 
% delta is geometric multipath and t is multipath error
% Implementation of equation (180)  and (18) in 
% Bernd Eissfeller (1997): Ein dynamisches Fehlermodell 
% f\"ur GPS Autokorrelationsempf\"anger. Universit\"at der 
% Bundeswehr M\"unchen, Heft 55 

% Kai Borre, February 27, 2005

syms  delta t 

T = 300; %1;       % chip length
alpha = .5;         % signal-to-multipath ratio (SMR)

d = 300; %1;       % correlator spacing
h1 = ezplot( R(t-d/2,T) - R(t+d/2,T) + alpha*( R(t-delta-d/2,T)- R(t-delta+d/2,T) ), [0,500,-80,80]);
hold on
h2 = ezplot( R(t-d/2,T) - R(t+d/2,T) - alpha*( R(t-delta-d/2,T)- R(t-delta+d/2,T) ), [0,500,-80,80]);
set([h1, h2],'linewidth',1.8')

d = 150; %.5;       % changed correlator spacing
h3 = ezplot( R(t-d/2,T) - R(t+d/2,T) + alpha*( R(t-delta-d/2,T)- R(t-delta+d/2,T) ), [0,500,-80,80]);
h4 = ezplot( R(t-d/2,T) - R(t+d/2,T) - alpha*( R(t-delta-d/2,T)- R(t-delta+d/2,T) ), [0,500,-80,80]);
set([h3,h4], 'linewidth',1.3)


d = 30; %.1;       % changed correlator spacing
h5 = ezplot( R(t-d/2,T) - R(t+d/2,T) + alpha*( R(t-delta-d/2,T)- R(t-delta+d/2,T) ), [0,500,-80,80]);
h6 = ezplot( R(t-d/2,T) - R(t+d/2,T) - alpha*( R(t-delta-d/2,T)- R(t-delta+d/2,T) ), [0,500,-80,80]);
set([h5,h6], 'linewidth',.8)

title('')
ylabel('Ranging error  {\it\tau}   [m]','fontsize',18)
xlabel('Multipath delay  {\it\delta}   [m]','fontsize',18)
hold off
legend([h1, h3, h5],'{\itd} =1.0','{\itd} = 0.5','{\itd} = 0.1')
set(gca,'Fontsize',18)
box off
legend('boxoff')

print -deps2 env
%%%%%%%%%%%%%%%%%%% env.m %%%%%%%%%%%%%%%
