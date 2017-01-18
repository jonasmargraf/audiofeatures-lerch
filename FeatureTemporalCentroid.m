function [tmc] = FeatureTemporalCentroid (x, f_s)

    x = x.^2;
    tmc     = ([0:size(x,1)-1]*x)./sum(x,1);
    
    % avoid NaN for silence frames
    tmc (sum(x,1) == 0) = 0;
        
    % scale to length of input audio, so that ouput is in range 0-1
    tmcNorm = tmc / length(x);
    % this would be to convert output from samples to seconds
%     tmcNorm = tmcNorm/f_s;

end