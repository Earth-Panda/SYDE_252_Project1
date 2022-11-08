function [] = staticNosie(filtered_data, noise_tolerance)
    for i = 1:length(filtered_data) % parsing filtered data array
        if abs(filtered_data(i)) < noise_tolerance % checking whether values are less below a noise tolerance
            filtered_data(i) = 1; % Replace values at an index to 0 if less than the specified threshold
        else
            filtered_data(i) = 0; % Replace values at an index to 1 if greater than the specified threshold
        end
    end
    % Plotting results
    n = 1:length(filtered_data);
    subplot(2,1,2);
    plot(n, filtered_data);
end