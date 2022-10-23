%general clear
clear all;
clc;

%read audio files
[data_Birds, sr_Birds, data_Drum, sr_Drum, data_Speech, sr_Speech] = audioSetup("Birds.wav","Drum.wav","Speech.wav");

%sample rates
fprintf("Sample rates: \n" + "Birds: " + sr_Birds + "\nDrums: " + sr_Drum + "\nSpeech: " + sr_Speech + "\n");

