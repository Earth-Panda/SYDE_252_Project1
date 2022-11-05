function [data, resampled_data] = weightedAvg(audio, window)    
    a_k = gausswin(window);
    b_k = zeros(1, window); % Preallocating size of array to increase speed
    for i = 1:length(a_k)
        b_k(i) = a_k(i) / sum(a_k); % Normalizing Gaussian coefficients
    end
    
    processedFileName = strcat('new',audio);
    
    data = audioSetup(audio, processedFileName, false); % Returns setup audio sample
    
    resampled_data = filter(b_k, 1, data);
    
    %sound(resampled_data, 16e3);
    
    %{
    plot
    n = 1:length(data);
    subplot(2,1,2)
    plot(n, resampled_data);
    grid
    title("Weighted filter: " + audio)
    hold off
    %}
end

