function [diff] = plotAudioDiff(filterType, audioName, n, m, i, winRange)
    % Depending on the filter, filter the data then plot the diff with
    % respect to the original data
    if filterType == "Mean"
        for k = 1 : length(winRange)
          [og_data, output_data] = Mean_Filter(audioName, k, false);
          diff(k) = sum(abs(output_data - og_data));
        end
    end
    if filterType == "WAvg"
        for k = 1 : length(winRange)
          [og_data, output_data] = weightedAvg(audioName, k, false);
          diff(k) = sum(abs(output_data - og_data));
        end
    end
    if filterType == "Median"
        for k = 1 : length(winRange)
            [og_data, output_data] = MedianFilter(audioName, k, false);
            diff(k) = sum(abs(output_data - og_data));
        end
    end
    % Plot
    subplot(n,m,i);    
    n = 1:length(winRange);   
    plot(n,diff);
    grid;
    title(filterType + ": " + audioName);
    xlabel('Window Size');
    ylabel('Signal Difference');
end