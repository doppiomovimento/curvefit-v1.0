function [lsno,value] = jmax(ar)
                                                % This max function is slightly faster than the MATLAB
                                                % in-built max function
                                                % It specially caters to 1-d array
                                    
[~,c]       = size(ar);

if ~isequal(c,1)
    ar      = ar';
end

value       = ar(1);
lsno        = 1;

for cta = 2:size(ar,1)
    if ar(cta) > value
        value   = ar(cta);
        lsno    = cta;
    end
end