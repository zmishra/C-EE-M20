%Script: Final Project - Ray casting
%Zubin Mishra, 604644805
%This script draws walls and performs a ray casting procedure on them.

% Clean up the MATLAB workspace
clear all;
clc;
clf;
tic

% Set up walls: w for straight walls, cw for curved walls
w(1) = makeWall(-10, -10, -10, 10, .9, 1);
w(1) = [];
cw(1) = makeCurvedWall(-4, 4, @(x) (16-x.^2), .9, 5);
cw(1) = [];

% w1-4 simple case, w5-6 add differenct absorbance, cw1 add quadratic wall
    % w(1) = makeWall(-10, -10, -10, 10, .9, 1);
    % w(2) = makeWall(-10, 10, 10, 10, .9, 2);
    % w(3) = makeWall(10, 10, 10, -10, .9, 3);
    % w(4) = makeWall(10, -10, -10, -10, .9, 4);
    % w(5) = makeWall(0, 0, 5, 5, .125, 5);
    % w(6) = makeWall(0, 0, -5, 5, .125, 6);
    % cw(1) = makeCurvedWall(-10, 10, @(x) -1/20*(x-10).^2 + 10, .9, 5);

% Cubic
%     w(1) = makeWall(2, 0, 2, -10, .9, 2);
%     w(2) = makeWall(2, -10, 10, -10, .9, 3);
%     w(3) = makeWall(10, -10, 10, 0, .9, 4);
%     cw(1) = makeCurvedWall(2, 10, @(x) (x-2).*(x-10).*(x-5)./10, .9, 5);
%     w(4) = makeWall(4, -4, 4, -6, .9, 6);
%     w(5) = makeWall(4, -6, 6, -6, .9, 7);
%     w(6) = makeWall(6, -6, 6, -4, .9, 8);
%     w(7) = makeWall(6, -4, 4, -4, .9, 9);

% Only curved walls
%     cw(1) = makeCurvedWall(-4, 4, @(x) (16-x.^2), .9, 5);
%     cw(2) = makeCurvedWall(-4, 4, @(x) -(16-x.^2), .9, 6);
%     cw(3) = makeCurvedWall(-2, 2, @(x) (4-x.^2), .9, 7);
%     cw(4) = makeCurvedWall(-2, 2, @(x) -(4-x.^2), .9, 8);

% Complex case
    w(1) = makeWall(5.0, 0.0, 0.0, 0.0, 0.9, 1);
    w(2) = makeWall(0.0, 0.0, 0.0, 13.0, 0.9, 2);
    w(3) = makeWall(0.0, 13.0, 4.0, 13.0, 0.9, 3);
    w(4) = makeWall(5.0, 13.0, 6.0, 13.0, 0.9, 4);
    w(5) = makeWall(7.0, 13.0, 8.0, 13.0, 0.9, 5);
    w(6) = makeWall(8.0, 13.0, 8.0, 15.0, 0.9, 6);
    w(7) = makeWall(8.0, 15.0, 15.0, 15.0, 0.9, 7);
    w(8) = makeWall(15.0, 15.0, 15.0, 11.0, 0.9, 8);
    w(9) = makeWall(15.0, 10.0, 15.0, 9.0, 0.9, 9);
    w(10) = makeWall(15.0, 8.0, 15.0, 7.0, 0.9, 10);
    w(11) = makeWall(15.0, 6.0, 15.0, 5.0, 0.9, 11);
    w(12) = makeWall(15.0, 4.0, 15.0, 0.0, 0.9, 12);
    w(13) = makeWall(8.0, 9.0, 8.0, 2.0, 0.9, 13);
    w(14) = makeWall(3.0, 13.0, 3.0, 5.0, 0.9, 14);
    w(15) = makeWall(15.0, 0.0, 10.0, 0.0, 0.9, 15);
    w(16) = makeWall(8.0, 2.0, 10.0, 0.0, 0.9, 16);
    w(17) = makeWall(8.0, 2.0, 5.0, 0.0, 0.9, 17);

% Corner testing
%     w(1) = makeWall(0, 0, 1, 1, .9, 1);
%     w(2) = makeWall(0, 0, 1, -1, .9, 2);
%     w(3) = makeWall (-5, -5, -5, 5, .9, 3);

% Draw all walls
for i = 1:length(w)
    line([w(i).end1(1) w(i).end2(1)], [w(i).end1(2) w(i).end2(2)], 'LineWidth', 2);
end

for i = 1:length(cw)
    curved_x = linspace(cw(i).end1, cw(i).end2);
    line(curved_x, cw(i).f(curved_x), 'LineWidth', 2);
end

% Establish constant values
c = 50;
numRays = 50;
maxBounces = 5;
minIntensity = .1;
numSources = 1;

% For each source
for z = 1:numSources

% Set source point
[sx sy] = ginput(1);
source = [sx sy];

