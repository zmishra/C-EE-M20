function [ xs ] = splitPts( x )
%Performs splitting algorithm
    xs = zeros(1, 2*length(x));
    for i = 1:length(x)
        xs(2*i-1) = x(i);
        if i < length(x)
            xs(2*i) = (x(i) + x(i+1))/2;
        else
            xs(2*i) = (x(i)+x(1))/2;
        end
    end 
end