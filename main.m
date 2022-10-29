%general clear
clear all;
clc;

%read audio files
[data_Birds, sr_Birds, data_Drum, sr_Drum, data_Speech, sr_Speech] = audioSetup("Birds.wav","Drum.wav","Speech.wav");

%sample rates
fprintf("Sample rates: \n" + ...
    "Birds: " + sr_Birds + ...
    "\nDrums: " + sr_Drum + ...
    "\nSpeech: " + sr_Speech + "\n");

%numver of audio channels
[row_B, col_B] = size(data_Birds);
[row_D, col_D] = size(data_Drum);
[row_S, col_S] = size(data_Speech);

fprintf("Channels: \n" + ...
    "Bird channels: " + col_B + ...
    "\nDrums channels: " + col_D + ...
    "\nSpeech channels: " + col_S + "\n");

%combine audio channels
data_Birds = concatChannels(data_Birds);
data_Drum = concatChannels(data_Drum);
data_Speech = concatChannels(data_Speech);
%number of audio channels
[row_B, col_B] = size(data_Birds);
[row_D, col_D] = size(data_Drum);
[row_S, col_S] = size(data_Speech);

fprintf("Combined Channels: \n" + ...
    "Bird channels: " + col_B + ...
    "\nDrums channels: " + col_D + ...
    "\nSpeech channels: " + col_S + "\n");
