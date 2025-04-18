function [x, name, ufid]  = CramersRule(A, b)
    % Purpose: (Solve the system Ax = b using Cramer's Rule for a square
    % matrix)
    % Input Argument [A]: Coefficient matrix (must be square).
    % Input Argument [b]: right-hand side column vector.
    % Output Argument [x]: a solution vector (NaN if A is non-square or singular).


    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    [m, n] = size(A); % # of rows and columns of A, respectively

    % Use CramersRule3x3.m as a guide to write this new function.
    % Hint: Use a for-loop.

    % Check if A is non-square according to the instruction
    if m ~= n
        x = NaN(n, 1); 
        return;
    end

    % Check if b is compatible with A
    if length(b) ~= n
        error('b must be a column vector of (compatible size) with A.');
    end

    % Compute the determinant of A
    detA = det(A);

    % Check if A is singular (determinant close to zero)
    % (similar to the 3*3)
    % Close to singular (so we can't apply Cramer's rule)
    if abs(detA) <= 1e-8
        x = NaN(n, 1); % Return NaN if A is singular
        return;
    end

    % Initialize the solution vector (we should do that to allocate stuff)
    x = zeros(n, 1);

    % Apply Cramer's Rule
    for i = 1:n
        % Create a modified matrix where the i-th column is replaced by b
        Ai = A;
        Ai(:, i) = b;

        % Compute the determinant of the modified matrix
        detAi = det(Ai);

        % Compute x(i) using Cramer's Rule
        x(i) = detAi / detA;
    end
end


