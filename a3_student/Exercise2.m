function [name, ufid, ...
    A1, b1, sol_1_partic, sol_1_matlab, sol_1_cramer, ...
    A2, b2, sol_2_partic, sol_2_matlab, sol_2_cramer, ...
    A3, b3, sol_3_partic, sol_3_matlab, sol_3_cramer] = Exercise2()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A (see CramersRule.m) [10 Points] --- %

    % --- Part B [10 Points] --- %
    % (i) m > n:a 5 x 3 random matrix A1 and 5 x 1 vector b1
    A1 = randi([-7, 7], 5, 3); % Create a 5x3 random matrix with integer between -7 and 7
    b1 = randi([-7, 7], 5, 1); % Create a 5x1 random vector with integer between -7 and 7

    sol_1_partic = ParticularSolution(A1, b1); 
    sol_1_matlab = A1 \ b1; 
    sol_1_cramer = CramersRule(A1, b1); % Cramer's Rule is not applicable for non-square matrices

    % (ii) m < n
    A2 = randi([-7, 7], 3, 5); % 3x5 random matrix 
    b2 = randi([-7, 7], 3, 1); % 3x1 random vector 

    sol_2_partic = ParticularSolution(A2, b2);
    sol_2_matlab = A2 \ b2;
    sol_2_cramer = CramersRule(A2, b2); 

    % (iii) m = n
    A3 = randi([-7, 7], 5, 5); %  5x5 random matrix 
    b3 = randi([-7, 7], 5, 1); %  5x1 random vector

    sol_3_partic = ParticularSolution(A3, b3); 
    sol_3_matlab = A3 \ b3; 
    sol_3_cramer = CramersRule(A3, b3); 

    % --- Part C [10 Points] --- %

     %{ 
    When A is invertible:
    - THey should all return a unique solution since the system is consistent and A is also invertible.

    When Ax = b is consistent where A is an n x n singular matrix:
    - A\b returns a least-squares solution.
    - RREF/ParticularSolution.m will return a particular solution if the system is consistent.
    - Cramer's Rule returns NaN because it's not square and also the determinant of A is zero.
    

    When Ax = b is consistent where A is an m x n (non-square) matrix:
    - A\b returns a least-squares solution.
    - RREF/ParticularSolution.m returns a particular solution (if the system is consistent).
    - Cramer's Rule returns NaN because A is non-square.
    %}
end
