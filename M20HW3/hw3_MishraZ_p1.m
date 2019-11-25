%Script: The Three Species Problem
%Zubin Mishra, 604644805
%This script models the population of three interacting, competing species as
%functions of time.

% Start timer
tic;

% Clean up the MATLAB workspace
clear all;
clc;

% Set up the lotka-volterra coefficients
a = 1.2;
b = -1.3;
c = -0.7;
d = 1;
e = -0.8;
f = -1.2;
g = 0.8;
h = -1.1;
i = -0.9;

% Set the initial populations
x_old = 2;
y_old = 2.5;
z_old = 3;

%Initial print-out
fprintf('Time\t  X\t     Y\t    Z\n');
fprintf(' %.1f   %.2f   %.2f   %.2f\n', 0, x_old, y_old, z_old);

% Set up the time-stepping parameters
deltat = 0.01;
tFinal = 10;
tSteps = ceil(tFinal/deltat);

% Start FOR loop
for k = 1:tSteps
    % Solve for population values one timestep in the future
    x_new = x_old + deltat*(a*x_old*(1-x_old/4) + b*x_old*y_old + c*x_old*z_old);
    y_new = y_old + deltat*(d*y_old*(1-y_old/5) + e*x_old*y_old + f*y_old*z_old);
    z_new = z_old + deltat*(g*z_old*(1-z_old/6) + h*x_old*z_old + i*y_old*z_old);
    
    % Update old values to reflect most recent calculation
    x_old = x_new;
    y_old = y_new;
    z_old = z_new;
    
    % Data output (so we can observe the populations over time)
    if (mod(k*deltat*2,1)==0)
        if (k*deltat == 10)
            fprintf('%.1f   %.2f   %.2f   %.2f\n', k*deltat, x_old, y_old, z_old);
        else
            fprintf(' %.1f   %.2f   %.2f   %.2f\n', k*deltat, x_old, y_old, z_old);
        end
    end
end

% End timer
toc;