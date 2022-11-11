%General clear
clc;
clear;
close all;

section = "BPM"
%% Audio difference 

% Birds
figure;
plotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:50);
plotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
plotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);

% Drum
figure
diff = plotAudioDiff("Mean","Drum.wav", 3, 2, [1,2], 1:1:250);
plotAudioDiff("WAvg","Drum.wav", 3, 2, [3,4], 1:1:30);
plotAudioDiff("Median","Drum.wav", 3, 2, [5,6], 1:1:30);

% Speech
figure;
plotAudioDiff("Mean","Speech.wav", 3, 2, [1,2], 1:1:150);
plotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
plotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);

d_diff = gradient(diff);
plotAudio(d_diff, "Gradient");

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
    Syllables();
end
%% Silence
if section == "Silence"
   SilenceDetector("Birds.wav");
end

