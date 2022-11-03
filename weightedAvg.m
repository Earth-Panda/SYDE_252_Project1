function [resampled_data] = weightedAvg(input, window)
clc;
a_k = gausswin(window);
b_k = zeros(1, window); % Preallocating size of array to increase speed
for i = 1:length(a_k)
    b_k(i) = a_k(i) / sum(a_k); % Normalizing Gaussian coefficients
end

resampled_data = filter(b_k, 1, input);

end

