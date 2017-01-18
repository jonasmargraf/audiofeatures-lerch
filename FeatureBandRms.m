% ======================================================================
%> @brief computes the RMS of a time domain signal
%> called by ::ComputeFeature
%>
%> @param x: audio signal
%> @param iBlockLength: block length in samples
%> @param iHopLength: hop length in samples
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vrms root mean square
%> @retval t time stamp
% ======================================================================
function [vrmsBands] = FeatureBandRms(x, B, A, f_s)

    X_BD = filter(B{1},A{1},x);
    X_SD = filter(B{2},A{2},x);
    X_HH = filter(B{3},A{3},x);

%     xBands = {real(ifft(X_BD)), real(ifft(X_SD)), real(ifft(X_HH))};
    xBands = {X_BD, X_SD, X_HH};
    vrmsBands = zeros(1, 3);

    for band = 1:3

        % calculate the rms
        vrms     = sqrt(mean(xBands{band}.^2));

        % convert to dB
        epsilon         = 1e-5; %-100dB

        vrms(vrms < epsilon)    = epsilon;
        vrmsBands(1, band)         = 20*log10(vrms);
        
    end

end

