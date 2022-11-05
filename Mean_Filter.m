function [input, output] = Mean_Filter(name, window)
    a = 1;
    b = (1/window) * ones(window,1);

%     input = ProcessAudio(name);
    input = audioSetup(name, strcat("new", name));
    output = filter(b,a,input);
    
    %Plot
    n = 1:length(input);
    subplot(2,1,2)
    plot(n, output);
    grid
    title("Mean filter: " + name);
    xlabel('Time');
    ylabel('signal');
    hold off
end

