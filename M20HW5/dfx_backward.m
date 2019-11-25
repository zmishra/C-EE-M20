function [ dfx ] = dfx_backward( x, h )
%Gets the backwards difference approximations
    dfx = zeros(1, length(x));
    for i = 1:length(x);
        dfx(i) = ((exp(-(x(i))^2/5)*cos(5*(x(i))))-(exp(-(x(i)-h)^2/5)*cos(5*(x(i)-h))))/h;
    end
end
