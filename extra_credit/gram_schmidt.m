function [V, name, ufid] = gram_schmidt(X, normalize)
    % Purpose: (COMMENT)
    % Input Argument [X]: (COMMENT)
    % Input Argument [normalize = false]: (COMMENT)
    % Output Argument [V]: (COMMENT)

    % Purpose:We need to perform the Gram-Schmidt process on the columns of X
    % to produce an orthogonal (or orthonormal) basis.
    % Input Argument [X]: An n x p matrix whose columns are linearly independent vectors
    % Input Argument [normalize = false]: I think this is an optional logical input to normalize the vectors
    % Output Argument [V]: An n x p matrix whose columns form an orthogonal (or orthonormal) basis

    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    if nargin < 2
        normalize = false; % Don't normalize by default
    end

    [n, p] = size(X);
    V = zeros(n, p);

    % (CODE BELOW)
     % Now we need to apply the Gram-Schmidt Process
    for i = 1:p
        vi = X(:, i); % Start with the current vector vi

        
        for j = 1:i-1
            [proj_ij, ~, ~, ~] = proj(vi, V(:, j));
            vi = vi - proj_ij;
        end

        % Normalize if required
        % Return a matrix V whose columns represent a basis
        if normalize
            vi = vi / norm(vi);
        end

        V(:, i) = vi; % Store the result
    end

end


