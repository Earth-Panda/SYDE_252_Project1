function [resampled_data, outputSignal] = MedianFilter(inputSignal, window, shouldPlot)

    %apply median filter
    processedFileName = strcat('new', inputSignal);
    resampled_data = audioSetup(inputSignal, processedFileName, false);
    [dataSize, dim] = size(resampled_data);
    outputSignal = zeros(dataSize, 1);
    for n = 1 : dataSize
        if n-window+1 < 1
            startRange = 1;
        else
            startRange = n-window+1;
        end
        samples = resampled_data(startRange : n);
        medianVal = median(samples);
        outputSignal(n) = medianVal;
    end

    if shouldPlot
        %plot
        length = 1:size(outputSignal);
        plot(length, outputSignal);
        grid;
        title("Filtered Median Data");
        hold off;
    end 
    
end