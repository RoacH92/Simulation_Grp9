function num = inputNumber(prompt)
%INPUTNUMBER Summary of this function goes here
%   Detailed explanation goes here
while true
    num = str2double(input(prompt,'s'));
    if ~isnan(num)
        break;
    end
end

