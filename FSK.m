b = [0 1 0 1 1 1 0];   % Define the binary sequence (data bits)
n = length(b);          % Get the length of the binary sequence
t1 = 0:.01:n;           % Time vector from 0 to n with a step size of 0.01 (used for plotting)

% Generate two carrier signals for FSK (Frequency Shift Keying)
sint1 = sin(2*pi*t1);          % First carrier signal with a lower frequency (sinusoidal wave)
sint2 = sin(2*pi*110*t1);      % Second carrier signal with a higher frequency

% Loop to create a binary waveform (bm) stretched over time based on the binary sequence
for i = 1:n
    bm(i*100:(i+1)*100) = b(i);   % Each bit in the binary sequence is stretched over 100 samples
end
bm = bm(100:end);   % Remove the first 100 samples to align with the time vector

% Convert binary 0s to -1s for bipolar representation of the binary waveform
for i = 1:length(bm)
    if (bm(i) == 0)
        bm(i) = -1;    % Replace binary 0 with -1
    end
end

% FSK modulation: Assign corresponding carrier frequencies based on binary value
for i = 1:length(bm)
    if (bm(i) == -1)
        bw(i) = sint1(i);   % Assign first carrier (low frequency) for binary 0 (-1)
    else
        bw(i) = sint2(i);   % Assign second carrier (high frequency) for binary 1
    end
end

% Plot the bipolar binary waveform
subplot(4,1,1);
plot(t1, bm);
grid on;
axis([0 n -2 2]);   % Set axis limits
title('Bipolar Binary Waveform');   % Add title to the plot

% Plot the first carrier signal (low frequency)
subplot(4,1,2);
plot(t1, sint1);
grid on;
axis([0 n -2 2]);   % Set axis limits
title('Carrier Signal 1 (Low Frequency)');   % Add title to the plot

% Plot the second carrier signal (high frequency)
subplot(4,1,3);
plot(t1, sint2);
grid on;
axis([0 n -2 2]);   % Set axis limits
title('Carrier Signal 2 (High Frequency)');   % Add title to the plot

% Plot the FSK modulated signal
subplot(4,1,4);
plot(t1, bw);
grid on;
axis([0 n -2 2]);   % Set axis limits
title('FSK Modulated Signal');   % Add title to the plot
