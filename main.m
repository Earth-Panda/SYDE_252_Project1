%General clear

clc;

%Read audio files
%Mean_Filter("Birds.wav", 3);
%weightedAvg("Birds.wav", 3);
%MedianFilter("Birds.wav", 3);


plotAudioDiff("Mean","Birds.wav", 2, 2, [3,4], 1:1:30);
plotAudioDiff("WAvg","Birds.wav", 2, 2, [3,4], 1:1:30);