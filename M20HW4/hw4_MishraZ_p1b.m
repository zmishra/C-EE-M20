%Script: SIR Model for Infection (Part B)
%Zubin Mishra, 604644805
%This script simulates the process of spreading disease.

% Start timer
tic

% Clean up the MATLAB workspace
clear all;
clc;
clf;

% Set up the time-stepping parameters
deltat = 0.005;
tFinal = 60;
tSteps = ceil(tFinal/deltat);
t = linspace(0,tFinal,tSteps+1);

% Coefficients
gamma = 0.1;
beta = 0.5;

% Set the initial values
s = zeros(1, tSteps+1);
i = zeros(1, tSteps+1);
r = zeros(1, tSteps+1);
s(1) = (4000000-50)/4000000;
i(1) = 50/4000000;
r(1) = 0;

% For loop
for k = 1:tSteps
    s(k+1) = s(k)+deltat*(-beta*i(k)*s(k));
    i(k+1) = i(k)+deltat*(beta*i(k)*s(k)-gamma*i(k));
    r(k+1) = r(k)+deltat*(gamma*i(k));
end

% Plot
plot(t, s)
hold on
plot(t, i)
plot(t, r)
title('Normalized Susceptiple, Infected, and Removed Populations vs. Time');
xlabel('Time (days)');
ylabel('Normalized Population');
legend('Susceptible', 'Infected', 'Removed');

% Print out results
fprintf('Final Size of Population Groups\n');
fprintf('Susceptible: %.2f million\n', s(length(s))*4);
fprintf('Infected: %.2f million\n', i(length(i))*4);
fprintf('Removed: %.2f million\n', r(length(r))*4);

% Stop timer
toc;
