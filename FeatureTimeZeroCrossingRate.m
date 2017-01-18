% ======================================================================
%> @brief computes the zero crossing rate from a time domain signal
%> called by ::ComputeFeature
%>
%> @param x: audio signal
%> @param iBlockLength: block length in samples
%> @param iHopLength: hop length in samples
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vzc zero crossing rate
%> @retval t time stamp
% ======================================================================
function [vzc] = FeatureTimeZeroCrossingRate(x, f_s)

    % compute the zero crossing rate
    vzc = 0.5*mean(abs(diff(sign(x))));

end

