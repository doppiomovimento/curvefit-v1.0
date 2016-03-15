                                                % replot the chandle.ax
if ishandle(chandle.jcurva)
    delete(chandle.jcurva);
end
if ishandle(chandle.orgdata)
    delete(chandle.orgdata);
end
if ishandle(chandle.filtdata)
    delete(chandle.filtdata);
end
if ishandle(chandle.curve)
    delete(chandle.curve);
end
if ishandle(chandle.tier1)
    delete(chandle.tier1);
end
if ishandle(chandle.tier2)
    delete(chandle.tier2);
end
if ishandle(chandle.tier3)
    delete(chandle.tier3);
end
delete(chandle.plotmin);
delete(chandle.plotmax);

                                                % plot the graphs
hold on
num             = cdata.rangesel;
lst             = cdata.grplist(num,1):cdata.grplist(num,2);

chandle.plotmin = plot(lst(1), cdata.datmin,'Color', [0.29 0.29 0.29]);
chandle.plotmax = plot(lst(1), cdata.datmax,'Color', [0.29 0.29 0.29]);

if isequal(get(chandle.cbox04,'Value'),1)
    chandle.jcurva      = plot(lst, cdata.curve.jcurva(lst)*(cdata.datrange/10),'m','LineWidth',1);
end
if isequal(get(chandle.cbox01,'Value'),1)
    chandle.orgdata     = plot(lst, cdata.dat(lst),'color', [0.6 0.6 0.6]);
end
if isequal(get(chandle.cbox02,'Value'),1)
    chandle.filtdata    = plot(lst,cdata.curve.sg(lst),'c');
end
if isequal(get(chandle.cbox03,'Value'),1)
    chandle.curve       = plot(lst, cdata.curve.y(lst),'g','LineWidth',2);
end
if isequal(get(chandle.cbox05,'Value'),1)
    if isequal(num,1)
        chandle.tier1   = plot(cdata.curve.ptslist.tier1,cdata.curve.y(cdata.curve.ptslist.tier1), 'rs', 'MarkerSize', 6);
    else
        chandle.tier1   = plot(cdata.curve.ptslist.tierlist1{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist1{num-1}), 'rs', 'MarkerSize', 6);
    end
end
if isequal(get(chandle.cbox06,'Value'),1)
    if isequal(num,1)
        chandle.tier2   = plot(cdata.curve.ptslist.tier2,cdata.curve.y(cdata.curve.ptslist.tier2), 'bs', 'MarkerSize', 6);
    else
        chandle.tier2   = plot(cdata.curve.ptslist.tierlist2{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist2{num-1}), 'bs', 'MarkerSize', 6);
    end
end
if isequal(get(chandle.cbox07,'Value'),1)
    if isequal(num,1)
        chandle.tier3   = plot(cdata.curve.ptslist.tier3,cdata.curve.y(cdata.curve.ptslist.tier3), 'ys', 'MarkerSize', 6);
    else
        chandle.tier3   = plot(cdata.curve.ptslist.tierlist3{num-1},cdata.curve.y(cdata.curve.ptslist.tierlist3{num-1}), 'ys', 'MarkerSize', 6);
    end
end

hold off