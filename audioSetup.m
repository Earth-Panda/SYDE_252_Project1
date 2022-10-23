function [data_1, sr_1, data_2, sr_2, data_3, sr_3] = audioSetup(file_1,file_2,file_3)
    [data_1, sr_1] = audioread(file_1);
    [data_2, sr_2] = audioread(file_2);
    [data_3, sr_3] = audioread(file_3);
end

