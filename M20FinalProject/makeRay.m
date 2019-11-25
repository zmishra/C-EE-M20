function [ R ] = makeRay( x, y, theta, intensity )
% makeRay Create a point in the plane
% R = makeRay(...) creates a ray structure from the specified
% arrays x and y. These are stored in fields R.x and R.y,
% respectively. The ray's current direction is stored in R.theta and its
% intensity is stored in R.intensity.
R = struct('x', x, 'y', y, 'theta', theta, 'intensity', intensity);
end

