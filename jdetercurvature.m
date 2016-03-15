function cur = jdetercurvature(y,x)

if size(y,2)>1
    y       = y';
end

cur         = zeros(size(y,1),1);

for cta = 2:(size(cur,1)-1)
    cur(cta)= abs(atan((y(cta+1)-y(cta))/(x(cta+1)-x(cta)))-atan((y(cta)-y(cta-1))/(x(cta)-x(cta-1))));
end