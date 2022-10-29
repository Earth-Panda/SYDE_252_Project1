function [new_data, sample_rate] = audioSetup(file)
    [data, sample_rate] = audioread(file);
    
    sz = size(data);
    if sz(1,2) > 1
      data = data(:,1) + data(:,2);
    end

    sound(data, sample_rate);

    audiowrite('newSoundFile.wav', data, sample_rate);
    
    [P, Q] = rat(16e3/sample_rate);
    new_data = resample(data, P, Q);

%     subplot(2,1,1)
%     plot((0:length(data)-1)/sample_rate,data)
%     grid
%     title("Data")
%     hold on
%     
%     subplot(2,1,2)
%     plot((0:length(new_data)-1)/(P/Q*sample_rate),new_data)
%     grid
%     title('Resampled Data');
%     hold off

end

