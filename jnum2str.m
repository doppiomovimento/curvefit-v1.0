function s = jnum2str(num)
                                                % This function converts a double into a string
                                                % the conversion goes in this way
                                                % it turns a value 95462.23 into a string '95,462'

t       = num2str(num,'%.0f');
sz      = size(t,2);                            
nc      = floor(sz/3);                          % number of comma

if isequal(mod(sz,3),0)
    nc  = nc-1;
end

s       = blanks(sz+nc);                        % string

t       = fliplr(t);
vb      = 1;

for va = 1:sz
    if ~isequal(mod(va,3),0)
        s(vb)       = t(va);
        vb          = vb+1;
    else
        s(vb)       = t(va);
        vb          = vb+1;
        if ~isequal(va,sz)
            s(vb)       = ',';
            vb          = vb+1;
        end
    end
end

s       = fliplr(s);