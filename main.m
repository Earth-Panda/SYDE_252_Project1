%General clear
clc;
clear;
close all;

section = "Silence"
%% Audio difference 

% Birds
figure;
PlotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:50);
PlotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
PlotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);

% Drum
figure;
diff = PlotAudioDiff("Mean","Drum.wav", 3, 2, [1,2], 1:1:250);
PlotAudioDiff("WAvg","Drum.wav", 3, 2, [3,4], 1:1:30);
PlotAudioDiff("Median","Drum.wav", 3, 2, [5,6], 1:1:30);

% Speech
figure;
PlotAudioDiff("Mean","Speech.wav", 3, 2, [1,2], 1:1:150);
PlotAudioDiff("WAvg","Speech.wav", 3, 2, [3,4], 1:1:30);
PlotAudioDiff("Median","Speech.wav", 3, 2, [5,6], 1:1:30);

d_diff = gradient(diff);
PlotAudio(d_diff, "Gradient");

%% Print Filtered Audio
[data, filterbird] = MeanFilter("Birds.wav", 13, true);
[data, filterspeech] = MeanFilter("Speech.wav", 50, true);
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

