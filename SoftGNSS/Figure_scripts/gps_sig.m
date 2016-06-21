% Demonstration of BPSK modulation
% and demodulation

% Kai Borre February 26, 2005
% Edited March 11, 2006; June 3, 2006

PRN_1 = PRNgen(1); % SVN 1
len = 25;
code = PRN_1(1:len); % first 25 chips for PRN1

x = zeros(1,len);  % creating a rectangular graph
y = x;
t = 1:len;
x(1) = .5;
y(1) = code(1);
s = 2;
for i = 2:len
    if code(i) ~= code(i-1)
        x(s) = t(i)+.5;
        x(s+1) = x(s);
        y(s) = code(i-1);
        y(s+1) = code(i);
        s = s+2;
    end
end

x2 = [.5 18.5 18.5 len-.5]; % navigation data
y2 = [1 1 -1 -1];

navy = y; % Chip times nav
ch = find(x>=18.5);
navy(ch) = -navy(ch);

x3 = x;
x3(16:17) = []; % crude corrections
navy3 = navy;
navy3(16:17) = [];

phi = linspace(0,len,10*len); % carrier wave
ycar = sin(phi*2*pi);
code1 = [ 1  code(1:end-1)];
code1(19:25) = -code1(19:25); % crude correction
phim = ycar.*kron(code1,ones(1,10)); %phimod; %modulated carrier phase

figure(1);
plot(x,y+4,  x2, y2+1,  x3,-navy3-2,...
    phi+0.5,ycar-5, phi+0.5,phim-8,'linewidth',1)
axis([-5 len+5 -9.5 5.5])
axis off

print -deps2 gps_sig

figure(2);
plot(phi+0.5,phim-2, x3,navy3-5, phi+0.5,ycar-8,'linewidth',1);
axis([-5 len+5 -9.5 5.5])
axis off

print -deps2 gps_demod

%%%%%%%%%%%%%%%%%% gps_sig.m %%%%%%%%%%%%%


