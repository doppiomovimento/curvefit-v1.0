function c = jcurvefilter(sg,f)

                                                % This function filters a curve by Fourier's method
                                                % The size of sg should be an even number,
                                                % and it will be better if it is a number of power of 2
                                                % f is a parameter that determines the number of fourier bases not to be muted,
                                                % and if left blank, goes by default value

                                                % Use this function when the data is periodic

if ~isequal(size(sg,2),1)
    sg      = sg'; 
end
if isequal(nargin,1)
    prm     = 5;                               % PaRaMeter
else
    prm     = f;
end

nfb                 = round(2^prm*log2(size(sg,1)/256));

hsz                 = round(size(sg,1)/2);
fd                  = fft(sg);
fd                  = fftshift(fd);
fd(1:(hsz-nfb))     = 0;
fd((hsz+nfb+1):end) = 0;
afd                 = ifftshift(fd);
td                  = ifft(afd);
c                   = abs(td);