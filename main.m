%General clear

clc;

%Read audio files
%Mean_Filter("Birds.wav", 3);
%weightedAvg("Birds.wav", 3);
%MedianFilter("Birds.wav", 3);


plotAudioDiff("Mean","Birds.wav", 3, 2, [1,2], 1:1:30);
plotAudioDiff("WAvg","Birds.wav", 3, 2, [3,4], 1:1:30);
plotAudioDiff("Median","Birds.wav", 3, 2, [5,6], 1:1:30);