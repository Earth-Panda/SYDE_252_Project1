function [] = Syllables()
    [data, filtered_data] = WeightedAvg("Speech.wav", 13, true);

    % A huge ta-pes-try hung in her hallway 10 syllables
    noise_threshold = 5.6865e-6 % Noise threshold
    syllable_threshold = sum(abs(filtered_data(34124:35464))) % value of chosen syllable threshold from speech sample
    active_region = []; % Declaring empty active region array
    syllable_counter = 0; % Initializing syllable counter
    pause = true; % Initalizing pause boolean
    
    for i = 1:length(filtered_data) % Iterating over fltered_data
        if (abs(filtered_data(i)) > noise_threshold) % Comparing the absolute magnitude of the filtered data to the noise threshold
            active_region(i) = filtered_data(i); % Storing potential syllable data in active region array
            pause = false; % Setting pause to false
        else
            pause = true; % Setting pause to true
        end
        
        if (abs(filtered_data(i)) < noise_threshold && pause == true) % If break in active region
            if sum(abs(active_region)) > syllable_threshold % Check if active region data overcomes syllable threshold
                syllable_counter = syllable_counter + 1; % Increment syllable counter
                active_region = []; % Reset active_region array to 0
                pause = false; % Setting pause to false
            end
        end
    end
    syllable_counter % output value of syllalble counter
    StaticNosie(filtered_data, noise_threshold);
end