% Get all starting ray angles, can change range of angles with first 2
% parameters; if going from 0 to 2pi, change to numRays+1 to not double up
% rays
rayAngles = linspace(0, 2*pi, numRays);

% For each ray
for i = 1:numRays
    % Create ray struct
    r(i) = makeRay(source(1), source(2), rayAngles(i), 1);
    
    % Establish P3, P4, and initial values for ray tracing procedure
    P3 = [r(i).x r(i).y];
    P4 = P3 + c*[cos(r(i).theta) sin(r(i).theta)];
    nextPoint = P4;
    bounces = 0;
    hitwall = -1;
    wall = -1;
    intersectionFound = false;
    
    % While the ray is still bouncing
    while (bounces <= maxBounces && r(i).intensity >= minIntensity)
        % For each straight walls
        for j = 1:length(w)
            % Get P1, P2
            P1 = w(j).end1;
            P2 = w(j).end2;
            
            % Calculate d, s, t ('slider' values)
            d = (P2(1)-P1(1))*(P4(2)-P3(2))-(P2(2)-P1(2))*(P4(1)-P3(1));
            s = ((P4(1)-P3(1))*(P1(2)-P3(2))-(P4(2)-P3(2))*(P1(1)-P3(1)))/d;
            t = ((P2(1)-P1(1))*(P1(2)-P3(2))-(P2(2)-P1(2))*(P1(1)-P3(1)))/d;
            
            % If intersection conditions are met, get potential
            % intersection
            if (((s >= 0 && s <= 1) || abs(s) < 10^-10 || abs(s-1) < 10^-10) && ((t >= 0 && t <= 1) || abs(t) < 10^-10) || abs(t-1) < 10^-10)
                intersection = P1 + s*(P2-P1);
                % If intersection is the closest one, update tracking
                % variables
                if norm(intersection - P3) < norm(nextPoint - P3) && w(j).ID ~= hitwall
                    nextPoint = intersection;
                    wall = w(j).ID;
                    phi = w(j).phi;
                    lambda = w(j).lambda;
                    intersectionFound = true;
                end
            end
        end
        
        % For curved walls
        % Get line function and domain
        g = @(x) tan(r(i).theta)*(x - P3(1)) + P3(2);
        domain_max = max([P4(1) P3(1)]);
        domain_min = min([P4(1) P3(1)]);
        for j = 1:length(cw)
            % Initial values for Newton's method
            x0 = linspace(cw(j).end1, cw(j).end2, 20);
            % For each initial value, do Newton's method
            for k = 1:length(x0)
                [xr inter] = NewtonI(cw(j).f, g, x0(k), 10^-9, 50);
                % Vertical line test
                if (abs(mod(r(i).theta - pi/2, pi)) < 10^-3 || abs(mod(r(i).theta - pi/2, pi)-pi) < 10^-3)
                    xr = P3(1);
                    inter = 1;
                end
                % If interesection conditions are met, get potential
                % intersection
                if (inter == true && xr <= cw(j).end2 && xr >=cw(j).end1 && xr <= domain_max && xr >= domain_min && ((sin(r(i).theta) >= 0 && cw(j).f(xr) >= P3(2))||(sin(r(i).theta) <= 0 && cw(j).f(xr) <= P3(2))||abs(sin(r(i).theta)) < 10^-8))
                    intersection = [xr cw(j).f(xr)];
                    % If intersection is the closest one, update tracking
                    % variables
                    if norm(intersection - P3) < norm(nextPoint - P3) && ~(cw(j).ID == hitwall && norm(intersection - P3) < 10^-4)
                        nextPoint = intersection;
                        wall = cw(j).ID;
                        phi = atan((cw(j).f(xr+10^-5)-cw(j).f(xr-10^-5))/(2*10^-5));
                        lambda = cw(j).lambda;
                        intersectionFound = true;
                    end
                end
            end
        end  
        
        % Track which wall was hit and add the next point to the ray struct
        hitwall = wall;
        r(i).x(length(r(i).x)+1) = nextPoint(1);
        r(i).y(length(r(i).y)+1) = nextPoint(2);
        % If no intersection is found, go to the net ray
        if ~intersectionFound
            break;
        end
        % Reset P3, P4, adjust intensity, increment bounces, and reset
        % intersection tracking
        P3 = nextPoint;
        r(i).theta = -r(i).theta+2*phi;
        r(i).intensity = r(i).intensity*lambda;
        P4 = P3 + c*[cos(r(i).theta) sin(r(i).theta)];
        nextPoint = P4;
        bounces = bounces + 1;
        intersectionFound = false;
    end
end

% Draw all the rays
for i = 1:length(r)
    for j = 1:length(r(i).x)-1
        line([r(i).x(j) r(i).x(j+1)], [r(i).y(j) r(i).y(j+1)], 'Color', 'red');
        drawnow;
    end
end
end
toc
