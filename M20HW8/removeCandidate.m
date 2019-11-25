function votes = removeCandidate(votes, losingCandidate)
%votes is the voting data to be modified (input)
%losingCandidate is the number of the candidate to be removed from votes
%
%removeCandidate will go through votes and will add all entries that are
%not losingCandidate to a new votes 2D array. The new 2D array is then
%returned as votes.

    % Establish new 2D array to hold the new votes array
    newVotes = zeros(size(votes, 1), size(votes, 2)-1);
    
    % For loops to iterate through the input votes
    for i = 1:size(votes, 1)
        % Keep track of the position you are at in the new 2D array
        pos = 1;
        for j = 1:size(votes, 2)
            % Only add candidates that are not losingCandidate
            if votes(i, j) ~= losingCandidate
                newVotes(i, pos) = votes(i, j);
                pos = pos + 1;
            end
        end
    end
    
    % Return the nnew 2D array
    votes = newVotes;
end

