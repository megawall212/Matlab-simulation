function [x] = ParticularSolution(A, b)
    % Purpose: Find a particular solution of Ax=b.
    % Input Argument [A]: a 3x3 coefficient matrix
    % Input Argument [b]: a column vector in R^3
    % Output Argument [sol]: a particular solution of Ax=b (empty if system is inconsistent)

    [~, n] = size(A);
    [reduced, pivcols] = rref([A b]);

    % If the last column of [A b] is a pivot column, then Ax=b has no solution.
    if max(pivcols) == n + 1
        x = []; %no solution
    elseif rank(A) == n % Ax=b has a unique solution (no free variables)
        x = reduced(1:n, n + 1);
    else % Infinitely many solutions (so pick the one you can read off easily)
        x = zeros(n, 1); % Each variable is 0...

        % ... unless it's a pivot.
        x(pivcols) = reduced(1:length(pivcols), n + 1);
    end
end
