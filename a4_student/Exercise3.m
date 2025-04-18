function [name, ufid, ...
    u1, u2, v1, v2, v3, ...
    u1_dot_v1, v1_dot_u1, ...
    norm_u1, u1_dot_u1, norm_v1, v1_dot_v1, ...
    LHS1, RHS1, LHS2, RHS2, LHS3, RHS3, ...
    y1, z1, verify_sum1, verify_orthogonal1, ...
    y2, z2, verify_sum2] = Exercise3()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A [10 Points] --- %
    

  
    u1 = [1; 2; -1; 3];   % Column vector using semi column to seperate
    u2 = [3; -3; 2; -2];  % Column vector
    v1 = [2; -1; 3; -1];  % Column vector
    v2 = [-6; 6; -4; 4];  % Column vector
    v3 = [6; -6; 4; -4];  % Column vector


    % (i) u1 ⋅ v1 and v1 ⋅ u1
    u1_dot_v1 = dot(u1, v1); 
    v1_dot_u1 = dot(v1, u1);

    % Property: The dot product/inner products is/are ________. (FILL IN THE BLANK)
    % Property: The dot product/inner products is/are commutative 
    % (u * v = v * u)

    % (ii) ||u1||, u1 ⋅ u1 and ||v1||, v1 ⋅ v1
    

    norm_u1 = norm(u1); 
    u1_dot_u1 = dot(u1, u1); 

    norm_v1 = norm(v1); % same approach as previous vavriables: sqrt(4+1+9+1) = sqrt(15)
    v1_dot_v1 = dot(v1, v1); % 4+1+9+1 = 15
    

    % Relation Between Inner Product & Norm: (COMPLETE)

    % The norm of a vector is equal to the square root of its dot product with itself ( example: ||v|| = √(v·v)).

    % (iii) Verify Cauchy-Schwarz Inequality (|u ⋅ v| <= ||u|| * ||v||)
    % => u1 & v1
    LHS1 = abs(dot(u1, v1));
    RHS1 = norm(u1) * norm(v1);
    % Observe: (IS LHS1 <= RHS1?) yes
    
    % Observe: LHS1 <= RHS1 (15) is true

    % => u2 & v2
   
    LHS2 = abs(dot(u2, v2)); 
    RHS2 = norm(u2) * norm(v2);
    % Observe: (IS LHS2 <= RHS2?) yes

    % => u2 & v3
   LHS3 = abs(dot(u2, v3));
   RHS3 = norm(u2) * norm(v3); 
    % Observe: (IS LHS3 <= RHS3?) yes

    %{ 
    The Cauchy-Schwarz Inequality is an equality when... (COMPLETE)
    %}

    %{ 
    The Cauchy-Schwarz Inequality is an equality if and only i the two vectors are linearly dependent 
    (in other words, one is a scalar multiple of the other)
    or geometrically:
    1. they point in the same or opposite direction (180 or 0 degree).
    2. They should lie on the same line through the origin (collinear
    relationship)
    %}

    % --- Part B (see proj.m) [10 Points] --- %

    % --- Part C [10 Points] --- %
    % (i) v1 as a linear combination of u1 and u1's orthogonal complement
    % y1 = NaN; % (REMOVE THIS LINE)
    % z1 = NaN; % (REMOVE THIS LINE)
    %[y1, z1] = ; % (UNCOMMENT THIS LINE)

    % verify_sum1 = NaN; % (SHOULD EQUAL v1)
    % verify_orthogonal1 = NaN; % (SHOULD RETURN A BOOLEAN EXPRESSION)

    [y1, z1] = proj(v1, u1);

    verify_sum1 = y1 + z1; 
    verify_orthogonal1 = abs(dot(z1, u1)) < 10e-8; % Returns true if orthogonal

    % (ii) v2 as a linear combination of u2 and u2's orthogonal complement
    % y2 = NaN; % (REMOVE THIS LINE)
    % z2 = NaN; % (REMOVE THIS LINE)
    %[y2, z2] = ; % (UNCOMMENT THIS LINE)

    %verify_sum2 = NaN; % (SHOULD EQUAL v2)

    [y2, z2] = proj(v2, u2);

    verify_sum2 = y2 + z2; 


    % z2 is the zero vector because... (COMPLETE)
    
    % z2 is the zero vector because 
    % 1.v2 is a scalar multiple of u2 (v2 = -u2)
    % 2.which means v2 is already in Span{u2}
    % 3.So its orthogonal component is zero. 
    % This shows v2 and u2 are linearly dependent.

end
