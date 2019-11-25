function [ xa ] = averagePts( xs, w )
%Performs averaging
    if sum(w) == 0
        error('sum(w) = 0');
    end
    norm_w = w/sum(w);
    xa = zeros(1, length(xs));
    xa(1) = norm_w(1)*xs(length(xs)) + norm_w(2)*xs(1) + norm_w(3)*xs(2);
    for i = 2:length(xs)-1
        xa(i) = norm_w(1)*xs(i-1) + norm_w(2)*xs(i) + norm_w(3)*xs(i+1);
    end
    xa(length(xa)) = norm_w(1)*xs(length(xs)-1) + norm_w(2)*xs(length(xs)) + norm_w(3)*xs(1);
end

