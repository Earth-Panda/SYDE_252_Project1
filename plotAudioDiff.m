function [] = plotAudioDiff(og_data, filterType, audioName, n, m, i, winRange)
    for k = 1 : length(winRange)
      output_data = Mean_Filter(og_data, k);
      diff(k) = sum(abs(output_data - og_data));
    end

    subplot(n,m,i);    
    n = 1:length(winRange);   
    plot(n,diff);
    grid;
    title(audioName);
    xlabel('Time');
    ylabel('signal');
end
