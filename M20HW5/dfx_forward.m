function [ dfx ] = dfx_forward( x, h )
%Gets the forward difference approximation
    dfx = zeros(1, length(x));
    for i = 1:length(x);
        dfx(i) = ((exp(-(x(i)+h)^2/5)*cos(5*(x(i)+h)))-(exp(-(x(i))^2/5)*cos(5*(x(i)))))/h;
    end
end

