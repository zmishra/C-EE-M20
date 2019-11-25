%Script: Roots of a Cubic Equation
%Zubin Mishra, 604644805
%This script takes in the coefficients of a cubic equation and finds and
%displays its roots.

% Clean up the MATLAB workspace
clear all;
clc;

% Assign the variables a, b, c, and d ax^3 + bx^2 + cx + d = 0
a = input('Please enter a value for A: ');
b = input('Please enter a value for B: ');
c = input('Please enter a value for C: ');
d = input('Please enter a value for D: ');

% Calculate p and q
p = (3*a*c-b^2)/(3*a^2);
q = (2*b^3-9*a*b*c+27*a^2*d)/(27*a^3);

% Calculate roots
r0 = 2*sqrt(-p/3)*cos(1/3*acos(3*q/(2*p)*sqrt(-3/p))-0*2*pi/3)-b/(3*a);
r1 = 2*sqrt(-p/3)*cos(1/3*acos(3*q/(2*p)*sqrt(-3/p))-1*2*pi/3)-b/(3*a);
r2 = 2*sqrt(-p/3)*cos(1/3*acos(3*q/(2*p)*sqrt(-3/p))-2*2*pi/3)-b/(3*a);

% Print out values
fprintf('a = % .2f\nb = % .2f\nc = % .2f\nd = % .2f\n\n', a, b, c, d);
fprintf('r0 = % .5f\nr1 = % .5f\nr2 = % .5f\n', r0, r1, r2);