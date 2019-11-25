function [ dfx ] = dfx_central( x, h )
%Gets the central difference approximations
    dfx = zeros(1, length(x));
    for i = 1:length(x);
        dfx(i) = ((exp(-(x(i)+h)^2/5)*cos(5*(x(i)+h)))-(exp(-(x(i)-h)^2/5)*cos(5*(x(i)-h))))/(2*h);
    end
end

