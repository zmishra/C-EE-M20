%Script: The Pocket Change Problem
%Zubin Mishra, 604644805
%This script answers the question: what is the average number of coins
%you can expect to receive in your change after a cash transaction?

% Clean up the MATLAB workspace
clear all;
clc;

% Set up coin values and initial count value
q = 25;
d = 10;
n = 5;
p = 1;
count = 0;

% For loop
for i = 0:99
    remaining = i;
    count = count + floor(remaining/q);
    remaining = mod(remaining, q);
    count = count + floor(remaining/d);
    remaining = mod(remaining, d);
    count = count + floor(remaining/n);
    remaining = mod(remaining, n);
    count = count + floor(remaining/p);
    remaining = mod(remaining, p);
end

% Calculate average and print
avg = count/100;
fprintf('Average Number of Coins = %.2f\n', avg);