function [xc, converge] = NewtonI(f, g, x0, delta, fgEvalMax)
% f is a HANDLE to a continuous function, f(x), of a single variable.
% g is a HANDLE to a continuous function, g(x), of a single variable.
% x0 is an initial guess to a root of f.
% delta is a positive real number.
% fgEvalsMax is a positive integer >= 2 that indicates the maximum
% number of (f-g)-evaluations allowed.
%
% Newton's method is repeatedly applied until the current iterate, xc,
% has the property that |(f-g)(xc)| <= delta. If that is not the case
% after fgEvalsMax function evaluations, then xc is the current iterate.
%
% This routine computes the derivative of (f-g) at each iterate xc by
% using a central difference approximation with small perturbation size.
%
% Converge is the boolean value if convergence was found or not.
    % Establish values to be used for Newton's method
    h = 10^-5;
    xc = x0;
    fgEvals = 0;
    converge = false;
    loopCondition = true;
    
    % While loop for Newton's method
    while loopCondition && fgEvals ~= fgEvalMax   
        % Calculate derivate with central difference approximation
        dfg = ((f(xc+h)-g(xc+h))-(f(xc-h)-g(xc-h)))/(2*h);
        
        % Find next x-value to examine
        xc = xc - (f(xc)-g(xc))/dfg;
        
        % Check accuracy condition
        if abs(f(xc)-g(xc)) <= delta
            loopCondition = false;
            converge = true;
        end
        
        % Increment number of evals
        fgEvals = fgEvals + 1;
    end

end


