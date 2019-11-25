%Script: Newton's Method
%Zubin Mishra, 604644805
%This script performs Newton's method on a particular function at several
%different initial guesses.

% Clean up the MATLAB workspace
clear all;
clc;

% Establish the function handle and the x0 range
f = @(x) 816*x.^3 - 3835*x.^2 + 6000*x - 3125;
x0 = linspace(1.43, 1.71, 29);

% Run Newton's method for each x0 and print out results
for i = 1:29
    [x n] = Newton(f, x0(i), 10^-7, 20);
    fprintf('x0 = %0.2f, evals = %2.0f, xc = %0.6f\n', x0(i), n, x);
end