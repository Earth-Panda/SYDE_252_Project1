%General clear

clc;
close all;

section = "BPM"
%% Read audio files
%Mean_Filter("Birds.wav", 3);
% [data filtered_data] = weightedAvg("Speech.wav", 13, true);
%MedianFilter("Birds.wav", 3);

% plotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:30);
% plotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
% plotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);

%% BPM of the Drums
if section == "BPM"
    %plotAudioDiff("Mean","Drum.wav", 3, 2, [1,2], 1:1:30);
    %plotAudioDiff("WAvg","Drum.wav", 3, 2, [3,4], 1:1:30);
    %plotAudioDiff("Median","Drum.wav", 3, 2, [5,6], 1:1:30);
    
    %BPM is aproximatly 82 BPM
    [audio, sampleRate] = audioSetup("Drum.wav", "newDrum.wav", false);
    time = audioinfo("Drum.wav").Duration;
    %seconds per index
    s_index = time/length(audio);

    plotAudio(audio, "Drum.wav");
    %use a threshhold for what is considered a "beat"
    pluseThreshold = 0.1;

    buffer = 0;
    tol = 1500;
    %filter all signals below that "pulse"
    for i = 1:length(audio)
        if (abs(audio(i)) < pluseThreshold || buffer > 0)
            audio(i) = 0;
            buffer = buffer - 1;
        else
            buffer = tol;
        end
    end
    plotAudio(audio, "Pulses");
    
    %determine the region of 3 equidistant beats
    %[beatRegion, sampleFound] = BeatRegion(audio, 500);
    
    %Calculate BPM
    if(sampleFound)
        beats = 3; 
        seconds = beatRegion * 2 * s_index;
        min = seconds/60;
        
        BPM = beats/min;
    
        disp(BPM);
    end
    
end
%% Number of Syllables in Speech clip
if section == "Syllables"
    plotAudioDiff("Mean","Speech.wav", 3, 2, [1,2], 1:1:30);
    plotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
    plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);
    % A huge ta-pes-try hung in her hallway 10 syllables
    noise_threshold = 5.6865e-6
    syllable_threshold = sum(abs(filtered_data(34124:35464)))
    active_region = [];
    syllable_counter = 0;
    pause = true;
    
    for i = 1:length(filtered_data)
        if (abs(filtered_data(i)) > noise_threshold)
            active_region(i) = filtered_data(i);
            pause = false;
        else
            pause = true;
        end
        
        if (abs(filtered_data(i)) < noise_threshold && pause == true)
            if sum(abs(active_region)) > syllable_threshold
                syllable_counter = syllable_counter + 1;
                active_region = [];
                pause = false;
            end
        end
    end
    syllable_counter
end
%% 

