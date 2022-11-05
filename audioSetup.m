function [new_data] = audioSetup(file, processedFileName, shouldPlot)
    [data, sample_rate] = audioread(file);
    
    data = concatChannels(data);

    %sound(data, sample_rate);

    audiowrite(processedFileName, data, sample_rate);
    if shouldPlot
        n = 1:length(data);
        plot(n, data);
        grid
        title(processedFileName)
        hold on
    end

    [P, Q] = rat(16e3/sample_rate);
    new_data = resample(data, P, Q);
end

