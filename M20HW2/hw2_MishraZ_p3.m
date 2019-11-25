%Script: Classifying Cubic Functions
%Zubin Mishra, 604644805
%This script takes in the coefficients of a cubic function as input and
%classifies it as monotone, simple, or not simple. 

% Clean up the MATLAB workspace
clear all;
clc;

% Assign the variables a, b, c, and d ax^3 + bx^2 + cx + d = 0
a = input('Please enter a value for A: ');
b = input('Please enter a value for B: ');
c = input('Please enter a value for C: ');
d = input('Please enter a value for D: ');

%Find the discriminant
discrim = (2*b)^2 - 4*(3*a)*c;

%Evaluate discriminant and output
fprintf('a = %10.6f\nb = %10.6f\nc = %10.6f\nd = %10.6f\n\n', a, b, c, d);
if (discrim < 0)
    fprintf('Monotone\n');
else
    r1 = (-(2*b)+sqrt((2*b)^2-4*(3*a)*c))/(2*(3*a));
    r2 = (-(2*b)-sqrt((2*b)^2-4*(3*a)*c))/(2*(3*a));
    q1 = a*r1^3 + b*r1^2 + c*r1 + d;
    q2 = a*r2^3 + b*r2^2 + c*r2 + d;
    simple = (q1*q2<0);
    fprintf('r1 = %10.6f\n', r1);
    fprintf('q(r1) = %10.6f\n', q1);
    fprintf('r2 = %10.6f\n', r2);
    fprintf('q(r2) = %10.6f\n', q2);
    if simple
        fprintf('Function q is simple.\n');
    else
        fprintf('Function q is NOT simple.\n');
    end
end