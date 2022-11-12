function [audio] = hpf(audio, pluseThreshold, tol)
    buffer = 0;
    %filter all signals below the threshold
    for i = 1:length(audio)
        % below threshold and within toggle after, set the value to 0
        if (abs(audio(i)) < pluseThreshold || buffer > 0)
            audio(i) = 0;
            buffer = buffer - 1;
        else
            buffer = tol;
        end
    end
end

