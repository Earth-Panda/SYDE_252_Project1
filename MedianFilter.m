
function [resampled_data, outputSignal] = MedianFilter(inputSignal, window, shouldPlot)
    %apply median filter
    processedFileName = strcat('new', inputSignal);
    %generate new file name for filtered data
    resampled_data = audioSetup(inputSignal, processedFileName, false);
    %get size of resampled data
    [dataSize, dim] = size(resampled_data);
    %set outputSignal to size of resampled signal
    outputSignal = zeros(dataSize, 1);
    for n = 1 : dataSize
        %takes median of range of values before and including n
        %if the window extends before the start of the signal (n < 1), then
        %set the start of the range to 1 (the start of the signal). 
        if n-window+1 < 1
            startRange = 1;
        else
            startRange = n-window+1;
        end
        samples = resampled_data(startRange : n);
        %extract all samples within the range
        medianVal = median(samples);
        %extract median value of that ran
        outputSignal(n) = medianVal;
        %assign output signal to median value of range
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