function [name, ufid, ...
          bA, A1, Ab1, sol1, A2, Ab2, sol2, A3, Ab3, sol3, ...
          example_A1, example_b1, example_type1, ...
          bC, A4, Ab4, sol4, A5, Ab5, sol5, A6, Ab6, sol6, ...
          example_A2, example_b2, example_type2, ...
          example_A3, example_b3, example_type3] = Exercise3()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A: Underdetermined Systems [10 Points] --- %
    % make a 2x1 vector bA 
    % each entry is between -7 and 7
    bA = randi([-7, 7], 2, 1);
    
    
    % get a random matrix A1
    A1 = randi([-7, 7], 2, 3);
    Ab1 = [A1, bA];
    [~, n] = size(A1); % (UNCOMMENT LINE)
    sol1 = LS_solution(size(A1, 2), A1, Ab1);

    A2 = randi([-7, 7], 2, 3);
    Ab2 = [A2, bA];
    [~, n] = size(A2); % (UNCOMMENT LINE)
    sol2 = LS_solution(size(A2, 2), A2, Ab2);

    A3 = randi([-7, 7], 2, 3);
    Ab3 = [A3, bA];
    [~, n] = size(A3); % (UNCOMMENT LINE)
    sol3 = LS_solution(size(A3, 2), A3, Ab3);
    
    % --- Part B: Explanation of Part A [10 Points] --- %

    %{ 
    % so we have an undetermined system
    % by default the number of variables > the number of equations in that
    system
    % Then we have infinitely many solutions 
    because there are free variables(or pivot column, same idea).
    % we can't have 1 unique solution (not enough equations)
    % but if there is a pivot in the last column,
    % the system is inconsistent and has no solution.
    % according to what we learned in lecture 3/4
    % cuz we are gonna get like 0=1, which is impossible
    %}

    % (LEAVE THE FOLLOWING AS NaN OR PROVIDE AN EXAMPLE IF POSSIBLE)
    % (WHEN PROVIDING AN EXAMPLE, IT MUST BE A NON-TRIVIAL EXAMPLE.)
    % (i.e., A MATRIX DOES NOT CONTAIN A ZERO ROW AND DOES NOT HAVE TWO OR MORE IDENTICAL ROWS.)
    example_A1 = [2 4 6; 1 -1 2];  
    example_b1 = [5; 3];
    %two rows are not linearly dependent
    example_type1 = LS_solution(size(example_A1, 2), example_A1, [example_A1, example_b1]);  
    example_b1 = NaN;
    
    [~, n] = size(example_A1); % (UNCOMMENT IF EXAMPLE)
    
    % n is not used anywhere else yet,
    % but it stores the number of variables 
    % (columns of matrix)
    % --- Part C: Overdetermined Systems [10 Points] --- %
    bC = randi([-7, 7], 3, 1);

    A4 = randi([-7, 7], 3, 2);
    Ab4 = [A4, bC];
    [~, n] = size(A4); % (UNCOMMENT LINE)
    sol4 = LS_solution(size(A4, 2), A4, Ab4);

    A5 = randi([-7, 7], 3, 2);
    Ab5 = [A5, bC];
    [~, n] = size(A5); % (UNCOMMENT LINE)
    sol5 = LS_solution(size(A5, 2), A5, Ab5);

    A6 = randi([-7, 7], 3, 2);
    Ab6 = [A6, bC];
    [~, n] = size(A6); % (UNCOMMENT LINE)
    sol6 = LS_solution(size(A6, 2), A6, Ab6);
    
    % --- Part D: Explanation of Part C [10 Points] --- %
    
    %{ 
    % Overdetermined systems:
     more equations than variables (the opposite)
    % Notice that the extra equations may contradict each other.
    % like 3 X1 = 2 X1
    % But there could be a unique solution 
    if all equations are consistent and full-rank (concept we learned)
    % Infinitely many solutions could occur too
    %}

    % (PROVIDE AN EXAMPLE WITH ONE SOLUTION BELOW WITH A NONTRIVIAL MATRIX)
    example_A2 = [1 2; 3 4; 5 6]; % A 3x2 matrix
    example_b2 = [5; 11; 17];      % make unique solution
    example_type2 = LS_solution(size(example_A2, 2), example_A2, [example_A2, example_b2]);

    % (PROVIDE AN EXAMPLE WITH INFINITELY MANY SOLUTIONS BELOW WITH A NONTRIVIAL MATRIX)
    example_A3 = [1 2; 2 4; 3 6];  % A 3x2 system with a dependent row
    example_b3 = [5; 10; 15];        % Scaled vector/multiples of the first row
    example_type3 = LS_solution(size(example_A3, 2), example_A3, [example_A3, example_b3]);
end
  % that's it for this assignment!