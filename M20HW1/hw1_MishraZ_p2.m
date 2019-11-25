%Script: Ellipse Perimeter Predictions
%Zubin Mishra, 604644805
%This script uses several different formulae to predict the perimeter of an
%ellipse.

% Clean up the MATLAB workspace
clear all;
clc;

% Assign the variables a and b (x/a)^2 + (y/b)^2 = 1
a = input('Please enter a value for A: ');
b = input('Please enter a value for B: ');

% Calculate h and P1-P8;
h = ((a-b)/(a+b))^2;
P1 = pi*(a+b);
P2 = pi*sqrt(2*(a^2+b^2));
P3 = pi*sqrt(2*(a^2+b^2)-(a-b)^2/2);
P4 = pi*(a+b)*(1+h/8)^2;
P5 = pi*(a+b)*(1+3*h/(10+sqrt(4-3*h)));
P6 = pi*(a+b)*(64-3*h^2)/(64-16*h);
P7 = pi*(a+b)*(256-48*h-21*h^2)/(256-112*h+3*h^2);
P8 = pi*(a+b)*((3-sqrt(1-h))/2);

%Print out values
fprintf('P1 = %.16f\n', P1);
fprintf('P2 = %.16f\n', P2);
fprintf('P3 = %.16f\n', P3);
fprintf('P4 = %.16f\n', P4);
fprintf('P5 = %.16f\n', P5);
fprintf('P6 = %.16f\n', P6);
fprintf('P7 = %.16f\n', P7);
fprintf('P8 = %.16f\n', P8);
fprintf('h = %.16f\n', h);