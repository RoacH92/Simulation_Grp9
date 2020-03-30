clc;
clear;

%Konstanten
g = 9.8100; %m/s^2
e = 0.74; %dimensionslos
h = 22; %m

%Eingabe

while true
    alpha = inputNumber('Please type an angle between 55° and 65° :');
if alpha>55 && alpha < 65
break;
end
end

while true
    v = inputNumber('Please type an velocity between 1 and 68 [m/s] :');
if v>1 && v < 65
break;
end
end
    
%Ausgabe


