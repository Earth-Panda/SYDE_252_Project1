function [new_data, sample_rate] = audioSetup(file, processedFileName, shouldPlot)
    [data, sample_rate] = audioread(file);
    
    data = concatChannels(data);

    %sound(data, sample_rate); % Play sound via .wav filename

    audiowrite(processedFileName, data, sample_rate); % Writing mono sound
    %to a new file name
    if shouldPlot % Condition to plot, called in other files
        n = 1:length(data);
        plot(n, data);
        grid
        title(processedFileName)
        hold on
    end

    [P, Q] = rat(16e3/sample_rate); % Returns a rational approximation of the target frequency and current frequency
    new_data = resample(data, P, Q); % Using the resample function to upsample or downsample to 16kHz
end


