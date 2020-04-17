clc;
clear;

%Konstanten
g = 9.81; %m/s^2
e = 0.74; %dimensionslos
h = 22; %m

%Eingabe Test

%Eingabeschleife Winkel
while true
    %Aufruf eigener Eingabefunktion
    alpha = inputNumber('Bitte Wurfwinkel zwischen 55° und 65° eingeben [°] :');
    %Abbruchbedingung und Ausgabe Wert
if alpha >= 55 && alpha <= 65
    x = num2str(alpha);
    disp(['Saved alpha[°]: ' , x]);
break;
end
%Wenn dieser Punkt erreicht wird, ist die Eingabe falsch
disp('Input nicht im Bereich!');
end

%Eingabeschleife Startgeschwindigkeit (siehe Schleife Winkel)
while true
    v_0 = inputNumber('Bitte Startgeschwindigkeit zwischen 1 und 68 [m/s] :');
if v_0 >= 1 && v_0 <= 65
    x = num2str(v_0);
    disp(['Saved v_0[m/s]: ' , x]);
break;
end
disp('Input nicht im Bereich!');
end

disp('Inputs gültig!');
%Rechnungen

v_x = v_0*cosd(alpha);
v_y0 = v_0*sind(alpha);

    
%Ausgabe
disp('Simulation startet...');
%Start der Simulation
sim_slx = 'ProjektAsim.slx';
load_system(sim_slx);
%Laden der Output Objekte
out = sim(sim_slx,50);

disp('Simulation abgeschlossen...');
disp('Plots werden erstellt...');

%Umwandlung von g in passendes Array
gconst = out.aO_y.Data;
g_time = gconst * ones(max(size(out.tout)),1);

%Erstellung Plot 1
figure(1)
plot(out.tout,g_time)
hold on
plot(out.vO_y)
hold on
plot(out.yO)
%Layout Plot 1
grid on
grid minor
legend('a_y in m/s^2','v_y in m/s','y in m');
title('Schiefer Wurf y');
xlabel('t[s]');
ylabel('a[m/s^2], v[m/s], y[m]');

%Erstellung Plot 2
figure(2)
plot(out.xO.Data,out.yO.Data)
%Layout Plot 2
grid on
grid minor
title('Weg des Balls 2D');
xlabel('x[m]');
ylabel('y[m]');
%Skript Ende
disp('Plots erstellt. Skript Beendet');
