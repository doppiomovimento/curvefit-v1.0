function tl = jtierlist(tier,grplist)


numl    = size(grplist,1)-1;
sz      = size(tier,1);
tl      = cell(numl,1);
vlst    = ones(numl,1);
vt      = zeros(sz,numl);


for va = 1:sz
    for vb = 1:numl
        lb      = grplist(vb+1,1);
        ub      = grplist(vb+1,2);
        if tier(va) >= lb && tier(va) <= ub
            vt(vlst(vb),vb)     = tier(va);
            vlst(vb)            = vlst(vb)+1;
            break;
        end
    end
end

for vc = 1:numl
    tl{vc}  = vt(1:(vlst(vc)-1),vc);
end
