%Script: The Shared Birthday Problem
%Zubin Mishra, 604644805
%This script finds how many peope are required in a group before it is more
%likely than not that any two of the their birthdays occur in the same week.

% Clean up the MATLAB workspace
clear all;
clc;

% Set up array to hold trial results
n = zeros(1,10^4);

% For loop for trials
for k = 1:10^4
    % Initialize while loop condition and empty birthday array
    match = false;
    r =  double.empty;
    
    % While loop
    while (~match)
        % Add a birthday
        r(length(r)+1) = ceil(365*rand);
        
        % Test if two birthdays are within 7 days of each other
        match = isMatch(r);
    end
    
    % Put size of group into trial result array
    n(k) = length(r);
end
% Print out results and plot histogram
fprintf('Median Number of People = %02.0f\n',median(n));
histogram(n)
title('Sizes of Groups');
xlabel('Size');
ylabel('Frequency');