/*
This example shows how to use the Fast Fourier Transform function to get the spectrum
of a sound. This function calculates the FFT of a signal and returns the positive normalized 
magnitude spectrum. This means we pass it the number of bands we want (the actual FFT size is 
two times that size) and a float array with the same size. 
*/

import processing.sound.*;

SoundFile sample;
FFT fft;

int bands=512;

public void setup() {
    size(bands,360);
    background(255);
      
    // Load and play a soundfile and loop it. This has to be called 
    // before the FFT is created.
    sample = new SoundFile(this, "beat.aiff");
    sample.loop();
    
    // Create and patch the rms tracker
    fft = new FFT(this, bands);
    fft.input(sample);
}      
  
public void draw() {
    background(255);
    
    fft.analyze();
    
    for(int i = 0; i < fft.size(); i++) {
      // The result of the FFT is normalized
      // draw the line for frequency band i scaling it up by 5 to get more amplitude.
      line( i, height, i, height - fft.spectrum[i]*height*5 );
    } 
}
