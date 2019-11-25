%Script: The Ranked-Choice Vote
%Zubin Mishra, 604644805
%This script performs a ranked-choice vote counting process on a large set
%of election data until a winner has been found.

% Clean up the MATLAB workspace
clear all;
clc;

% Load in votes
load('votes1.mat');

% Weighted sum vote-counting process
ws_counts = zeros(max(max(votes)),1);
for j = 1:size(votes, 2)
    for i = 1:size(votes, 1)
        ws_counts(votes(i, j)) = ws_counts(votes(i, j)) + (size(votes,2)-j+1);
    end
end

% Initial conditioms set
loopCondition = true;
loopCount = 1;
counts = zeros(max(max(votes)),1);

% Print out top line of table
fprintf('\t\t\t\t');
for k = 1:max(max(votes))
    fprintf('%0.0f\t\t',k);
end
fprintf('\n');

%While loop until winner is found
while loopCondition
    % Reset counts to 0
    counts(:) = 0;
    
    % Count votes
    for i = 1:size(votes, 1)
        counts(votes(i, 1)) = counts(votes(i, 1)) + 1;
    end
    
    % If no majority remove the losing candidate
    if max(counts)/sum(counts) <= 0.5
        minimum = min(counts(counts>0));
        for j = 1:length(counts)
            if counts(j) == minimum
                losingCandidate = j;
                %break; %First losing candidate found is removed
            end
        end
        votes = removeCandidate(votes, losingCandidate);
    else
        loopCondition = false;
    end
    
    % Print out the results of the round
    fprintf('Round %.0f Totals:\t', loopCount);
    for k = 1:max(max(votes))
        if length(num2str(counts(k))) < 4
            fprintf('%0.0f\t\t',counts(k));
        else
            fprintf('%0.0f\t',counts(k));
        end
    end
    fprintf('\n');
    
    % Increment the loop counter
    loopCount = loopCount + 1;
end

% Print out the winner
[maximum winner] = max(counts);
fprintf('Winning Candidate: %0.0f\n', winner);


