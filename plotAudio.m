function [] = plotAudio(Fs, Title)
    % PLots the audio
    figure;
    n = 1:length(Fs);
    plot(n,Fs);
    grid;
    title(Title);
    xlabel('Time');
    ylabel('signal');
end