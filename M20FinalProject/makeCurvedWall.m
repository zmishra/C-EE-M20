function [ W ] = makeCurvedWall( x1, x2, f, lambda, ID )
% makeCurvedWall Create a point in the plane
% W = makeCurvedWall(...) creates a curved wall structure from the specified
% domain x1 and x2. These are stored in fields W.x1 and W.x2. Also stored 
% are the wall's lambda value and ID in W.lambda and W.ID. The wall's
% determining function is stored as a handle in W.f.
W = struct('end1', x1, 'end2', x2, 'f', f, 'lambda', lambda, 'ID', ID);
end

