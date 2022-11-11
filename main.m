%General clear

clc;
clear;
close all;

section = "Syllables"
%% Audio difference 

% Birds
%plotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:50);
% plotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
% plotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);

% Drum
% diff = plotAudioDiff("Mean","Drum.wav", 3, 2, [3,4], 1:1:250);
% plotAudioDiff("WAvg","Drum.wav", 3, 2, [3,4], 1:1:30);
% plotAudioDiff("Median","Drum.wav", 3, 2, [5,6], 1:1:30);

% Speech
%plotAudioDiff("Mean","Speech.wav", 3, 2, [5,6], 1:1:150);
% plotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
% plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);

% d_diff = gradient(diff);
% plotAudio(d_diff, "Gradient");
%% Print Filtered Audio
[data, filterbird] = Mean_Filter("Birds.wav", 13, true);
[data, filterspeech] = Mean_Filter("Speech.wav", 50, true);
[data, filterdrum] = MedianFilter("Drum.wav", 2, true);

audiowrite("LPF_Birds.wav", filterbird, 16e3);
audiowrite("LPF_Speech.wav", filterspeech, 16e3);
audiowrite("LPF_Drum.wav", filterdrum, 16e3);

%% BPM of the Drums
if section == "BPM"
    BPM();
end
%% Number of Syllables in Speech clip
if section == "Syllables"
%     plotAudioDiff("Mean","Speech.wav", 3, 2, [1,2], 1:1:30);
%     plotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
%     plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);

    [data, filtered_data] = weightedAvg("Speech.wav", 13, true);

    % A huge ta-pes-try hung in her hallway 10 syllables
    noise_threshold = 5.6865e-6 % Noise threshold
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
    syllable_counter % output value of syllalble counter
    staticNosie(filtered_data, noise_threshold);
end
%% Silence
if section == "Silence"
   SilenceDetector("Birds.wav");
end

