function [output] = Mean_Filter(input, window, name)
    a = 1;
    b = (1/window)*ones(window,1);

    output = filter(b,a,input);
    
    %Plot
    n = 1:length(input);
    plot(n, output);
    grid
    title("Mean filter: " + name);
    xlabel('Time');
    ylabel('signal');
end

