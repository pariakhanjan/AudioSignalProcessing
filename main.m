%%% PART 1 %%%

[audio, Fs] = audioread("voice.wav");
time = linspace(0, length(audio)/Fs, length(audio));
figure;
plot(time, audio(:,1), 'm');
hold on;
plot(time, audio(:,2), 'b'); 
xlabel('Time');
ylabel('Amplitude');
title('Audio Signal');
legend('Left Ear', 'Right Ear');
Fs_2 = 2 * Fs;
audiowrite("./out_doubled.wav", audio, Fs_2);

%%% PART 2 %%%

exp_signal = exp(-1*time);
modified_audio = audio .* exp_signal';
figure;
plot(time, modified_audio(:,1), 'm');
hold on;
plot(time, modified_audio(:,2), 'b');
xlabel('Time');
ylabel('Amplitude');
title('Modified Audio Signal');
legend('Left Ear', 'Right Ear');
audiowrite("./modified_audio_signal.wav", modified_audio, Fs);

%%% PART 3 %%%

first_echo_delay = 1.0 * Fs;
second_echo_delay = 2.0 * Fs;

first_echo_intensity = 0.8;
second_echo_intensity = 0.5;

max_delay = max(first_echo_delay, second_echo_delay);
impulse_response = zeros(max_delay + 1, 1);
impulse_response(1) = 1; 
impulse_response(first_echo_delay + 1) = first_echo_intensity;
impulse_response(second_echo_delay + 1) = second_echo_intensity;

output_audio = conv2(audio, impulse_response);

figure;
plot(output_audio, 'c');
title('Echoed Audio Signal');
xlabel('Time');
ylabel('Amplitude');

audiowrite("./out_with_echo.wav", output_audio, Fs);

%%% PART 4 %%%

IR_concert_hall = audioread("concert_hall_IR.wav");
figure;
subplot(4,1,1);
plot(IR_concert_hall, 'c');
title('Concert Hall IR Signal');
xlabel('Time');
ylabel('Amplitude');

output_concert_hall = conv2(audio, IR_concert_hall);
subplot(4,1,2);
plot(output_concert_hall, 'c');
title('Concert Hall Convolved Signal');
xlabel('Time');
ylabel('Amplitude');

audiowrite("./out_concert_hall.wav", output_concert_hall, Fs);

subplot(4,1,3);
IR_iron_bucket = audioread("iron_bucket_IR.wav");
plot(IR_iron_bucket, 'c');
title('Iron Bucket IR Signal');
xlabel('Time');
ylabel('Amplitude');

output_iron_bucket = conv2(IR_iron_bucket, audio);

subplot(4,1,4);
plot(output_iron_bucket, 'c');
title('Iron Bucket Convolved Signal');
xlabel('Time');
ylabel('Amplitude');

audiowrite("./out_iron_bucket.wav", output_iron_bucket/max(abs(output_iron_bucket)), Fs);

%%% PART 6 %%%

[original, Fs] = audioread('original_audio.wav');

duration = size(original, 1) / Fs;
time = (0:size(original, 1)-1) / Fs;
omega = 2 * pi * 0.1; 
left_phase_shift = sin(omega * time)';
right_phase_shift = cos(omega * time)';
left_channel = original(:, 1) .* left_phase_shift;
right_channel = original(:, 2) .* right_phase_shift;
audio_360 = [left_channel, right_channel];

figure;
subplot(4,1,1);
plot(time, original(:,1), 'm');
hold on;
plot(time, original(:,2), 'b'); 
xlabel('Time');
ylabel('Amplitude');
title('Original Audio Signal');
legend('Left Ear', 'Right Ear');

subplot(4,1,2);
plot(time, audio_360(:,1), 'm');
hold on;
plot(time, audio_360(:,2), 'b'); 
xlabel('Time');
ylabel('Amplitude');
title('360° Audio Signal');
legend('Left Ear', 'Right Ear');

subplot(4, 1, 3);
plot(time, left_channel, 'm', 'LineWidth', 1);
title('Left Channel with 360° Effect');
xlabel('Time');
ylabel('Amplitude');

subplot(4, 1, 4);
plot(time, right_channel, 'b', 'LineWidth', 1);
title('Right Channel with 360° Effect');
xlabel('Time (s)');
ylabel('Amplitude');

audiowrite('360_audio.wav', audio_360, Fs);