function [ output_args ] = resize_array( mat , n)
%RESIZE_ARR creates a new truncated array based off another array
    % Used to trim trailing zero or null values
    % mat is the matrix, n is the size of the matrix
        output_args = zeros(1,n);
        
        for counter = 1:n
            output_args(counter) = mat(counter);
        end
end

