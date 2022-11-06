%General clear

clc;
close all;
%% Read audio files
%Mean_Filter("Birds.wav", 3);
% [data filtered_data] = weightedAvg("Speech.wav", 13, true);
%MedianFilter("Birds.wav", 3);

% plotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:30);
% plotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
% plotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);

% plotAudioDiff("Mean","Drum.wav", 3, 2, [1,2], 1:1:30);
% plotAudioDiff("WAvg","Drum.wav", 3, 2, [3,4], 1:1:30);
% plotAudioDiff("Median","Drum.wav", 3, 2, [5,6], 1:1:30);

plotAudioDiff("Mean","Speech.wav", 3, 2, [1,2], 1:1:30);
plotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);

%% Number of Syllables in Speech clip
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
%% 

