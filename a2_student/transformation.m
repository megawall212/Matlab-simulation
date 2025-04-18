function [transform_type, name, ufid] = transformation(A)
    % Purpose: (The function determines whether the 
    % linear transformation 
 %T(x)=Ax is onto, one-to-one, both, or neither.)
    % Input Argument [A]: (A: The matrix representing the linear transformation.)
    % Output Argument [transform_type]: (A string for type(s) of transformation)

    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    [m, n] = size(A); % # of rows and columns of A, respectively

    both = "Onto and one-to-one";
    onto = "Onto but not one-to-one";
    one_to_one = "One-to-one but not onto";
    neither = "Neither onto nor one-to-one";

    rank_A = rank(A);
    % Use dependence.m as a guide to write this new function. Enter code below.
    % Determine if T is onto and/or one-to-one
    if rank_A == m && rank_A == n
        % onto and one-to-one (full rank square matrix)
        transform_type = both;
    elseif rank_A == m && rank_A < n
        % T is onto but not one-to-one (more columns than rows)
        transform_type = onto;
    elseif rank_A == n && rank_A < m
        % T is one-to-one but not onto (more rows than columns)
        transform_type = one_to_one;
    else
        % T is neither onto nor one-to-one 
        transform_type = neither;
    end
end


