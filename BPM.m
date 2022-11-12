function [] = BPM()
%BPM is aproximatly 82 BPM
    [original, output] = MeanFilter("Drum.wav", 13, false);
    time = audioinfo("Drum.wav").Duration;
    %seconds per index
    s_index = time/length(output);

    PlotAudio(output, "Filtered Drum.wav with w=13");
    %use a threshhold for what is considered a "beat"
    pluseThreshold = 0.06;

    tol = 1500;
    %filter all signals below that "pulse"
    output = PeakFindHPF(output, pluseThreshold, tol);
    PlotAudio(output, "Pulses");
    
    %determine the region of between beats
    [beatRegion, sampleFound] = BeatRegion(output, tol);


    %Calculate BPM
    if(sampleFound)
        beats = 1; 
        seconds = beatRegion * s_index;
        min = seconds/60;
        
        BPM = beats/min;
    
        disp(BPM);
    end
end

