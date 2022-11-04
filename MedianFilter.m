function [filteredSignal] = MedianFilter(inputSignal, window)
    processedFileName = strcat('new', inputSignal);
    resampled_data = audioSetup(inputSignal, processedFileName);
    [dataSize, dim] = size(resampled_data);
    filteredSignal = zeros(dataSize, 1);
    for n = 1 : dataSize
        if n-window+1 < 1
            startRange = 1;
        else
            startRange = n-window+1;
        end
        samples = resampled_data(startRange : n);
        medianVal = median(samples);
        filteredSignal(n) = medianVal;
    end
    sound(filteredSignal, 16e3);
    length = 1:size(filteredSignal);
    subplot(2,1,2);
    plot(length, filteredSignal);
    grid;
    title("Filtered Median Data");
    hold off;
end