function [input, output] = Mean_Filter(name, window, shouldPlot)
    a = 1;
    b = (1/window) * ones(window,1);

    input = audioSetup(name, strcat("new", name), false);
    output = filter(b,a,input);
    
    if shouldPlot
        figure
        n = 1:length(input);
        plot(n, output);
        grid
        title("Mean filter: " + name);
        xlabel('Time');
        ylabel('signal');
        hold off
    end
end

