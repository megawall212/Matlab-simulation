function [name, ufid, u, v, w, x, A, A_11, A_23, A2, A3, B, B2, B3, ...
          b, aug, rref_Ab1, rref_Ab2, pivcols, compare] = Exercise()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Extra Credit [6 Points] --- %
    % * Vectors *
    u = [1 3 5 7];% u is the row vectors with entries 1, 3, 5, 7
    v = [1; 3; 5; 7];% v vector
    w = 1:7;%Generate the row vector with entries from 1 to 7 
    x = 1:2:7;%Generate the row vector with entries from 1 to 7 
    
    % * Matrices *
    % Enter entries manually
    A = [1 2 3; 4 5 6];
    A_11 = A(1,1); % A(1,1) returns the (1,1) entry of A
    A_23 = A(2,3); % A(2,3) returns the (2,3) entry of A
    
    A2 = A(2,:); % return a 1*3 matrix: 4,5,6
    A3 = A(:,3);% return a 2*1 matrix: 3,6 (vertically)
    
    % Randomly generated matrices
    B = randi([-10,10],6,4); %random 6*4 matrix 
    B2 = B(2:5,2:4); %get the 4*3 submatrix from the 6*4 
    B3 = B([2 5], 2:4);% get the 2*3 submatrix from the 6*4 
    
    % * Solving Systems *
    % Solve Ax=b using RREF
    b = [1; 2]; %get the 2*1 matrix
    aug = [A b]; %get augmented matrix
    rref_Ab1 = rref([A b]); % do reduce form process in class
    [rref_Ab2, pivcols] = rref([A b]);% substitute it back to the original matrix
    
    % [rref_Ab2, pivcols] = NaN; % (UNCOMMENT LINE) 
    %{
    (find the pivot column and number)
    %}
    
    % Solve Ax=b by comparing the ranks
    compare = rank_comp(A,aug); 
    % (done, print out the statement)
end
