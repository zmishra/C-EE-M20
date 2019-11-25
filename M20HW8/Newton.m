function [xc, fEvals] = Newton(f, x0, delta, fEvalMax)
% f is a HANDLE to a continuous function, f(x), of a single variable.
% x0 is an initial guess to a root of f.
% delta is a positive real number.
% fEvalsMax is a positive integer >= 2 that indicates the maximum
% number of f-evaluations allowed.
%
% Newton's method is repeatedly applied until the current iterate, xc,
% has the property that |f(xc)| <= delta. If that is not the case
% after fEvalsMax function evaluations, then xc is the current iterate.
%
% This routine computes the derivative of f at each iterate xc by
% using a central difference approximation with small perturbation size.
%
% fEvals is the number of f-evaluations required to obtain xc

    % Establish values to be used for Newton's method
    h = 10^-5;
    xc = x0;
    fEvals = 0;
    loopCondition = true;
    
    % While loop for Newton's method
    while loopCondition && fEvals ~= fEvalMax   
        % Calculate derivate with central difference approximation
        df = (f(xc+h)-f(xc-h))/(2*h);
        
        % Find next x-value to examine
        xc = xc - f(xc)/df;
        
        % Check accuracy condition
        if abs(f(xc)) <= delta
            loopCondition = false;
        end
        
        % Increment number of evals
        fEvals = fEvals + 1;
    end

end
