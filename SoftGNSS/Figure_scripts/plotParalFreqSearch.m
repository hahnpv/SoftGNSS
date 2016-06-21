% This script plots results of parallel frequency search. The source code
% is not included. The search algorithm requires a lot of computational
% resources and produces a great amount of data, therefore only a smaller
% portion of total results is plotted: 
%   - the frequency region 5-15 MHz is a subset of the full region 0-19 MHz
%   - the code search region is 1-500 chips instead of 1-1023.

%--------------------------------------------------------------------------
% Copyright (C) Darius Plausinaitis
% Written by Darius Plausinaitis
% Based on Peter Rinder and Nicolaj Bertelsen
%--------------------------------------------------------------------------

%CVS record:
%$Id: plotParalFreqSearch.m,v 1.1.2.2 2006/08/18 12:05:02 dpl Exp $

s=surf(5.001:0.001:15.000, 1:500, result);
set(s,'EdgeColor','none');
ylabel('Code phase\newline   [chips]');
xlabel('Frequency\newline   [MHz]');
zlabel('Magnitude');
text=sprintf('PRN %i',svnum);
title(text);
ha = gca();
zlim(ha, myZlim);
axis tight
view(-49,25);
set(ha, 'zminortick', 'on');
% caxis(ha, myCaxis)
% colormap(ha, myColormap);

% This is a trick to replace the data inside of the plot. It does not
% update any of the plot properties (axes, limits, view angle etc.).
%
% set(get(gca,'children'),'zdata',result2)
