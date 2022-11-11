function [beatRegion, sampleFound] = BeatRegion(audio, tol)
    % Determine beats
    for i = 1:length(audio)
        %if there was a spike there
        if (audio(i) ~= 0)
            %check for the next spike
            for j = (i+tol):length(audio)
                %get the distance between the first and next beat
                if(audio(j) ~= 0)
                    beatRegion = j-i;
                    break
                else
                    beatRegion = 0;
                end
            end
            
            disp("Beat region" + beatRegion);
            %check for a spike at the beat differential within the
            %tolerance range (check to see if there is another beat
            %equadistant)
            for k = (j+beatRegion-tol/2):(j+beatRegion+tol/2)
                if(k < length(audio))
                   if(audio(k) ~= 0)
                       %beat sample found
                       sampleFound = true;
                       return
                   end
                else
                    disp("error");
                end
           end
        end
    end
    sampleFound = false;
    return
end

