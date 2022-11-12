function [data, filtered_data] = weightedAvg(audio, window, shouldPlot)    
    a_k = gausswin(window);
    b_k = zeros(1, window); % Preallocating size of array to increase speed
    for i = 1:length(a_k)
        b_k(i) = a_k(i) / sum(a_k); % Normalizing Gaussian coefficients
    end
    
    processedFileName = strcat('new',audio); % Setting name of new file name, used in audioSetup.m audiowrite call
    
    data = AudioSetup(audio, processedFileName, false); % Returns setup audio sample
    
    filtered_data = filter(b_k, 1, data); % Returns filtered audio sample
    
    if shouldPlot % Condition to plot
        sound(filtered_data, 16e3);
        n = 1:length(data);
        subplot(2,1,1);
        plot(n, filtered_data);
        grid
        title("Weighted filter: " + audio)
        hold off
    end
end

