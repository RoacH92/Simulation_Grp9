clc;
clear;

%Konstanten
g = 9.8100; %m/s^2
e = 0.74; %dimensionslos
h = 22; %m

%Eingabe Test

while true
    alpha = inputNumber('Please type an angle between 55° and 65° [°] :');
if alpha >= 55 && alpha <= 65
break;
end
end

while true
    v_0 = inputNumber('Please type an start velocity between 1 and 68 [m/s] :');
if v_0 >= 1 && v_0 <= 65
break;
end
end

%Rechnungen

v_x = v_0*sind(alpha);
v_y0 = v_0*cosd(alpha);

    
%Ausgabe
disp('Simulation startet..');

sim_slx = 'ProjektAsim.slx';
load_system(sim_slx);
out = sim(sim_slx,50);

gconst = out.aO_y.Data;
g_time = gconst * ones(max(size(out.tout)),1);

figure(1)
plot(out.tout,g_time)
hold on
plot(out.vO_y)
hold on
plot(out.yO)
grid on
grid minor

legend('a_y in m/s^2','v_y in m/s','y in m');
title('Schiefer Wurf y');
xlabel('t[s]');
ylabel('a[m/s^2], v[m/s], y[m]');

figure(2)
plot(out.xO.Data,out.yO.Data)
grid on
grid minor
title('Weg des Balls 2D');
xlabel('x[m]');
ylabel('y[m]');
