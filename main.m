%General clear

clc;

%Read audio files
[Birds_Data, Birds_Sample] = audioSetup("Birds.wav");
%ProcessAudio("Drum.wav");
%ProcessAudio("Speech.wav");

plotAudio(Birds_Data, Birds_Sample,"Birds.wav");
Mean_Filter(Birds_Data, 3, "Birds.wav");