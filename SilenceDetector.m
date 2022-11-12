%general idea is to filter data to smooth it out, and then threshold it to
%classify regions as silent or not.
function [silenceSignal] = SilenceDetector(inputSignal)
    %filter some noise out of raw data to smooth out input signal - this is
    %the first of 2 filters applied
    processedFileName = strcat('new', inputSignal);
    processedFile = AudioSetup(inputSignal, processedFileName, 0);
    filteredData = MeanFilter(inputSignal, 12, 0);
    
    [dataSize, dim] = size(filteredData);

    %find threshold and further filter data 
    %general idea is to take intervals of data, take their average, and set
    %all values within that interval to that average. Then, find the
    %minimum of the intervals and the median of the intervals to form the
    %threshold
    interval = 100; 
    %by trial and error, an interval of 100 was the smallest value that
    %gave adequate silence detection results
    range = floor(dataSize/interval);
    %number of intervals
    averagedData = zeros(dataSize, 1); 
    %holds filtered data  where each value is set to the average of its interval.
    for n = 1 : range %n is the current interval
        sum = 0; 
        %sum of the ABSOLUTE values of the current interval
        for i = 1 : interval %i is the current value in the interval
            sum = sum + abs(filteredData((n-1)*interval+i));
            %adds current value to sum
        end
        average = sum/interval;
        %average of the current interval
        for i = 1 : interval
            averagedData((n-1)*interval+i) = average;
        end
        %this loop sets each value to the average of the values in its
        %interval
        if n == 1
            min = average;
        elseif average < min
            min = average;
        end
        %updates min if required 
    end

    med = median(averagedData); %median value of averaged filtered data

    threshold = (0.65*med + 0.35*min);
    %threshold is weighted average of median and min interval value
    
    silenceSignal = ones(dataSize, 1); 
    %unit step signal, were 1 indicates chirping, and 0
    %indicates silence
    for n = 1 : dataSize
        %sets value to 1 or 0 based on threshold
        if abs(averagedData(n)) < threshold
            silenceSignal(n) = 0; %0 indicates its silence
        end
    end

    %plots filtered (only using mean filter) data and regions where signal
    %is silenced
    length = 1:size(silenceSignal);
    subplot(2, 1, 1);
    plot(length, processedFile);
    grid;
    title("Mean Filtered Bird Audio");
    subplot(2,1,2);
    plot(length, silenceSignal);
    grid;
    title("Silence Signal (0 indicates silence)");
    hold off;
    %
  
end