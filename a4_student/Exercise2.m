function [name, ufid, ...
    A, x0, x1, x2, ...
    sol1, P, D, C1, sol2, ...
    x0_another, sol3, C2, sol4] = Exercise2()
    % --- Name & UFID --- %
    name = "Zeyu Li";
    ufid = 55153019;

    % --- Part A [10 Points] --- %
    A = [0.8  0.2  0.1;  % probabilities of transitioning to car
     0.1  0.7  0.3;  
     0.1  0.1  0.6]; 
  
    x0 = [0.7;  % 70% were driving cars two years ago
      0.2; 
      0.1]; 

    x1 = A * x0;
    x2 = A * x1;

    % --- Part B (see SolveDiffEq.m) [10 Points] --- %

    % --- Part C [10 Points] --- %
    % Method 1: Call SolveDiffEq(...)
    sol1 = SolveDiffEq(A, x0);

    % Method 2: Diagonalization (of the Transformation Matrix)
    % P = NaN; % (REMOVE THIS LINE)
    % D = NaN; % (REMOVE THIS LINE)
    %[P, D] = NaN; % (UNCOMMENT THIS LINE)

    [P, D] = eig(A);

    C1 = P\x0; % Single line of command

    % sol2 = NaN;
    
   [~, idx] = min(abs(diag(D) - 1));
   sol2 = P(:, idx);
   sol2 = sol2 / sum(sol2);


    
    %{ 
    Observe: (DO THEY PRODUCE THE SAME RESULT?)
    Conclude: In the long run we expect... (COMPLETE)
    %}

     %{
    Obeserve: both methods produce the same result/limit:
    

    Method 1 (SolveDiffEq(A, x0)) converges to the steady-state vector as k→∞
    Method 2 [sol2]: The eigenvector for λ=1 is the steady-state vector.
    Both approaches mathematically must converge to the same solution for irreducible, aperiodic Markov chains.

    -- Notice that it also demonstrates the Markov chain's property too:
    -- The long-run behavior won't depend on initial conditions.

    

    CONCLUSION:
    In the long run, we expect:
    - Cars: [X]% --50.0% if it's the computed value (round to tenth
         decimal)
    - Minivans: [Y]% --30.0% if it's the computed value (round to tenth
         decimal)
    - SUVs: [Z]% --20.0%     if it's the computed value (round to tenth
         decimal)
    that surveyed people will drive.
    %}



    % --- Part D [10 Points] --- %
    % x0_another = NaN;

    % Method 1: Call SolveDiffEq(...)
    % sol3 = NaN;

    % Method 2: Diagonalization (of the Transformation Matrix)
    % C2 = NaN;

    % sol4 = NaN;

    x0_another = [0.4;  % car
              0.4;  % van
              0.2]; % SUV


    sol3 = SolveDiffEq(A, x0_another);

    % Method 2: Diagonalization approach
    [P, D] = eig(A);
    C2 = P\ x0_another; % Coefficients for new initial vector

    % Find steady state (eigenvector for λ=1)
    sol4 = P(:, idx);   % Same eigenvector as sol2 (λ=1)
    sol4 = sol4 / sum(sol4); % Normalize


    %{ 
    Comparison: (COMPARE RESULTS FROM DIFFERENT x0 VECTORS)
    Theorem: (STATE THEOREM)
    Conclusion: In the long run we expect... (COMPLETE)
    %}

    
    %{
   Comparison: Both initial vectors ( x0 and x0_another) converge to the same steady-state distribution
   Theorem: For any irreducible and aperiodic (very weird words)  Markov chain with transition matrix A,
        1. There should exists a unique steady-state vector π such that:
        1. Aπ = π (π is an eigenvector with eigenvalue 1)
        2. All entries of π are positive and sum to 1
        3. For any initial probability vector x0, A^k x0 → π as k → ∞

   Note: 
         1.A Markov chain is irreducible if all states belong to a single communicating class.
         2.A state is aperiodic if the times of possible return to the state have a largest common denominator equal to one.

   Conditions on A:
         1. Irreducible: All states communicate (there's no no isolated subsets).
         2. Aperiodic: The system has no fixed cycles that prevent it from converging to a steady state. (Example: A has self-transitions).

   Conclusion: In the long run we expect:
         - Cars: [X]% --50.0% if it's the computed value (round to tenth
         decimal)
         - Minivans: [Y]% --30.0% if it's the computed value (round to tenth
         decimal)
         - SUVs: [Z]% --20.0%     if it's the computed value (round to tenth
         decimal)
         regardless of the initial distribution(we mentioned that in part c too).
   %}
   
    
end
