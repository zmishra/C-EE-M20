%Script: Binary Addition
%Zubin Mishra, 604644805
%This script takes in two integers as input and converts them to binary,
%adds them in binary, converts the result back to decimal, and prints out 
%the results 

% Clean up the MATLAB workspace
clear all;
clc;

%Prompt for input
A = input('Please enter the value for A: ');
B = input ('Please enter the value for B: ');

%Check validity
if (mod(A,1) ~= 0 || A < 0 || A > 7)
    error('A input error');
end

if (mod(B,1) ~= 0 || B < 0 || B > 7)
    error('B input error');
end

%Convert to binary 
A_bin = zeros(1, 3);

A_=A; %A_ and B_ are used so A and B are not changed
i = 1;
while (A_ ~= 0)
    A_bin(i) = mod(A_, 2);
    A_ = floor(A_/2);
    i = i + 1;
end

B_bin = zeros(1, 3);
B_=B;
i = 1;
while (B_ ~= 0)
    B_bin(i) = mod(B_, 2);
    B_ = floor(B_/2);
    i = i + 1;
end

%Add
carryover = zeros(1, 4);
sum = zeros(1, 4);

for i = 1:3
    sum(i) = xor(xor(A_bin(i), B_bin(i)),carryover(i));
    carryover(i+1) = and(A_bin(i), B_bin(i)) || carryover(i);
end
sum(4) = carryover(4);

%Convert to decimal
dec = sum(1) + sum(2)*2 + sum(3)*4 + sum(4)*8;

%Output
fprintf('The decimals provided are A = %.0f and B = %.0f\n', A, B);
fprintf('Conversion of A to binary: %.0f%.0f%.0f\n', A_bin(3), A_bin(2), A_bin(1));
fprintf('Conversion of B to binary: %.0f%.0f%.0f\n', B_bin(3), B_bin(2), B_bin(1));
fprintf('A plus B in binary is: %.0f%.0f%.0f%.0f\n', sum(4), sum(3), sum(2), sum(1));
fprintf('A plus B in decimal is: %.0f\n', dec);