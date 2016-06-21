%--------------------------------------------------------------------------
% Copyright (C) Darius Plausinaitis
% Written by Darius Plausinaitis
%--------------------------------------------------------------------------

% CVS record:
% $Id: figure_7_pll.m,v 1.1.2.2 2006/08/18 12:05:02 dpl Exp $

t = linspace(-180, 180, 400);
phi = linspace(-pi, pi, 400);

delay = 0.5;

arctan=atan(sin(phi)./cos(phi));
dotProduct = sin(phi).*cos(phi);
signProduct = sin(phi).*sign(cos(phi));
% arctan2=atan2(sin(phi),cos(phi));

plot(t, arctan * (180/pi)); 
hold on
plot(t, signProduct * (180/pi)); 
plot(t, dotProduct * (180/pi));
% plot(t, arctan2 * (180/pi));
hold off

legend('arctan({\itQ}/{\itI})', 'sign({\itI})*{\itQ}', '{\itI}*{\itQ}');
xlabel('True phase error [\circ]');
ylabel('Discriminator output [\circ]')
postPlot(get(gca, 'children'), 1);
axis ([-180, 180, -100, 100]);
