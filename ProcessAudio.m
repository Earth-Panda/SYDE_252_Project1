function [data_R, sampleRate] = ProcessAudio(audioName)
    [data, sampleRate] = audioread(audioName);
    %Sample rate
    fprintf("Sample rate " + audioName + ": " + sampleRate + "\n");
    
    %Number of audio channels
    [row_OG, col_OG] = size(data);
    fprintf("Channels (" + audioName + "): " + col_OG + "\n");
    
    %Combine audio channels
    data_C = concatChannels(data);
    
    %Number of audio channels
    [row_C, col_C] = size(data_C);
    fprintf("Updated Channels (" + audioName + "): " + col_C + "\n");

    %sound(data_C, sampleRate);
    
    audiowrite('newSoundFile.wav', data_C, sampleRate);

    %Plot Audio
    %plotAudio(data_C, sampleRate, audioName);

    %Sample update
    [P, Q] = rat(16000/sampleRate);
    data_R = resample(data_C, P, Q); 
end

