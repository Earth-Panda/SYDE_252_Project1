function [data_c] = concatChannels(data)
    data_c = data;
    %where columns is how many audio channels there are
    [rows, columns] = size(data);
    if (columns > 1)
        % Combine all columns into 1 column
        data_c = [sum(data(:,1:columns),columns)];
    end
end