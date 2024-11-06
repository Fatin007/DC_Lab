b = [0 1 0 1 1 1 0];   % Define the binary sequence (data bits)
n = length(b);          % Determine the length of the binary sequence
t = 0:.01:n;            % Time vector from 0 to n with step size of 0.01

% Loop to create the binary waveform (bw) that matches the time vector
for i = 1:n
    bw(i*100:(i+1)*100) = b(i);   % Stretch each bit over 100 time steps
end
bw = bw(100:end);   % Remove the first 100 samples to align the length with time vector

% Generate a carrier signal (sine wave) with frequency 1 Hz
sint = sin(2*pi*t);   % Generate a sine wave as the carrier signal

% Perform Amplitude Shift Keying (ASK) modulation
st = bw .* sint;      % Modulate the carrier by multiplying it with the binary waveform

% Plot the binary waveform
subplot(3,1,1);        % First subplot
plot(t, bw);           % Plot the binary waveform
grid on;               % Turn on the grid for better visualization
axis([0 n -2 2]);      % Set the axis limits for the plot
title('Binary Waveform');  % Title for the plot

% Plot the carrier signal
subplot(3,1,2);        % Second subplot
plot(t, sint);         % Plot the carrier signal (sine wave)
grid on;               % Turn on the grid for better visualization
axis([0 n -2 2]);      % Set the axis limits for the plot
title('Carrier Signal');   % Title for the plot

% Plot the modulated signal
subplot(3,1,3);        % Third subplot
plot(t, st);           % Plot the modulated signal (ASK)
grid on;               % Turn on the grid for better visualization
axis([0 n -2 2]);      % Set the axis limits for the plot
title('ASK Modulated Signal');   % Title for the plot
