% ======================================================================
%> @brief computes the MFCCs from the magnitude spectrum (see Slaney)
%> called by ::ComputeFeature
%>
%> @param X: spectrogram (dimension FFTLength X Observations)
%> @param f_s: sample rate of audio data (unused)
%>
%> @retval vmfcc mel frequency cepstral coefficients
% ======================================================================
function [vmfcc] = FeatureSpectralMfccs(X, f_s)

    iNumCoeffs  = 13;
    
    % allocate memory
    vmfcc       = zeros(1, iNumCoeffs);

    H           = ToolMfccFb(size(X,1), f_s);
    T           = GenerateDctMatrix (size(H,1), iNumCoeffs);
 
    % compute the mel spectrum
    X_Mel       = log10(H * X+1e-20);

    % calculate the mfccs
    vmfcc(1, 1:iNumCoeffs)  = T * X_Mel;


end


%> see function mfcc.m from Slaneys Auditory Toolbox
function [T] = GenerateDctMatrix (iNumBands, iNumCepstralCoeffs)
    T       = cos((0:(iNumCepstralCoeffs-1))' * ...
                                (2*(0:(iNumBands-1))+1) * pi/2/iNumBands);
            
    T       = T/sqrt(iNumBands/2);
    T(1,:)  = T(1,:) * sqrt(2)/2;
end

