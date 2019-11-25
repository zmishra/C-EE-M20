%Script: DNA Analysis
%Zubin Mishra, 604644805
%This script finds the protein-coding segments of a strand of DNA and
%prints out information about their lengths.

% Clean up the MATLAB workspace
clear all;
clc;

% Load DNA
load('chr1_sect.mat');

% Initial values
stop_found = true;
lengths = double.empty;
taa = 0;
tag = 0;
tga = 0;

% For loop
for i = 1:3:length(dna)
    %Finds start
    if stop_found && dna(i) == 1 && dna(i+1) == 4 && dna(i+2) == 3
        start = i;
        stop_found = false;
    end
    
    %Finds stop
    if ~stop_found && dna(i) == 4
        if (dna(i+1) == 1 && (dna(i+2) == 1 || dna(i+2) == 3)) || (dna(i+1) == 3 && dna(i+2) == 1)
            if dna(i+1) == 1 && dna(i+2) == 1
                taa = taa + 1;
            end
            if dna(i+1) == 1 && dna(i+2) == 3
                tag = tag + 1;
            end
            if dna(i+1) == 3 && dna(i+2) == 1
                tga = tga + 1;
            end
            stop = i + 2;
            stop_found = true;
            lengths(length(lengths)+1) = stop - start + 1;
        end
    end
end

%Print out results
fprintf('Total Protein-Coding Segments: %.0f\n', length(lengths));
fprintf('Average Length: %.2f\n', mean(lengths));
fprintf('Maximum Length: %.0f\n', max(lengths));
fprintf('Minimum Length: %.0f\n', min(lengths));