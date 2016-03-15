function handle = jaxesrunningplot(hAxes,xdata,ydata,ymax,ymin,frameWidth,duration)


if size(xdata,2) > 1
            xdata               = xdata';
end
if size(ydata,2) > 1
            ydata               = ydata';
end
            length              = size(xdata,1);
            count               = 1;
            halfWidth           = floor(frameWidth/2);
            running             = length/duration;
while count <= length
            axes(hAxes)
    if count <= halfWidth
            range               = 1:count;
            xmin                = xdata(1);
            xmax                = xdata(frameWidth);
    elseif count > halfWidth && count <= (length-halfWidth)
            range               = (count-halfWidth):count;
            xmin                = xdata(count-halfWidth);
            xmax                = xdata(count-halfWidth+frameWidth-1);
    else
            range               = (length-frameWidth+1):count;
            xmin                = xdata(length-frameWidth+1);
            xmax                = xdata(length);
    end
            handle              = plot(xdata(range),ydata(range));
            axis([xmin xmax ymin ymax]);
            drawnow;
            pause(0.0167);
            count               = count+round(running/60);
    
end

