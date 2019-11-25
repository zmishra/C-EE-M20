%Script: Numerical Differentiation
%Zubin Mishra, 604644805
%This script performs forward, backward, and central difference
%approximations of a function, then calculates and plots the errors.

% Clean up the MATLAB workspace
clear all;
clc;
clf;

%Set up x and h arrays and initializes error arrays
x = linspace(-5, 5, 100);
h = logspace(-1, -15, 50);
err_f = zeros(1, 50);
err_b = zeros(1, 50);
err_c = zeros(1, 50);

%Creates the exact derivative array
dfx_e = dfx_exact(x);

%For loop
for i = 1:50;
    %Performs difference approximations
    dfx_f = dfx_forward(x, h(i));
    dfx_b = dfx_backward(x, h(i));
    dfx_c = dfx_central(x, h(i));
    
    %Calculates the error for a h value
    err_f(i) = mean(abs(dfx_f-dfx_e));
    err_b(i) = mean(abs(dfx_b-dfx_e));
    err_c(i) = mean(abs(dfx_c-dfx_e));
end

%Plots errors against h
loglog(h, err_f);
hold on;
plot(h, err_b);
plot(h, err_c);
title('Error vs. Increment');
xlabel('Increment');
ylabel('Error');
legend('Forward Difference Approximation', 'Backward Difference Approximation', 'Central Difference Approximation');