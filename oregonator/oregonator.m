% Implementierung der Belousov-Zhabotinski-Reaktion, eine
% oszillierende chemische Reaktion (auch Oregonator)
% Siehe auch Deuflhard/Bornemann: Numerische Mathematik II, S11

% Autor : Rolf Krause (C++ Version)
% Matlab-Version: Andreas Klimke
% Date   : June 2002
% Version: 1.0

% Anfangskonzentrationen c1, ... c5
c = [0.417,1e-8,0.025,1e-8,1e-8,1e-8,...
1e-8,1e-8,1e-8,1e-8,1e-8,1e-8,...
1e-8,1e-8,8e-5]

% Zeitintervall [t0 ... tn]
tspan = [0 1200]

% ODE15S aufrufen, absolute Fehlertoleranz muss sehr klein gew�hlt
% werden um korrekte Ergebnisse zu erhalten. Die Jacobi-Matrix soll
% laut Matlab-Manual die Qualit�t und Geschwindigkeit der Rechnung
% verbessern. Wird diese Option nicht angegeben, wird die Ableitung
% numerisch bestimmt. Hier scheint die angegebene Jacobi-Matrix
% keine Vorteile zu bringen.
[t,y] = ode23s('dc',tspan,c,...
							 odeset('RelTol',1e-4,'AbsTol',1e-11,...
               'InitialStep',1e-9, 'OutputFcn', @odeplot));

% Ergebniss plotten
subplot(2,1,1);
semilogy(T,Y(:,2),'LineWidth',2);
title('c2','FontSize',16);
xlabel('t','FontSize',16);
ylabel('c(t)','FontSize',16);
axis square;
grid on;
subplot(2,1,2);
semilogy(T,Y(:,15),'LineWidth',2);
xlabel('t','FontSize',16);
ylabel('c(t)','FontSize',16);
title('c15','FontSize',16);
axis square;
grid on;

