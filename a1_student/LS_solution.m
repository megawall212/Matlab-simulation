function [system_type, name, ufid] = LS_solution(n, A, Ab)
    % (checks the consistency of 
    % the system of linear equations)
    %description for each argument
    % n = The number of variables 
    % A = The coefficient matrix of the system.
    % Ab = The augmented matrix of (A|b).

    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;    
    % Initialize these varibales
    inc = "Inconsistent";
    con_with_one_sol = "Consistent with One Solution";
    con_with_inf_sols = "Consistent with Infinite Solutions";
    
    % rank comparison
    % she told us don't use rankcomp function 
    %let's see
    %remember no nested if-else
    if rank(A) < rank(Ab)
        system_type = inc; 
        % inconsistent if ranks are not the same
    elseif rank(A) == n
        system_type = con_with_one_sol; 
        % One unique solution
        % if rank(A) = n
    else
        system_type = con_with_inf_sols; 
        % Infinitely many solutions(R)
        % if rank(A) < n
    end
end
