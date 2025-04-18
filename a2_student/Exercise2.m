function [name, ufid, ...
    transform_A1, transform_A2, transform_A3, ...
    transform_B1, transform_B2, transform_B3, ...
    C1, C2, C3, transform_C1, transform_C2, transform_C3, ...
    example_neither, transform_neither] = Exercise2(A1, A2, A3, B1, B2, B3)
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A (see transformation.m) [10 Points] --- %

    % --- Part B [10 Points] --- %
    transform_A1 = transformation(A1); % Check onto/one-to-one for all
    transform_A2 = transformation(A2); 
    transform_A3 = transformation(A3); 
    transform_B1 = transformation(B1); 
    transform_B2 = transformation(B2); 
    transform_B3 = transformation(B3); 

    % Generate 3x3 random matrices 
    C1 = randi([-7, 7], 3, 3); % Random 3x3 matrix with integers in [-7, 7]
    C2 = randi([-7, 7], 3, 3);
    C3 = randi([-7, 7], 3, 3); 

    % Check the transformation type for C1, C2, C3
    transform_C1 = transformation(C1); % Check if T(x) = C1x is onto/one-to-one
    transform_C2 = transformation(C2); 
    transform_C3 = transformation(C3); 

    % --- Part C [10 Points] --- %

    %{ 
    (1) When m < n, a transformation T(x) = Ax cannot be one-to-one because
        (n>m:This means there are more columns than rows,that means the rank
        has to be less than m and therfore strictly less than n, A will be one-to-one only if
        rank(A) is equal to n. Therefore A can not be one-to-one)
     
    (2) When m > n, a transformation T(x) = Ax cannot be onto because
        (m>n:This means the column space of A has at most n dimensions.
%     - Since the codomain is R^m (m-dimensional), and n < m, the column space cannot span all of R^m.
%     - Therefore, T is not onto because not every vector in R^m can be reached by T.)
     
    (3) When m = n, a transformation T(x) = Ax can be neither onto nor one-to-one if:
%     (- The columns of A are linearly dependent 
%     - If the rank(A) is strictly less than m and n, that means A would be neither onto nor one-to-one
      )
    
    %}

    example_neither = [1 2 3; 2 4 6; 3 6 9]; % Columns are linearly dependent in this case
    transform_neither = transformation(example_neither); % Check transformation type
    %{ 
    (4) When m = n, a transformation T(x) = Ax 
       (% (4) When m = n:
%     - It is not possible for T to be onto but not one-to-one.
%     - It is not possible for T to be one-to-one but not onto.
%     - This is because, for a matrix (m = n), the rank of A is equal to m if it's onto.
        but since m=n, we have rank (A) = n, which means A is also
        one-to-one
%     - Therefore, T(x) is either both onto and one-to-one, or one-to-one
but not onto, or it is neither.

% Example:
% Consider a 2x2 matrix:
%     A = [2 0;
%          0 2]
% Here, m = n = 2. according to our explanation, T is both onto and one-to-one.
    %}
end

