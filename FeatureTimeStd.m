% ======================================================================
%> @brief computes the standard deviation of a time domain signal
%> called by ::ComputeFeature
%>
%> @param x: audio signal
%> @param iBlockLength: block length in samples
%> @param iHopLength: hop length in samples
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vstd standard deviation
%> @retval t time stamp
% ======================================================================
function [vstd] = FeatureTimeStd(x, f_s)
        
    % calculate the standard deviation
    vstd = std(x,1);

end

