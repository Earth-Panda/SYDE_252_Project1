function [new_data] = audioSetup(file, processedFileName)
    [data, sample_rate] = audioread(file);
    
    sz = size(data);
    if sz(1,2) > 1
      data = data(:,1) + data(:,2);
    end

    %sound(data, sample_rate);

    audiowrite(processedFileName, data, sample_rate);
    
    n = 1:length(data);
    subplot(2,1,1)
    plot(n, data);
    grid
    title("Setup Data")
    hold on

    [P, Q] = rat(16e3/sample_rate);
    new_data = resample(data, P, Q);

end

