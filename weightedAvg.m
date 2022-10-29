function [data, y_n] = weightedAvg(audio, window)
clc;
a_k = gausswin(window);
b_k = zeros(1, window); % Preallocating size of array to increase speed
for i = 1:length(a_k)
    b_k(i) = a_k(i) / sum(a_k); % Normalizing Gaussian coefficients
end

[data, sample_rate] = audioSetup(audio);

% y_n = 0;
% for n = 1:window % Matlab indices start at 1
%     y_n = (b_k(n)*data(n)) + y_n; % Computing weighted average filter
% end

y_n = filter(b_k, 1, data);
n = 1:length(data)
subplot(2,1,1)
plot(n, data);
grid
title("Data")
hold on

subplot(2,1,2)
plot(n, y_n);
grid
title("Resampled Data")
hold off
end

