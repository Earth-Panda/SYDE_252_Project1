function [] = plotAudio(Fs, audioName, n, m, i)
    subplot(n,m,i);    
    n = 1:length(Fs);
    plot(n,Fs);
    grid;
    title(audioName);
    xlabel('Time');
    ylabel('signal');
end
