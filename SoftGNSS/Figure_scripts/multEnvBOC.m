function multEnvBOC()
%--------------------------------------------------------------------------
% Copyright (C) Darius Plausinaitis and Kai Borre
% Written by Darius Plausinaitis and Kai Borre
%--------------------------------------------------------------------------

% CVS record:
% $Id: multEnvBOC.m,v 1.1.2.2 2006/08/18 12:05:02 dpl Exp $

maxDelay = 500; %[m]
maxOffset = 80;  %[m]

lcode = 299.792458; %code length in meters

alpha = 0.5;

d = 1;        %chip spacing

h(1) = ezplot(@(delay, offset)multipathBOC(offset/lcode, delay/lcode, -alpha, d), [0, maxDelay, -maxOffset, maxOffset]);

hold on

h(2) = ezplot(@(delay, offset)multipathBOC(offset/lcode, delay/lcode,  alpha, d), [0, maxDelay, -maxOffset, maxOffset]);

d = 0.5;        %chip spacing

h(3) = ezplot(@(delay, offset)multipathBOC(offset/lcode, delay/lcode, -alpha, d), [0, maxDelay, -maxOffset, maxOffset]);
h(4) = ezplot(@(delay, offset)multipathBOC(offset/lcode, delay/lcode,  alpha, d), [0, maxDelay, -maxOffset, maxOffset]);

d = 0.1;        %chip spacing

h(5) = ezplot(@(delay, offset)multipathBOC(offset/lcode, delay/lcode, -alpha, d), [0, maxDelay, -maxOffset, maxOffset]);
h(6) = ezplot(@(delay, offset)multipathBOC(offset/lcode, delay/lcode,  alpha, d), [0, maxDelay, -maxOffset, maxOffset]);


h(7) = ezplot(@(delay, offset)multipathRec(offset/lcode, delay/lcode, -alpha, d), [0, maxDelay, -maxOffset, maxOffset]);
% hold on
h(8) = ezplot(@(delay, offset)multipathRec(offset/lcode, delay/lcode,  alpha, d), [0, maxDelay, -maxOffset, maxOffset]);

hold off

set(h(1:2), 'LineStyle', '-')
set(h(3:4), 'LineStyle', '--')
set(h(5:6), 'LineStyle', '-.')
set(h(7:8), 'LineStyle', ':')
set(h, 'LineWidth', 1)

xlabel('Multipath delay \delta [m]')
ylabel('Ranging error \tau [m]')
title('')
box off
legend(h([1,3,5, 7]),'{\itd} = 1','{\itd} = 0.5', '{\itd} = 0.1', '{\itd} = 0.1 (C/A)')
legend boxoff

function correlation = multipathRec(offset, delay, alpha, d)

d = d/2;

earlyCorrelator = (Tri(offset - d) + alpha * Tri(offset - d - delay));
lateCorrelator  = (Tri(offset + d) + alpha * Tri(offset + d - delay));

correlation = earlyCorrelator - lateCorrelator;

function correlation = multipathBOC(offset, delay, alpha, d)

n=2;

d = d/2;

earlyCorrelator = (acf_boc(offset - d, n, 1) + alpha * acf_boc(offset - d - delay, n, 1));
lateCorrelator  = (acf_boc(offset + d, n, 1) + alpha * acf_boc(offset + d - delay, n, 1));

correlation = earlyCorrelator - lateCorrelator;

function result = acf_boc(x, n, sin_type)

result = 0;

sum = 0;
sign = -1;
r = -1;

x = x * n * 2.0;

if (sin_type) r = 1.0; end;
if (mod(n, 2)) sign = 1; end

for k=1:n-1
    sum = sum + sign * (2.0*k*Tri(x-2.0*(n-k)) + r * Tri(x-2.0*(n-k)-1.0) + 2.0 * k * Tri(x+2.0*(n-k)) + r*Tri(x+2.0*(n-k)+1.0));
    sign= -sign;
end

sum = sum + sign * (2.0*n*Tri(x) + r * Tri(x-1.0) + r * Tri(x +1.0));

result = sum/(2*n);
