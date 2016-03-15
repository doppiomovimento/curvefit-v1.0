function [grplist,strlist,ratio] = jshowlist(sz,rc)

                                                % determine the number of entities to be illustrated
                                                % in one view, the variable is 'm'
if isequal(nargin,1)
    r       = 600;
    n       = sz/(r*5);
    chk     = mod(n,1);

    if chk > 0.5
        m   = ceil(n)*r;
    else
        m   = floor(n)*r;
    end
    if sz <= (r*5)/2
        m   = 600;
    end
    
    ratio   = m/r;
else
    m       = rc;
    ratio   = rc/600;
end

                                                % determine the number of groups in the listbox
                                                % and the corresponding range in each group
if sz <= r
    grpnum  = 1;
elseif isequal(mod(sz,m),0)
    grpnum  = ceil(sz/m)+1;
    left    = m;
elseif mod(sz,m) < (m/10)
    grpnum  = ceil(sz/m);
    left    = m+mod(sz,m);
else
    grpnum  = ceil(sz/m)+1;
    left    = mod(sz,m);
end

grplist     = zeros(grpnum,2);
strlist     = cell(grpnum,1);

grplist(1,:)= [1 sz];
strlist{1}  = 'show all';

if grpnum > 1
    for va = 2:grpnum
        if ~isequal(va,grpnum)
            grplist(va,:)   = [(va-2)*m+1 (va-1)*m];
            strlist{va}     = [jnum2str((va-2)*m+1) ' to ' jnum2str((va-1)*m)];
        else
            grplist(va,:)   = [(va-2)*m+1 (va-2)*m+left];
            strlist{va}     = [jnum2str((va-2)*m+1) ' to ' jnum2str((va-2)*m+left)];
        end
    end
end
