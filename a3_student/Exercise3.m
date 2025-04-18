function [name, ufid, ...
    N1, B1, pivcols1, C1, R1, ...
    N2, B2, pivcols2, C2, R2, ...
    N3, B3, pivcols3, C3, R3, ...
    A4, N4, B4, pivcols4, C4, R4, ...
    rank_A1, rank_A2, rank_A3, rank_A4] = Exercise3(A1, A2, A3)
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    %line 13 46 might be incorrect, check for other parts too

    % --- Part A [10 Points] --- %
    % (i) Compute a basis for the nullspace, columnspace, and rowspace of A1.
    N1 = null(A1);

    %B1 = NaN; % (REMOVE LINE)
    %pivcols1 = NaN; % (REMOVE LINE)
    % [B1, pivcols1] = rref(A1); % (UNCOMMENT)

    [B1, pivcols1] = rref(A1); % Compute RREF of A1 and pivot columns
    C1 = A1(:, pivcols1); % basis for column space of A1 
    %R1 = B1(1:rank(A1), :); % basis for row space of A1 
    R1 = B1(any(B1, 2), :);
    

    % --- Part B [10 Points] --- %
    % (ii) Compute a basis for the nullspace, columnspace, and rowspace of A2.
    N2 = null(A2);

    %B2 = NaN; % (REMOVE LINE)
    %pivcols2 = NaN; % (REMOVE LINE)
    [B2, pivcols2] = rref(A2); 
    C2 = A2(:, pivcols2); 
    R2 = B2(any(B2, 2), :);

   

    % (iii) Compute a basis for the nullspace, columnspace, and rowspace of A3.
   

    %B3 = NaN; % (REMOVE LINE)
    %pivcols3 = NaN; % (REMOVE LINE)
    % [B3, pivcols3] = rref(A3); % (UNCOMMENT)

    N3 = null(A3); 

    [B3, pivcols3] = rref(A3); 
    C3 = A3(:, pivcols3); 
    R3 = B3(any(B3, 2), :); 

    % (iv) Compute a basis for the nullspace, columnspace, and rowspace of A4.
    %B4 = NaN; % (REMOVE LINE)
    %pivcols4 = NaN; % (REMOVE LINE)
    % [B4, pivcols4] = rref(A4); % (UNCOMMENT)
    
    A4 = [1 0 -2 -3 0 0; -3 -2 0 0 0 3; -7 -4 2 3 0 6; -3 -4 -6 -9 5 6]; 
    N4 = null(A4); 

    [B4, pivcols4] = rref(A4);
    C4 = A4(:, pivcols4);

    R4 = B4(any(B4, 2), :);

    % (WHAT DOES THE *NULLSPACE* OF A4 LOOK LIKE GEOMETRICALLY?)
    % The null space of A4 is a 3-dimensional subspace of R^6, since there are 6 columns in A4.
    % (WHAT DOES THE *COLUMNSPACE* OF A4 LOOK LIKE GEOMETRICALLY?)
    % The column space of A4 is a 3-dimensional subspace of R^4, since there are 4 rows in A4.

   % The dimension of the column space/ row space and the dimension of the
   % null space should add up to 6

    % --- Part C [10 Points] --- %
    % Verify the Rank Theorem for A1, A2, A3, & A4.
    
    %{   
    i) dim(Col A1) = dim(Row A1) = ?
    ii) rank(A1) + dim(Nul A1) = ? + ? = ? = n
    %}
    
    rank_A1 = rank(A1);
    %{   
    i) dim(Col A1) = dim(Row A1) = rank(A1) according to the rank theorem
    ii) rank(A1) + dim(Nul A1) = the number of pivot columns in A1
    + the number of free variables (non-pivot columns) in A1 = n = (number of columns in A1)
    %}

   
    %{   
    i) dim(Col A2) = dim(Row A2) = ?
    ii) rank(A2) + dim(Nul A2) = ? + ? = ? = n
    %}
    rank_A2 = rank(A2);
    %{   
    i) dim(Col A2) = dim(Row A2) = rank(A2) according to the rank theorem
    ii) rank(A2) + dim(Nul A2) =  the number of pivot columns in A2
    + the number of free variables (non-pivot columns) in A2 = n =(number of columns in A2)
    %}


   
    %{   
    i) dim(Col A3) = dim(Row A3) = ?
    ii) rank(A3) + dim(Nul A3) = ? + ? = ? = n
    %}
    
    rank_A3 = rank(A3);
    %{   
    i) dim(Col A3) = dim(Row A3) = rank(A3) according to the rank theorem
    ii) rank(A3) + dim(Nul A3) =  the number of pivot columns in A3
    + the number of free variables (non-pivot columns) in A3 = n = (number of columns in A3)
    %}


    %{
    i) dim(Col A4) = dim(Row A4) = ?
    ii) rank(A4) + dim(Nul A4) = ? + ? = ? = n
    %}

    rank_A4 = rank(A4);
    %{
    i) dim(Col A4) = dim(Row A4) = rank(A4) according to the rank theorem
    ii) rank(A4) + dim(Nul A4) =  the number of pivot columns in A4
    + the number of free variables (non-pivot columns) in A4 = n = (number of columns in A4)
    %}
  

    %{ 
    [EC, +5 pts] (See instructions.)
    
    (a) What is dim Nul A? What about dim Col A?
    
        (ENTER HERE)
    
    (b) Can you be certain that every non-homogenous system Ax = b has
        a solution? Why or why not (provide valid reasoning/proof)?
    
        (ENTER HERE)
    %}

    %{ 
    [EC, +5 pts] (See instructions.)
    
    (a) What is dim Nul A? What about dim Col A?
    
        dim Nul A = 3 (since there are 3 linearly independent solutions to
        the system Ax = 0), and they span the whole space.
     s    dim Col A = 20 - 3 = 17 (by the Rank Theorem: rank(A) + dim(Nul A) = n)
    
    (b) Can you be certain that every non-homogenous system Ax = b has
        a solution? Why or why not (provide valid reasoning/proof)?
    
        No, we can't assume that. For a non-homogeneous system Ax = b to have a solution,
        b must be in the column space of A. Since dim(Col A) = 17 and A is a 20 x 23 matrix,
        there exists some vectors b in R^20 that are not in Col A, making the system inconsistent.
        
       
    %}
end


    