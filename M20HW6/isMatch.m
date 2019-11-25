%Script: The Shared Birthday Problem
%Function: isMatch
%Zubin Mishra, 604644805
%This function checks an array of birthdays for two days within 7 days of
%each other.

function [ bool ] = isMatch( r )
%Returns true if the array r has at least two days that are within 7 days 
%of each other, and false otherwise. Assumes that days are given as
%integers 1-365.

    bool = false; %Assume there is no match at first
    if length(r) > 1
        for i = 1:length(r)-1
            for j = i+1:length(r)
              if abs(r(i)-r(j)) < 7 || abs((r(i)-365) - r(j)) < 7 || abs((r(j)-365) - r(i)) < 7 %last two parts of the if statement handle wrap-around
                  bool = true;
              end
            end
        end
    end
    
end

