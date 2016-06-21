%--------------------------------------------------------------------------
% Copyright (C) Darius Plausinaitis
% Written by Darius Plausinaitis
%--------------------------------------------------------------------------

% CVS record:
% $Id: figure_7_dll.m,v 1.1.2.2 2006/08/18 12:05:02 dpl Exp $


t = linspace(-1.5, 1.5, 400);

delay = 0.5;

coherent = Tri(t-delay) - Tri(t+delay);
power = Tri(t-delay).^2 - Tri(t+delay).^2;
normPower = (Tri(t-delay).^2 - Tri(t+delay).^2) ./ (Tri(t-delay).^2 + Tri(t+delay).^2);
dotProduct = Tri(t) .* (Tri(t-delay) - Tri(t+delay));

%Plot results. The sign of results is inverted to have a "mirrored version"
%of the results. This is because in the code negative t values mean advance
%in time, while negative values in x axis mean delay of the code.
plot(t, -dotProduct);
hold on
plot(t, -normPower); 
plot(t, -power);
plot(t, -coherent); 
hold off

legend('Dot product', 'Normalized power', 'Power', 'Coherent');
xlabel('True offset of the two codes [chips]');
ylabel('DLL discriminator output');

postPlot(get(gca, 'children'), 1);

axis ([-1.5, 1.5, -1.1, 1.1]);