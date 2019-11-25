%Script: Random Walker Collisions
%Zubin Mishra, 604644805
%This script simulates two people randomly walking within a confined area,
%finding how long it will take for them to meet.

% Clean up the MATLAB workspace
clear all;
clc;

% Set up resultant count array
counts = zeros(1, 5000);

% For loop
for i = 1:5000
    %Set intial while condition, inital conditions for A and B, and for
    %number of moves
    collision = false;
    A = [-5, 0];
    B = [5, 0];
    count = 0;
    
    % While loop
    while(~collision)
        % Move A and B randomly
        A = moveRandom(A);
        B = moveRandom(B);
        
        if (A == B)
            collision = true;
        end
        
        count = count + 1;
        
        % Cut-off at 1000
        if count == 1000
            collision = true;
        end
    end
    
    % Add count to the resultant counts array
    counts(i) = count;
end

% Print out results and plot
fprintf('Median = %02.0f\n',median(counts));
