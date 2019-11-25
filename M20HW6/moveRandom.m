%Script: Random Walker Collisions
%Function: moveRandom
%Zubin Mishra, 604644805
%This function performs the walkers' random moves.

function [ p ] = moveRandom( P )
% Returns a point p = [x y] gotten from moving from point P randomly 1 
% space or no spaces on a 2D grid. Assumes an 11x11 bounded region from -5
% to 5 for x and y.

    % Establish 2D array of directions to choose from
    dir = [[0, 0];[0, 1];[0, -1];[1, 0];[-1, 0]];
    
    % Get random direction
    dir_P = ceil(5*rand);

    % Check if P will be in bounds after moving
    temp_P = P + dir(dir_P,:);
    if temp_P(1) >= -5 && temp_P(1) <= 5 && temp_P(2) >= -5 && temp_P(2) <= 5
        p = temp_P;
    else
        p = P;
    end
end

