function [x, name, ufid] = SolveDiffEq(A, x0, max_k)
    % Purpose: (COMMENT)
    % Input Argument [A]: (COMMENT)
    % Input Argument [x0]: (COMMENT)
    % Output Argument [x]: (COMMENT)
  
    % Purpose: Computes the steady-state distribution of a Markov chain by solving x_{k+1} = A*x_k.
    % Input Argument [A]: Stochastic matrix representing transition probabilities (its rows sum to 1).
    % Input Argument [x0]: Initial probability vector (should sum to 1 too)
    % Output Argument [x]: Limiting probability vector as k approaches infinity (steady-state distribution)

    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % Default parameters
    if nargin < 3
        max_k = 1e4;  % Default: we have 10000 iterations
    end
    tol = 1e-8;       % Convergence tolerance

    % Initialize
    k = 0;
    x = x0;
    x_last = zeros(size(x0));

    % Iterate through 
    while norm(x - x_last) > tol && k < max_k
        x_last = x;
        x = A * x;
        k = k + 1;
    end
end





   
