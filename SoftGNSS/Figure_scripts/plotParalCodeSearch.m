%function plotParalCodeSearch(results, frqBins, PRN)

% The variable "results" is taken from the function "acquisition.m". The
% function is stopped at the point where script has to decide if there is
% the GNSS signal or not (if statement). 
%
% This script can be used to plot results of serial search algorithm. The
% serial search source code is not included.

%--------------------------------------------------------------------------
% Copyright (C) Darius Plausinaitis
% Written by Darius Plausinaitis
% Based on Peter Rinder and Nicolaj Bertelsen
%--------------------------------------------------------------------------

%CVS record:
%$Id: plotParalCodeSearch.m,v 1.1.2.2 2006/08/18 12:05:02 dpl Exp $

[xsize, ysize] = size(results);

s=surf(1:ysize, frqBins(1:xsize)/1e6, results);
set(s,'EdgeColor','none','Facecolor','interp');
%xlabel('Code phase\newline    [chips]');
xlabel('Code phase\newline  [samples]');
ylabel('Frequency\newline   [MHz]');
zlabel('Magnitude');
text=sprintf('PRN %i', PRN);
title(text);
axis tight;

% view(az, el);
% colormap(fig69colormap);

% fig69colormap = colormap;
% [az, el] = view;