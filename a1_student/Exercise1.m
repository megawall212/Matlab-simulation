function [name, ufid, ...
          A, b, c, D, x1, x2, x3, aug, ...
          x4, x5, x6, x7, x8, ...
          F1, F2, E, m, n, E1, E2] = Exercise1()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A [10 Points] --- %
    A = [1 2 3; -4 -5 -6; 7 8 9];
    b = [1;2;3];
    c = [-1 1 -1];
    D = [0 1 2 3 4; 1 2 3 4 0; 2 3 4 0 1];
    x1 = A(2,:); % now we get the 2nd row in matrix A
    x2 = D(:,4); % get the fourth column from matrix D
    x3 = [A b]; % add matrix A with vector b as an additional column
    % Error: cuz c is a row vector
    % We need to fix
    % c to make it a column vector.
    % She mentioned it in class using semicolon
    aug = [A; c]; % make c as an additional row to A


    % --- Part B [10 Points] --- %
    x4 = eye(8); % Creates an 8x8  matrix staring with 1
    x5 = zeros(6,3); % Creates a 6x3 matrix(all zeros
    x6 = zeros(5); % Creates a 5x5 square (all zeros
    x7 = ones(3,5); % Creates a 3x5 matrix (all 1)
    x8 = diag(c); % Creates a diagonal matrix with elements of vector c
    % in this case it would be -1 0 0 


    % --- Part C [10 Points] --- %
    F1 = randi([-7,7],3,7); % Creates a 3x7 matrix with random integers between -7 and 7
    
    F2 = F1;    % (DO NOT REMOVE) Copy array
    F2(:, [3 6]) = F1(:, [6 3]); % Swaps columns 3 and 6 in F1 and store value in F2
    
    E = [A F2]; % add matrix A with F2 horizontally
    
    [m, n] = size(E); % Computes the dimensions (rows and columns) of matrix E
    
    E1 = E(:, [3 7]); % get columns 3 and 7 from matrix E
    E2 = E(:, 3:7); % get columns 3 through 7 from matrix E
end
