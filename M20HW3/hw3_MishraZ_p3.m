%Script: Nested Radicals
%Zubin Mishra, 604644805
%This script calculates the value of  series of nested radicals up to the
%point of convergence.

% Clean up the MATLAB workspace
clear all;
clc;

% Ask for input
valid = false;
while (true)
    m = input('Please enter a value for M: ');
    if(m > 1 && mod(m, 1) == 0)
        break;
    else
        fprintf('Error\n');
    end
end

%Initial print out
fprintf('m = %.0f\n', m);
fprintf('t%.0f = %.12f\n',1,sqrt(m));

% Square root loop
old = 0;
curr = sqrt(m);
count = 2;
while (abs(curr-old) > 10^-12)
    old = curr;
    curr = sqrt(m);
    for i = 1:count-1
        if (mod(count,2)==0)
            curr = sqrt(m+(-1)^(i)*curr);
        else
            curr = sqrt(m+(-1)^(i-1)*curr);
        end
    end
    fprintf('t%.0f = %.12f\n',count,curr);
    count = count + 1;
end