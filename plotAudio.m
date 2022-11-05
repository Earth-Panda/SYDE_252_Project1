function [] = plotAudio(Fs, Sr, audioName)
    figure;
    n = 1:length(Fs);
    plot(n,Fs);
    grid;
    title(audioName);
    xlabel('Time');
    ylabel('signal');
end