function [name, ufid, ...
    n1, B1, A1, ...
    P1, D1, PDP1, ...
    P1_again, D1_again, PDP_again, ...
    P2, D2, PDP2, P3, D3, PDP3, ...
    A2, P4, D4, verify1_LHS, verify1_RHS, verify2, basis_eigenspace, ...
    A3, P5, D5, dot_A3, ...
    A4, P6, D6, x0, C] = Exercise1()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    rng(ufid, 'twister') % (DO NOT REMOVE)

    % --- Part A [10 Points] --- %
    % vvv GENERATES RANDI MATRIX WITH DISTINCT EIGENVALUES vvv %
    n1 = 4;
    A1 = [];
    B1 = [];
    while length(unique(diag(A1))) ~= n1
        B1 = randiFullRank([-7, 7], n1);
        A1 = triu(B1); % Returns the upper-triangular part of A1
    end
    % ^^^ DO NOT MODIFY! ^^^ %

    %{ 
    The eigenvalues of A1 are _, _, _, _ because/as... (COMPLETE)
    %}

   
    %{ 
The eigenvalues of A1 are the diagonal elements (a11, a22,a33, and a44)
because:
1.

1. A1 is upper-triangular matrix(we find that all entries below the main diagonal are zero) 
2. For any triangular matrix like that, the eigenvalues are exactly the diagonal elements 
3. This follows from the characteristic polynomial det(A - λI) = Π(a_ii -
λ), also the theorem states that  the determinant of a triangular matrix
equals the product of its diagonal elements, making them the roots of the characteristic polynomial.
 
4.The algebraic multiplicity of each eigenvalue is 1 since they are distinct.
    %}
   

    % P1 = NaN; % (REMOVE THIS LINE)
    % D1 = NaN; % (REMOVE THIS LINE)

    %[P1, D1] = ; % (UNCOMMENT THIS LINE)
     [P1,D1] = eig(A1);

    %{ 
    P1 is... (COMPLETE)
    D1 is... (COMPLETE)
    %}

     %{ 
P1 is the eigenvector matrix where each column is an eigenvector of A1
corresponding to the eigenvalues in D1. The eigenvectors are normalized to have unit length.

(basically it is the matrix of normalized eigenvectors)



D1 is the diagonal eigenvalue matrix where the diagonal entries are the eigenvalues
of A1 
(in the same order as the corresponding eigenvectors appear in P1 above)

%}

    PDP1 = P1 * D1/P1;

    % P1_again = NaN; % (REMOVE THIS LINE)
    % D1_again = NaN; % (REMOVE THIS LINE)
     [P1_again, D1_again] = eig(A1); % (UNCOMMENT THIS LINE)
     PDP_again = (P1_again * D1_again )/ P1_again;


    %{ 
    We can conclude that A1 is / is not (CHOOSE ONE) diagonalizable
    since... (COMPLETE)
    %}

     %{ 
We can conclude that A1 is diagonalizable since it has 4 distinct eigenvalues.
A matrix with n distinct eigenvalues (where n is its size) is always diagonalizable
because each eigenvalue has its geometric multiplicity equal to the algebraic multiplicity.

Also, the eigenvectors form a complete basis for ℝ⁴,
which satisfies the definition: A = PDP⁻¹ where D is diagonal and P is invertible 
%}
    

    % (i) First distinct diagonalization: re-order eigenvalues on the diagonal of D
    %P2 = P1; % (DO NOT REMOVE)
    %D2 = D1; % (DO NOT REMOVE)

    % MODIFY P2 & D2 HERE

    
    P2 = P1(:, [4 3 2 1]); 
    D2 = diag(diag(D1([4 3 2 1], [4 3 2 1])));
    PDP2 = (P2 * D2) / P2; % Verify 

    

    % (ii) Second distinct diagonalization: scale one of the eigenvectors in P
    P3 = P1; % (DO NOT REMOVE)

    P3(:,1) = 2 * P3(:,1); % We could scale the first eigenvector

    D3 = D1; % (DO NOT REMOVE)

    

    % MODIFY P3 HERE
    
    
    PDP3 = (P3 * D3) / P3; 
    
    

    % --- Part B [10 Points] --- %
    A2 = [2 1 0 0;
      0 2 1 0;
      0 0 2 1;
      0 0 0 2];

    % P4 = NaN; % (REMOVE THIS LINE)
    % D4 = NaN; % (REMOVE THIS LINE)
    %[P4, D4] = ; % (UNCOMMENT THIS LINE)
    [P4, D4] = eig(A2);



    verify1_LHS = A2 * P4;
    verify1_RHS = P4 * D4;
    verify2 = (P4 * D4) / P4;

    %{ 
    Observe: (COMPLETE)
    %}

    %{
    Observe: - A2 * P4 = P4 * D4 confirms the eigenvalue equation A*v = λ*v for each column
    Also, verify2 reconstructs A2 from its diagonalization using P4 * D4 / P4.

    so A2 * P4 = P4 * D4 (i.e. LHS = RHS)

    However, the product P4 * D4 * inv(P4) is not equal to A2 since:

    P4 is singular and non-invertible (determinant ≈ 0) due to A2's defectiveness (its' geometric multiplicity < algebraic multiplicity). 
    - MATLAB might also return a result with large numerical errors (from
    what I researched online)

    %}

    basis_eigenspace = null(A2 - 2*eye(4));

    %{ 
    A2 is not diagonalizable because...
    (i)  (REASON #1)
    (ii) (REASON #2)
    %}


%{ 
A2 is not diagonalizable because... (according to the definition)

(i) The matrix doesn't have enough linearly independent eigenvectors
    to form a basis for R^4 (geometric multiplicity < algebraic multiplicity for λ=2)
 
ii: Also it violates the Rank-Nullity theorem: rank(A2 - 2I) = 3 ≠ 4 - 4 = 0. 
%}

    % --- Part C [10 Points] --- %
    %A3 = NaN;

    A3 = [5 2; 2 5];

    % P5 = NaN; % (REMOVE THIS LINE)
    % D5 = NaN; % (REMOVE THIS LINE)
    %[P5, D5] = ; % (UNCOMMENT THIS LINE)

    [P5, D5] = eig(A3);


    dot_A3 = dot(P5(:,1), P5(:,2));

    % The eigenvectors of A3 are _______. (FILL IN THE BLANK)
    
    
    % The eigenvectors of A3 are orthogonal (perpendicular) because their dot product is zero.

    %{ 
    Solution: x(t) = (COMPLETE)
    %}

    %{ 
    Solution: x(t) = c1*e^(7t)*[1; 1] + c2*e^(3t)*[-1; 1]
    This is because:
    - Eigenvalues are 7 and 3 from D5
    - Corresponding eigenvectors are [1; 1] and [-1; 1] from P5
    %}

    % --- Part D [10 Points] --- %

    A4 = [-8 -12 -6; 2 1 2; 7 12 5];


    % P6 = NaN; % (REMOVE THIS LINE)
    % D6 = NaN; % (REMOVE THIS LINE)
    %[P6, D6] = ; % (UNCOMMENT THIS LINE)
    [P6, D6] = eig(A4);

    % A4 is diagonalizable because... (COMPLETE)
    
    % A4 is diagonalizable because it has 3 linearly indepedent eigenvalues (check diag(D6), also rank(P6) = 3),
    % Also for matrices with distinct eigenvalues, algebraic multiplicity equals
    % geometric multiplicity for each eigenvalue.

    %x = NaN; % (ENTER x0)

    x0 = [3; -1; -3];
    C = P6 \ x0;
    %{ 
    Solution: x(t) = (COMPLETE)
    %}

    %{
    Solution: x(t) = c1*e^(λ1*t)*v1 + c2*e^(λ2*t)*v2 + c3*e^(λ3*t)*v3
    where:
    - λ1, λ2, λ3 are the eigenvalues from the diag(D6)
    - v1, v2, v3 are the corresponding eigenvectors from P6 columns we had
    - c1, c2, c3 are the constants in C
    %}
end







