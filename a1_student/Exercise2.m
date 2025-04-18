function [name, ufid, B, pivcols, compare, m, n, solution_type] = Exercise2(A, b)
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A [10 Points] --- %
    % B = NaN; % (REMOVE THIS LINE)
    % leave these lines maybe..
    % i will just comment them out 
    % pivcols = NaN; % (REMOVE THIS LINE)
    [B, pivcols] = rref([A b]); % (WRITE COMMAND BEFORE SEMI-COLON)
    %{ 
    % B is in RREF form of the augmented matrix [A b]
    % pivcols indicates which columns are pivot columns
    %}
     % Check if the system is inconsistent 
     % using the Rouché-Capelli theorem learned
   

    % --- Part B [10 Points] --- %
     compare = rank(A) == rank([A b]); 
    %{ 
     Use Rouché-Capelli theorem to compare ranks
    %}
    
    %{
     If rank(A) = rank([A b]), 
     the system is consistent,
     otherwise, it is inconsistent.
    %}
   
    % --- Part C [10 Points] --- %
    m = size(A, 1); % rows in A
    n = size(A, 2); % columns in A
    
    % now you know the solution type
    %remember no nested if-else
    if rank(A) < rank([A b])
        solution_type = 'inc'; % inconsistent system
    elseif rank(A) == n
        solution_type = 'con_with_one_sol'; 
        % consistent system 
        % therefore only 1 unique solution
    else
        solution_type = 'con_with_inf_sols'; 
        % consistent system
        % but with infinitely many solutions
    end
end
