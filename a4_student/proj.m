function [y_hat, z, name, ufid] = proj(y, u)
    % Purpose: (COMMENT)
    % Input Argument [y]: (COMMENT)
    % Input Argument [u]: (COMMENT)
    % Output Argument [y_hat]: (COMMENT)
    % Output Argument [z]: (COMMENT)

    % Purpose: Computes the orthogonal projection of y onto u and the
    % orthogonal component/residual
    % Input Argument [y]: The vector to be projected (column or row is
    % fine)
    % Input Argument [u]: The vector to project onto (column or row is
    % fine)
    % Output Argument [y_hat]: Projection of y onto u (y_hat = proj_u y)
    % Output Argument [z]: Component of y orthogonal to u (z = y - y_hat)

    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % (ENTER CODE HERE)

    % --- Input Validation / error handling for stupid inputs --- %
    if ~isnumeric(y) || ~isnumeric(u)
        error('Inputs must be numeric vectors!');
    end
    if numel(y) ~= numel(u)
        error('Vectors y and u must have the same number of elements in this part!');
    end
    if all(u == 0)
        error('Hey! u must be a non-zero vector!');
    end

    % Compute projection y_hat = ((y·u)/(u·u)) * u
    y_hat = (dot(y, u) / dot(u, u)) * u;
    
    % Compute orthogonal component z = y - y_hat
    z = y - y_hat;
end
