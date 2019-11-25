function [ W ] = makeWall( x1, y1, x2, y2, lambda, ID )
% makeWall Create a point in the plane
% W = makeWall(...) creates a linear wall structure from the specified
% coordinates (x1, y1) and (x2, y2). These are stored in fields W.x1, W.y1,
% W.x2, and W.y2. Also stored are the wall's lambda value and ID in 
% W.lambda and W.ID. The coordinates are used to store the wall's angle in
% W.phi.
W = struct('end1', [x1 y1], 'end2', [x2 y2], 'phi', atan((y2-y1)/(x2-x1)), 'lambda', lambda, 'ID', ID);
end
