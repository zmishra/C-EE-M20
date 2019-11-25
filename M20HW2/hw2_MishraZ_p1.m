%Script: The Lunar Phase Calculator
%Zubin Mishra, 604644805
%This script takes in a date as input and returns the perccent illumination
%of the moon on that day and whether the moon was waxing or waning.

% Clean up the MATLAB workspace
clear all;
clc;

%Establish constants and some default variable values
J_0 = 2415021;
T = 29.530588853;
a = 0;

%Prompt for input
month = input('Please enter the month as MMM (e.g. JAN): ', 's');
month = upper(month);
day = input ('Please enter the day as DD (e.g. 01): ', 's');
year = input('Please enter the year as YYYY (e.g. 2000): ', 's');

%Check validity of input
if (length(year) ~= 4)
    error('Year input error');
end
yr = str2num(year);
if (length(yr) ~= 1)
    error('Year input error');
end

if (length(day) ~= 2)
    error('Day input error');
end
d = str2num(day);
if (length(d) ~= 1)
    error('Day input error');
end

if (yr < 1900 || yr > 9999)
    error('Year input error');
end
is_leapyear = ((mod(yr,4)==0)&&(mod(yr,100)~=0))||(mod(yr,400)==0);

if (d < 1)
    error('Day input error')
end
switch (month)
    case 'JAN'
        if (d > 31)
            error('Day input error')
        end
        a = 1; %values needed for later
        mon = 1;
    case 'FEB'
        if ((is_leapyear && d > 29) || (~is_leapyear && d > 28))
            error('Day input error')
        end
        a = 1;
        mon = 2;
    case 'MAR'
        if (d > 31)
            error('Day input error')
        end
        mon = 3;
    case 'APR'
        if (d > 30)
            error('Day input error')
        end
        mon = 4;
    case 'MAY'
        if (d > 31)
            error('Day input error')
        end
        mon = 5;
    case 'JUN'
        if (d > 30)
            error('Day input error')
        end
        mon = 6;
    case 'JUL'
        if (d > 31)
            error('Day input error')
        end
        mon = 7;
    case 'AUG'
        if (d > 31)
            error('Day input error')
        end
        mon = 8;
    case 'SEP'
        if (d > 30)
            error('Day input error')
        end
        mon = 9;
    case 'OCT'
        if (d > 31)
            error('Day input error')
        end
        mon = 10;
    case 'NOV'
        if (d > 30)
            error('Day input error')
        end
        mon = 11;
    case 'DEC'
        if (d > 31)
            error('Day input error')
        end
        mon = 12;
    otherwise
        error('Month input error');
end

%Calculate elapsed days
y = yr - a + 4800;
m = mon + 12*a - 3;
J = d + floor((153*m + 2)/5) + 365*y + floor(y/4) - floor(y/100)...
    + floor(y/400) - 32045;
d_J = J - J_0;

%Calculate lunar phase
L = 100*(sin(pi*(mod(d_J, T)/T)))^2;
waxing = ((mod(d_J, T)/T) < 0.5);

%Output
if waxing
    w = 'Waxing';
else
    w = 'Waning';
end

fprintf('%s %s %s:\n', month, day, year);
fprintf('Illumination = %.1f percent\n', L);
fprintf(strcat(w, '\n'));