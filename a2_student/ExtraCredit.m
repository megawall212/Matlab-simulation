function [E_matrices_in_order, A_inverse] = ExtraCredit()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;
    %{ 
    ==> FINDING A^-1 WITH ELEMENTARY MATRICES <==
               Authored by Robert Conde
    
    You will determine the inverse of A using ONLY elementary matrices.
    You may not call inv(...) or rref(...).
     
    This process is covered in your book in "Chapter 2.2: The Inverse of
    a Matrix" (see Theorem 7 & Proof). We will use the same numbering
    scheme E1, E2, ..., En for (En * ... * E_2 * E1) * A = I. You will
    determine matrices E1, ..., En so find the inverse of A,
    A^-1 = (En * ... * E_2 * E1).
    
    You may look up example of this being done but your work should be
    original. Have fun.
    %}
    
    % This is our 3x3 matrix A that we will find the inverse of
    A_original = [1 2 2; 3 7 8; 6 5 0]; % Enter Matrix A
    A = A_original;

    
    
    % Repeat the following 4 commands until A equals the 3x3 identity matrix
    
    E1 = eye(3); % Start with the identity matrix
    E1(2,1) = -3; % Add -3 times row 1 to row 2
    E1(3,1) = -6; % Add -6 times row 1 to row 3
    A = E1 * A; % Apply E1 to A
    disp("A now is :");
    disp(A);

    E2 = eye(3); % Enter your second elementary matrix
    E2(2,2) = 1 / A(2,2); % Scale row 2 to make the diagonal element 1
    A = E2 * A;
    disp("A now is...")
    disp(A);
    
    % Repeat for E3, E4, ... as needed

  
    % Step 3: Eliminate the second element of the first and third rows
    E3 = eye(3); % Start with the identity matrix
    E3(1,2) = -A(1,2); % Add -A(1,2) times row 2 to row 1
    E3(3,2) = -A(3,2); % Add -A(3,2) times row 2 to row 3
    A = E3 * A; % Apply E3 to A
    disp("A now is:");
    disp(A);
    

    % Step 4: Make the third element of the third column 1
    E4 = eye(3); % Start with the identity matrix
    E4(3,3) = 1 / A(3,3); % Scale row 3 to make the diagonal element 1
    A = E4 * A; % Apply E4 to A
    disp("A now is:");
    disp(A);

    % Step 5: Eliminate the third element of the first and second rows
    E5 = eye(3); % Start with the identity matrix
    E5(1,3) = -A(1,3); % Add -A(1,3) times row 3 to row 1
    E5(2,3) = -A(2,3); % Add -A(2,3) times row 3 to row 2
    A = E5 * A; % Apply E5 to A
    disp("A now is:");
    disp(A);

    

    % List your matrices here as shown
    E_matrices_in_order = {E1,E2,E3,E4,E5}; % Should look like {E1, E2, ..., En}
    
    % Multiply your matrices here as shown
    A_inverse = E5 * E4 * E3 * E2 * E1; % Should look like En * ... * E2 * E1
    
    % DO NOT MODIFY ANYTHING BELOW
    disp("Your Inverse Times A is...");
    disp(A_inverse * A_original);
end
