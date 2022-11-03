function [output] = Mean_Filter(input, window)
    a = 1;
    b = (1/window)*ones(window,1);

    output = filter(b,a,input);
end

