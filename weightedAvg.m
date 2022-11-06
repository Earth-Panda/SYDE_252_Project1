function [data, filtered_data] = weightedAvg(audio, window, shouldPlot)    
    a_k = gausswin(window);
    b_k = zeros(1, window); % Preallocating size of array to increase speed
    for i = 1:length(a_k)
        b_k(i) = a_k(i) / sum(a_k); % Normalizing Gaussian coefficients
    end
    
    processedFileName = strcat('new',audio);
    
    data = audioSetup(audio, processedFileName, false); % Returns setup audio sample
    
    filtered_data = filter(b_k, 1, data);
    
    sound(filtered_data, 16e3);
    
    if shouldPlot
        n = 1:length(data);
        plot(n, filtered_data);
        grid
        title("Weighted filter: " + audio)
        hold off
    end
end

