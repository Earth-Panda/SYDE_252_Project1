function [] = plotAudio(Fs, Title)
    figure;
    n = 1:length(Fs);
    plot(n,Fs);
    grid;
    title(Title);
    xlabel('Time');
    ylabel('signal');
end