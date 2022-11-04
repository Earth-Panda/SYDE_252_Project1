%General clear
clear all;
clc;

%Read audio files
[Birds_Data, Birds_Sample] = ProcessAudio("Birds.wav");
%ProcessAudio("Drum.wav");
%ProcessAudio("Speech.wav");

plotAudio(Birds_Data,"Birds.wav", 2, 2, 1);
%Best mean value for the filter is 13
output_data = Mean_Filter(Birds_Data, 13);
plotAudio(output_data,"Birds.wav", 2, 2, 2);

plotAudioDiff(Birds_Data, "Mean","Birds.wav", 2,2,[3,4], 1:1:30);
%plotAudioDiff(Birds_Data, "WAvg","Birds.wav", 2,2,[3,4], 1:1:30);
sound(output_data, Birds_Sample);