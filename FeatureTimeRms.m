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
function [vrms] = FeatureTimeRms(x, f_s)

    % calculate the rms
    vrms = sqrt(mean(x.^2));

    % convert to dB
    epsilon         = 1e-5; %-100dB
    
    vrms(vrms < epsilon)    = epsilon;
    vrms                    = 20*log10(vrms);

end

