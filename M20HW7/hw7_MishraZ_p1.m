%Script: The Game of Life
%Zubin Mishra, 604644805
%This script simulates living cells using the rules from mathematician John
%Conway’s famous “Game of Life.”

% Clean up the MATLAB workspace
clear all;
clc;

% Establish size of grid and total living cells array
num_rows = 150;
num_cols = 200;
living = zeros(1, 300);

% Create grid, place living cells, and find total living cells
A = zeros(num_rows, num_cols);
for i = 1:num_rows
    for j = 1:num_cols
        if (ceil(10*rand) == 1)
            A(i,j) = 1;
        end
    end
end
living(1) = sum(sum(A));

% Draw initial distribution
figure
imagesc(A);
title('Generation 0');

% For loop for 300 generations
figure
for k = 1:300
    % Create new grid
    A_new = zeros(num_rows, num_cols);
    
    % For each cell
    for col = 1:num_cols
        for row = 1:num_rows
            % Find neighbor indices
            N = row-1;
            S = row+1;
            E = col+1;
            W = col-1;
            if N == 0
                N = num_rows;
            end
            if S == num_rows+1
                S = 1;
            end
            if E == num_cols+1
                E = 1;
            end
            if W == 0
                W = num_cols;
            end
            
            % Find number of living neighbor cells
            sum_ = A(N, col) + A(S, col) + A(row, E) + A(row, W)...
                + (A(N, E) + A(N, W) + A(S, E) + A(S, W));
            
            % Use result to determine cell status of next generation
            if A(row, col) == 1 && ~(sum_ < 2 || sum_ > 3)
                A_new(row, col) = 1;
            elseif A(row,col) == 0 && sum_ == 3
                A_new(row, col) = 1;
            end
        end
    end
    % Update grid
    A = A_new;
    
    % Draw grid
    imagesc(A);
    title(['Generation ', num2str(k)]);
    drawnow;
    
    % Input total number of living cells
    living(k+1)=sum(sum(A));
end

% Plot total number of living cells against generation number
figure
plot(linspace(0, 300, 301), living);
title('Number of Living Cells vs. Time');
xlabel('Time (Generation #)');
ylabel('Number of Living Cells');
