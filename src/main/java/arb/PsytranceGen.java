import javax.sound.sampled.*;
import java.util.concurrent.atomic.AtomicLong;

public class PsytranceGen {
    private static final float SAMPLE_RATE = 44100f;
    private static final int BUFFER_SIZE = 1024;
    private static final double BPM = 140.0;
    private static final double BEAT_LENGTH = SAMPLE_RATE * 60.0 / BPM;
    
    private final AtomicLong sampleCounter = new AtomicLong(0);
    private final boolean[] kickPattern = {true, false, false, false, true, false, true, false};
    private final int[] bassPattern = {0, 0, 3, 0, 5, 0, 3, 0};
    private final boolean[] hihatPattern = {false, true, false, true, false, true, true, false};
    
    private double kickPhase = 0.0, bassPhase = 0.0, leadPhase = 0.0;
    private double filterState1 = 0.0, filterState2 = 0.0;
    private java.util.Random random = new java.util.Random();
    
    public static void main(String[] args) throws Exception {
        new PsytranceGen().start();
    }
    
    private void start() throws Exception {
        AudioFormat format = new AudioFormat(SAMPLE_RATE, 16, 1, true, false);
        SourceDataLine line = AudioSystem.getSourceDataLine(format);
        line.open(format, BUFFER_SIZE * 4);
        line.start();
        
        System.out.println("Java Psytrance Generator - Press Ctrl+C to stop");
        System.out.println("BPM: " + BPM + ", Buffer: " + BUFFER_SIZE + " samples");
        System.out.println("Latency: ~" + (BUFFER_SIZE * 1000 / SAMPLE_RATE) + "ms");
        System.out.println("Generating kick, bass, lead, and hi-hats with filter sweeps...");
        
        byte[] buffer = new byte[BUFFER_SIZE * 2];
        
        while (true) {
            generateAudio(buffer);
            line.write(buffer, 0, buffer.length);
        }
    }
    
    private void generateAudio(byte[] buffer) {
        for (int i = 0; i < buffer.length; i += 2) {
            long sample = sampleCounter.getAndIncrement();
            double beatPos = (sample % BEAT_LENGTH) / BEAT_LENGTH;
            int step = (int)((sample / (BEAT_LENGTH / 8)) % 8);
            int beat = (int)(sample / BEAT_LENGTH) % 4;
            
            float audio = 0.0f;
            
            // Kick drum with exponential sweep
            if (kickPattern[step] && beatPos < 0.25) {
                double env = Math.exp(-beatPos * 25.0);
                double freq = 50.0 + 30.0 * Math.exp(-beatPos * 10.0);
                kickPhase += 2.0 * Math.PI * freq / SAMPLE_RATE;
                if (kickPhase > 2.0 * Math.PI) kickPhase -= 2.0 * Math.PI;
                audio += (float)(Math.sin(kickPhase) * env * 0.8);
            }
            
            // Musical bass line with harmonics
            int semitone = bassPattern[step];
            double bassFreq = 55.0 * Math.pow(2.0, semitone / 12.0);
            // Add wobble LFO
            bassFreq *= (1.0 + 0.1 * Math.sin(sample * 0.0003));
            
            bassPhase += 2.0 * Math.PI * bassFreq / SAMPLE_RATE;
            if (bassPhase > 2.0 * Math.PI) bassPhase -= 2.0 * Math.PI;
            
            // Sawtooth bass with harmonics
            double bassSignal = 0.0;
            for (int h = 1; h <= 6; h++) {
                bassSignal += Math.sin(h * bassPhase) / h;
            }
            audio += (float)(bassSignal * 0.4);
            
            // Lead synth (plays every other beat)
            if (beat % 2 == 0 && beatPos < 0.5) {
                double env = Math.exp(-beatPos * 8.0);
                double leadFreq = 220.0; // A3
                leadPhase += 2.0 * Math.PI * leadFreq / SAMPLE_RATE;
                if (leadPhase > 2.0 * Math.PI) leadPhase -= 2.0 * Math.PI;
                
                // FM synthesis for psychedelic lead
                double modulator = Math.sin(leadPhase * 3.0) * 0.3;
                double carrier = Math.sin(leadPhase + modulator);
                audio += (float)(carrier * env * 0.3);
            }
            
            // Hi-hats
            if (hihatPattern[step] && beatPos < 0.08) {
                double env = Math.exp(-beatPos * 50.0);
                double noise = (random.nextDouble() * 2.0 - 1.0);
                double hiFreq = 8000.0 + 2000.0 * Math.sin(sample * 0.01);
                double tone = Math.sin(2.0 * Math.PI * hiFreq * beatPos / SAMPLE_RATE);
                audio += (float)((noise * 0.7 + tone * 0.3) * env * 0.15);
            }
            
            // Dynamic resonant filter sweep
            double sweepFreq = 400.0 + 800.0 * (0.5 + 0.4 * Math.sin(sample * 0.00008));
            audio = resonantFilter(audio, sweepFreq, 0.4);
            
            // Spectral enhancement - add harmonics occasionally
            if (sample % 32 == 0 && Math.abs(audio) > 0.1) {
                audio += Math.sin(audio * 12.0) * 0.05f;
            }
            
            // Soft limiting and conversion to 16-bit PCM
            short pcm = (short)(Math.tanh(audio * 0.9) * 32767 * 0.85);
            buffer[i] = (byte)(pcm & 0xFF);
            buffer[i + 1] = (byte)((pcm >> 8) & 0xFF);
        }
    }
    
    private float resonantFilter(float input, double cutoff, double resonance) {
        // Normalized frequency (0-0.5)
        double freq = Math.max(0.001, Math.min(0.49, cutoff / SAMPLE_RATE));
        
        // Resonance feedback
        double feedback = resonance + resonance / (1.0 - freq);
        
        // 2-pole resonant filter
        filterState1 += freq * (input - filterState1 + feedback * (filterState1 - filterState2));
        filterState2 += freq * (filterState1 - filterState2);
        
        return (float)filterState2;
    }
}
