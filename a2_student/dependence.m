function [dep] = dependence(A)
    % Purpose: This function determines whether the set of column vectors
    % of matrix A is linearly dependent. 
    % Input Argument: an mxn matrix A
    % Output Argument: text indicating dependence

    [~, n] = size(A);   % n = # of columns in A

    % If A has a pivot position in every column, then the *columns* of A
    % are linearly independent.
    % Note: Saying that matrix A is independent has no meaning, but saying
    %       that it's columns are linearly independent does.
    if rank(A) == n
        dep = 'The columns of the matrix forms a linearly INDEPENDENT set.';
    else
        dep = 'The columns of the matrix forms a linearly DEPENDENT set.';
    end
end