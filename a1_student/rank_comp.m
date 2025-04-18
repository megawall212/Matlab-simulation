function [compare] = rank_comp(A, Ab)
    % Compare the rank of A and its augmented matrix [A b]
    % A = coefficient matrix of linear equations
    % Ab = corresponding augmented matrix [A b]

    same = "rank([A]) equals to rank([A b])";
    diff = "rank([A]) does not equal to rank([A b])";
    if rank(A) == rank(Ab)
        compare = same;
    else
        compare = diff;
    end
end
