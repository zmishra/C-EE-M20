function [ dfx ] = dfx_exact( x )
%Gets the exact derivative
    dfx = zeros(1, length(x));
    for i = 1:length(x);
        dfx(i) = -2*x(i)/5*exp(-(x(i)^2)/5)*cos(5*x(i))-5*exp(-(x(i)^2)/5)*sin(5*x(i));
    end
end

