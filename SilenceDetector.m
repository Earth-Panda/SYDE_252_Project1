%returns list of discrete times where the file is considered to be "Silent"
%general idea is to filter data first (using the best of the 3 filters), to
%smooth out the data, and then apply a threshold to consider regions as
%silent or not - trick is how to find threshold

%could have another function to plot the list of times on the same axis as
%the bird file to show it working
function [silenceSignal] = SilenceDetector(inputSignal)
    %filter data to smooth out input signal
    filteredData = Mean_Filter(inputSignal, 12);
    [dataSize, dim] = size(filteredData);
    %find threshold
    interval = 100;
    range = floor(dataSize/interval);
    averagedData = zeros(dataSize, 1);
    for n = 1 : range
        sum = 0;
        for i = 1 : interval
            sum = sum + abs(filteredData((n-1)*interval+i));
        end
        average = sum/interval;
        for i = 1 : interval
            averagedData((n-1)*interval+i) = average;
        end
        if n == 1
            min = average;
        elseif average < min
            min = average;
        end
    end

    med = median(averagedData);

    threshold = (0.65*med + 0.35*min);

    %len = 1 : size(average);
    %plot(len, average);
    %hold on
    %plot(len, yline(threshold));
    %iterate through and apply threshold
    
    silenceSignal = ones(dataSize, 1);
    for n = 1 : dataSize
        if abs(averagedData(n)) < threshold
            silenceSignal(n) = 0; %0 indicates its silence
        end
    end
    length = 1:size(silenceSignal);
    subplot(2, 1, 1);
    plot(length, filteredData);
    grid;
    title("Median Filtered Bird Audio");
    subplot(2,1,2);
    plot(length, silenceSignal);
    grid;
    title("Silence Signal (0 indicates silence)");
    hold off;
    
end