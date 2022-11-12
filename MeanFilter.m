function [input, output] = MeanFilter(name, window, shouldPlot)
    % Setup transfer function coefficients 
    a = 1;
    b = (1/window) * ones(window,1);
    
    %setup the audio file
    input = AudioSetup(name, strcat("new", name), false);
    %Filter
    output = filter(b,a,input);
    
    if shouldPlot % Condition to plot
        % plot
        sound(output, 16e3);
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

