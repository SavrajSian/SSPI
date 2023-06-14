function Px = pgm(x)
    N = length(x);
    fourier = fft(x); %computes DFT
    Px = (1/N)*(abs(fourier).^2);
end

