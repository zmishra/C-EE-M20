%Script: Euler-Bernoulli Beam Bending
%Zubin Mishra, 604644805
%This script solves a system of equations to study the displacement of a 
%simply-supported aluminum beam subjected to a single point load.

% Clean up the MATLAB workspace
clear all;
clc;

% Establish constants
L = 1;
b = 0.03;
h = 0.06;
P = -500;
d = 0.7;
node_num = 20;

% Establish array of nodes, node distance, and M array
x = linspace(0,L,node_num);
dx = L/(node_num-1);
M = zeros(1, node_num);

% Calculate M, E, and I
for i = 1:node_num
    if x(i) <= d && 0 <= x(i)
        M(i) = -P*(L-d)*x(i)/L;
    else
        M(i) = -P*d*(L-x(i))/L;
    end
end
E = 70*10^9;
I = 1/12*b*h^3;

% Create and input values into matrix A
A = zeros(node_num);
A(1,1) = 1;
A(node_num, node_num) = 1;
for i = 2:node_num-1
    A(i,i-1) = 1;
    A(i, i) = -2;
    A(i, i+1) = 1;
end

% Create and calculate and input vaules into vector B
B = zeros(node_num, 1);
for i = 2:node_num-1
    B(i) = dx^2*M(i)/(E*I);
end

% Use matrix A and vector B to calculate vector y, the displacement
y = A\B;

% Plot the displacement
plot(x, y, 'o-');
title('Displacement vs. Position');
xlabel('Position (m)');
ylabel('Displacement (m)');

% Theoretical max displacement calculation
c = min(d, L-d);
y_max = P*c*(L^2-c^2)^1.5/(9*sqrt(3)*E*I*L);

% Model max displacement
[miny, index] = min(y);
minx = x(index);

% Error calculation
error = abs(y_max-miny);
