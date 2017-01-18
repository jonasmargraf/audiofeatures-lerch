function [vtcNorm] = FeatureTimeCrestFactor (x, f_s)

   vtc = max(x,[],1) ./ sum(x,1);
   
   % avoid NaN for silence frames
   vtc(sum(x,1) == 0) = 0;
   
   vtcNorm = vtc / length(x);
    
end
