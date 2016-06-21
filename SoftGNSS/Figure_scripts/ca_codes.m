clear all

% ***** Generates C/A codes *****
PRN_1 = PRNgen(1); % SVN 1
PRN_2 = PRNgen(2); % SVN 2

PRN1 = [PRN_1';PRN_1'];
PRN2 = [PRN_2';PRN_2'];

% ***** Calculate auto- and cross-correlation *****
for n=1:1023
    Corr11(n) = PRN1(1:1023)'*PRN1(n:1022+n);
    Corr12(n) = PRN1(1:1023)'*PRN2(n:1022+n);
end

figure(1)
subplot(121)
plot(Corr11);
axis([-50 1100 -100 1100]);
%title('Autocorrelation of a PRN sequence');
set(gca,'Fontsize',16)
ylabel('\itr_{kk}','Fontsize',16)
xlabel('Lag','Fontsize',16)
box off


subplot(122)
plot(Corr12);
axis([-50 1100 -100 1100]);
%title('Cross-correlation between two PRN sequences');
set(gca,'Fontsize',16)
ylabel('\itr_{ik}','Fontsize',16)
xlabel('Lag','Fontsize',16)
box off

print -deps2 ca-code-correlation
%%%%%%%%%%%%%%%% end ca_codes.m  %%%%%%%%%%%%%%%
