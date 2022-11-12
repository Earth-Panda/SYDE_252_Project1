function [] = BPM()
%BPM is aproximatly 82 BPM
    [original, output] = MeanFilter("Drum.wav", 13, false);
    time = audioinfo("Drum.wav").Duration;
    %seconds per index
    s_index = time/length(output);

    PlotAudio(output, "Drum.wav");
    %use a threshhold for what is considered a "beat"
    pluseThreshold = 0.1;

    tol = 1500;
    %filter all signals below that "pulse"
    output = PeakFindHPF(output, pluseThreshold, tol);
    PlotAudio(output, "Pulses");
    
    %determine the region of between beats
    [beatRegion, sampleFound] = BeatRegion(output, tol);


    %Calculate BPM
    if(sampleFound)
        beats = 2; 
        seconds = beatRegion * 2 * s_index;
        min = seconds/60;
        
        BPM = beats/min;
    
        disp(BPM);
    end
end

