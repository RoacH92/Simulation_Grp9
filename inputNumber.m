function num = inputNumber(prompt)
%INPUTNUMBER Funktion
%prompt entspricht Nachricht in der Eingabeaufforderung
while true
    num = str2double(inputdlg(prompt));
    %Pr�fung ob Eingabewert eine Zahl ist
    if ~isnan(num)
        break;
    end
end

