function [] = plotAudio(Fs, Sr, audioName)
    f = figure;
    info = audioinfo(audioName);
    t = 0:seconds(1/Sr):seconds(info.Duration);
    t = t(1:end-1);
    plot(t,Fs);
    xlabel('Time');
    ylabel(audioName);
end

