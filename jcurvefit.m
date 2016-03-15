function cf = jcurvefit(data, param)
                                                % This function fits a curve by the use of catmull-rom spline
                                                % The function will go for default value if there is no 'param' input

                                                % Use this function when the data is periodic


if isequal(nargin,1)
    param.mute      = 6;
    param.scale     = 4;
    param.thres     = 0;
    param.dist      = 4;
    param.numpts    = 20;
    sg              = jcurvefilter(data);
else
    sg              = jcurvefilter(data,param.mute);
end

cf.x                = (1:size(sg,1))';

dsg                 = abs(diff(sg));            % difference in sg
sclfactor           = 2^param.scale/mean(dsg);  % scale factor
sclsg               = sg*sclfactor;             % scaled signal
curva               = jdetercurvature(sclsg,cf.x);
                                                % curvature
dcurva              = diff(curva);              % difference in curvature
mcurva              = mean(curva);              % mean of curvature
stdcurva            = std(curva);               % std dev of curvature
salpts              = zeros(size(sg,1),1);
all                 = salpts;
tier1               = salpts;
tier2               = salpts;
tier3               = salpts;
salpts(1)           = 1;
all(1)              = 1;
tier1(1)            = 1;
va                  = 2;                        % for 'all'
vb                  = 1;                        % for tier3
vc                  = 2;                        % for tier1
vd                  = 1;                        % for tier2


for la = 2:(size(dcurva,1)-1)
    if (dcurva(la) > 0) && (dcurva(la+1) < 0)   % identify salient points
        if curva(la+1) > (mcurva+param.thres*stdcurva)
                                                % identify tier 1 salient points
            if isequal(salpts(all(va-1)),1)     % identify tier 3 salient points
                if (la+1)-all(va-1) > 2^param.dist
                        tier3(vb)           = jmax(-curva((all(va-1)+1):((la+1)-1)))+all(va-1)-1;
                    if ~isequal(tier3(vb),1)
                        salpts(tier3(vb))   = 3;
                        all(va)             = tier3(vb);
                        va                  = va+1;
                        vb                  = vb+1;
                    end
                end
            end
            salpts(la+1)    = 1;
            tier1(vc)       = la+1;
            vc              = vc+1;
            all(va)         = la+1;
            va              = va+1;
        else
                                                % identify tier 2 salient points
            salpts(la+1)    = 2;
            tier2(vd)       = la+1;
            vd              = vd+1;
            all(va)         = la+1;
            va              = va+1;
        end
    end
end

salpts(end)         = 1;
all(va)             = size(sg,1);
tier1(vc)           = size(sg,1);
                                                % ome housekeepings
all                 = all(1:va);
tier1               = tier1(1:vc);
tier2               = tier2(1:(vd-1));
tier3               = tier3(1:(vb-1));

                                                % generate the curve
[px,py]             = jcrcpspline(all',sclsg(all)',param.numpts+1);
cf.y                = interp1(px,py,cf.x)/sclfactor;

                                                % consolidate output
ptslist.all         = all;
ptslist.tier1       = tier1;
ptslist.tier2       = tier2;
ptslist.tier3       = tier3;

cf.sg               = sg;
cf.salpts           = salpts;
cf.ptslist          = ptslist;
cf.param            = param;
cf.jcurva           = curva;


