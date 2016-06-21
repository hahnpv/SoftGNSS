%plot of sinc
% For Figure 1.3 in S/W book


t = linspace(-8,8,500);
figure(1);
plot(abs(sinc(t)),'linewidth',2)
hold on
plot([0 500],[0 0]);
axis off
print  -deps swsinc1

figure(2);
plot((sinc(t)).^2,'linewidth',2)
hold on
plot([0 500],[0 0]);
axis off
print -deps swsinc2

%%%%%%%%%%%%%%%%%
