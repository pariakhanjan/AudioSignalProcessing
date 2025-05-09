# AudioSignalProcessingSuite

A MATLAB-based project for audio signal processing, featuring various effects, Fourier series analysis, and Riemann sum calculations.

## Features

1. **Basic Audio Manipulation**  
   - Load and visualize stereo audio signals.  
   - Modify sample rate and apply exponential decay to audio signals.  

2. **Echo Effects**  
   - Add single or multiple echoes with adjustable delays and intensities.  
   - Convolve audio with impulse responses (e.g., concert hall, iron bucket).  

3. **360° Audio Effect**  
   - Simulate spatial audio by applying phase shifts to left and right channels.  

4. **Fourier Series Analysis**  
   - Compute and visualize Fourier series coefficients for square waves.  
   - Reconstruct signals using varying harmonic ranges.  

5. **Numerical Integration**  
   - Implement trapezoidal rule, lower, and upper Riemann sums for function approximation.  

## Matlab Files

- `main.m`: Main script for audio processing (Parts 1-4, 6).  
- `part_five.m`: Script for Fourier series analysis (Part 5).  
- `trapezoidal_rule.m`: Numerical integration using the trapezoidal rule.  
- `lower_riemann.m`: Lower Riemann sum calculation.  
- `upper_riemann.m`: Upper Riemann sum calculation.  

## Usage

1. Ensure MATLAB is installed.  
2. Place audio files (`voice.wav`, `concert_hall_IR.wav`, etc.) in the working directory.  
3. Run `main.m` or `part_five.m` to execute specific functionalities.  

## Outputs

- Processed audio files (e.g., `out_with_echo.wav`, `360_audio.wav`).  
- Visualizations of signals, Fourier coefficients, and reconstructed waveforms.  

## Report
- Provides a thorough description of the matlab files and the math behind them in Persian.
