%General clear

clc;
clear;
close all;

section = "Syllables"
%% Read audio files
if section == "None"    
    plotAudioDiff("Median","Birds.wav", 3, 2, [1,2], 1:1:30);
    plotAudioDiff("Median","Drum.wav", 3, 2, [3,4], 1:1:30);
    plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);
end

%% BPM of the Drums
if section == "BPM"
    %plotAudioDiff("Mean","Drum.wav", 3, 2, [1,2], 1:1:30);
    %plotAudioDiff("WAvg","Drum.wav", 3, 2, [3,4], 1:1:30);
    %plotAudioDiff("Median","Drum.wav", 3, 2, [5,6], 1:1:30);
    
    %BPM is aproximately 82 BPM
    [audio, sampleRate] = audioSetup("Drum.wav", "newDrum.wav", false);
    time = audioinfo("Drum.wav").Duration;
    %seconds per index
    s_index = time/length(audio);

    plotAudio(audio, "Drum.wav");
    %use a threshold for what is considered a "beat"
    pluseThreshold = 0.3;

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
    [beatRegion, sampleFound] = BeatRegion(audio, 500);
    
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
%     plotAudioDiff("Mean","Speech.wav", 3, 2, [1,2], 1:1:30);
%     plotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
%     plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);

    [data filtered_data] = weightedAvg("Speech.wav", 13, true);

    % A huge ta-pes-try hung in her hallway 10 syllables
    noise_threshold = 5.6865e-4 % Noise threshold
    syllable_threshold = sum(abs(filtered_data(34124:35464))) % value of chosen syllable threshold from speech sample
    active_region = []; % Declaring empty active region array
    syllable_counter = 0; % Initializing syllable counter
    pause = true; % Initalizing pause boolean
    
    for i = 1:length(filtered_data) % Iterating over fltered_data
        if (abs(filtered_data(i)) > noise_threshold) % Comparing the absolute magnitude of the filtered data to the noise threshold
            active_region(i) = filtered_data(i); % Storing potential syllable data in active region array
            pause = false; % Setting pause to false
        else
            pause = true; % Setting pause to true
        end
        
        if (abs(filtered_data(i)) < noise_threshold && pause == true) % If break in active region
            if sum(abs(active_region)) > syllable_threshold % Check if active region data overcomes syllable threshold
                syllable_counter = syllable_counter + 1; % Increment syllable counter
                active_region = []; % Reset active_region array to 0
                pause = false; % Setting pause to false
            end
        end
    end
    syllable_counter % Missing semicolon to output value of syllalble counter
end
staticNosie(filtered_data, noise_threshold);
%% Silence
if section == "Silence"
%    plotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:30);
%    plotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
%    plotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);

   SilenceDetector("Birds.wav");
end

