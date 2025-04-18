function [x] = CramersRule3x3(A, b)
    % Purpose: Solve the system Ax=b for a 3x3 matrix A using Cramer's Rule.
    % Input Argument [A]: a 3x3 coefficient matrix
    % Input Argument [b]: a column vector in R^3
    % Output Argument [x]: a solution to Ax=b (or NaN if A is close to singular)

    if abs(det(A)) <= 10^(-8) % Close to singular (so we can't apply Cramer's rule)
        x = NaN;
    else % Apply Cramer's Rule
        x = zeros(1, 3); % Allocate the (row) vector in advance

        B = A;
        B(:, 1) = b; % A_1(b)
        x(1) = det(B) / det(A);

        B = A;
        B(:, 2) = b; % A_2(b)
        x(2) = det(B) / det(A);

        B = A;
        B(:, 3) = b; % A_3(b)
        x(3) = det(B) / det(A);

        x = x'; % Transpose to express the solution as a column vector
    end
end
