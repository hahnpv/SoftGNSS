function Scurve()
% SCURVE.M, Henrik Have Lindberg, 2006.03.16

%CVS record:
%$Id: Scurve.m,v 1.1.2.2 2006/08/18 12:05:02 dpl Exp $

cp = -2:0.01:2;

% CA code

corr = fxcorr(cp);

figure(1)
plot(cp,corr);
hold on

spacing = 0.5;

EmL = fxcorr(cp+spacing/2)-fxcorr(cp-spacing/2);

plot(cp,EmL);
hold off
axis([-2,2,-1.55, 1.55])
xlabel('Code Offset [chips]');
ylabel('Discriminator output/correlation');
legend ('Correlation','Discriminator\newline output');
%postPlot(get(gca,'children'), 1.5);


% BOC(1,1) code

corrBOC11 = fxcorrBOC11(cp);

figure(2)
plot(cp,corrBOC11)
hold on

EmLBOC11 = fxcorrBOC11(cp+spacing/2)-fxcorrBOC11(cp-spacing/2);

plot(cp,EmLBOC11);
hold off
axis([-2,2,-1.55, 1.55])
xlabel('Code Offset [chips]');
ylabel('Discriminator output/correlation');
legend ('Correlation','Discriminator\newline output');
%postPlot(get(gca,'children'), 1.5);

% fxcorr.m, HHL, 2006.03.16
%
% just CA code for now...

function correlation = fxcorr(codephase)

abs_codephase = abs(codephase);

for i=1:length(codephase)
	if abs_codephase(i)<1,
		correlation(i) = abs(1-abs_codephase(i));
	else
		correlation(i) = 0;
	end
end


% fxcorrBOC11.m, HHL, 2006.03.16
%
% just BOC(1,1) code for now...

function correlation = fxcorrBOC11(codephase)

abs_codephase = abs(codephase);

for i=1:length(codephase)
	if abs_codephase(i)<1,
		k = ceil(2*1*abs_codephase(i));
		correlation(i) = ((-1)^(k+1))*(-k^2+3*k-1-(5-2*k)*abs_codephase(i));
	else
		correlation(i) = 0;
	end
end
