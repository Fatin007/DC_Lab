b = [0 1 0 1 1 1 0];   % Define the binary sequence
n = length(b);          % Length of the binary sequence
t = 0:.01:n;            % Time vector from 0 to n with a step size of 0.01

% Loop to convert binary data to polar form (0 -> -1, 1 -> 1)
for i = 1:n
    if (b(i) == 0)
        b_p(i) = -1;    % Convert binary 0 to -1
    else
        b_p(i) = 1;     % Convert binary 1 to 1
    end
end

% Create a binary waveform by stretching the polar values over time
for j = 1:n
    bw(j*100:(j+1)*100) = b_p(j);   % Each bit occupies 100 samples
end
bw = bw(100:end);   % Remove the first 100 samples to align the length of the signal

% Generate a carrier signal (sine wave) with a frequency of 1 Hz
sint = sin(2*pi*t);   % Carrier signal: sine wave

% Perform modulation by multiplying the binary waveform with the carrier signal
st = bw.*sint;   % Element-wise multiplication for modulation (Polar ASK)

% Plot the polar binary waveform
subplot(3,1,1);
plot(t, bw);       % Plot binary waveform (polar)
grid on;
axis([0 n -2 2]);  % Set axis limits
title('Polar Binary Waveform');

% Plot the carrier signal
subplot(3,1,2);
plot(t, sint);     % Plot sine wave (carrier)
grid on;
axis([0 n -2 2]);  % Set axis limits
title('Carrier Signal');

% Plot the modulated signal
subplot(3,1,3);
plot(t, st);       % Plot the modulated signal
grid on;
axis([0 n -2 2]);  % Set axis limits
title('Polar ASK Modulated Signal');
