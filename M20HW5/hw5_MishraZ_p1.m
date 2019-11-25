%Script: The Split-and-Average Problem.
%Zubin Mishra, 604644805
%This script uses the split-and-average approach to subdivide and smooth 
%surfaces.

% Clean up the MATLAB workspace
clear all;
clc;
clf;

%Establish x, y, and weight arrays
x = [0.5, 0, 0.5, 1];
y = [0, 0.5, 1, 0.5];
w = [1, 2, 1];

%plot initial x,y coords
plot(x, y, '.', 'MarkerSize', 10);
hold on;
 
%Set convergence condition to false and count to 0
converge = false;
i=0;

%While loop
while (~converge && i<100)
    %Split and average, set x and y
    xs = splitPts(x);
    ys = splitPts(y);
    xa = averagePts(xs, w);
    ya = averagePts(ys, w);
    x = xa;
    y = ya;
    
    %Determine convergence condition
    dx = xa - xs;
    dy = ya - ys;
    converge = (max(sqrt(dx.^2+dy.^2)) < 10^-3);
    
    %Increment count
    i = i+1;
end

%Plot final arrays
plot(x, y, '.', 'MarkerSize', 10);
title('Split-and-Average Plot');
xlabel('X');
ylabel('Y');
legend('Initial','Final');