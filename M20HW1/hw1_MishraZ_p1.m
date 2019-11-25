%Script: Nested Polyhedrons
%Zubin Mishra, 604644805
%This script calculates and displays the edge length, inradius, and
%outradius of several nested polyhedrons.

% Clean up the MATLAB workspace
clear all;
clc;

% Calculate tetrahedron values
E_T = 1/(sqrt(6)/4);
r_T = sqrt(6)/12*E_T;
R_T = 1;

% Calculate cube values
E_C = r_T/(sqrt(3)/2);
r_C = 1/2*E_C;
R_C = r_T;

% Calculate octahedron values
E_O = r_C/(sqrt(2)/2);
r_O = sqrt(6)/6*E_O;
R_O = r_C;

% Calculate dodecahedron values
E_D = r_O/((sqrt(15)+sqrt(3))/4);
r_D = sqrt(250+110*sqrt(5))/20*E_D;
R_D = r_O;

% Calculate icosahedron values
E_I = r_D/(sqrt(10 + 2*sqrt(5))/4);
r_I = sqrt(42+18*sqrt(5))/12*E_I;
R_I = r_D;

% Print out a table
fprintf('\t\t\t\tInradius\tOutradius\tEdge Length\n');
fprintf('\t\t\t\t________\t_________\t___________\n\n');
fprintf('Tetrahedron\t\t%.6f\t%.6f\t%.6f\n', r_T, R_T, E_T);
fprintf('Cube\t\t\t%.6f\t%.6f\t%.6f\n', r_C, R_C, E_C);
fprintf('Octahedron\t\t%.6f\t%.6f\t%.6f\n', r_O, R_O, E_O);
fprintf('Dodecahedron\t%.6f\t%.6f\t%.6f\n', r_D, R_D, E_D);
fprintf('Icosahedron\t\t%.6f\t%.6f\t%.6f\n', r_I, R_I, E_I);