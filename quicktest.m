clear all
clc

dat             = csvread('ABI-Ken LA.csv');
param.mute      = 5;
param.scale     = 4;
param.thres     = 1;
param.dist      = 4;
param.numpts    = 20;
c       = japcurvefit(dat,param);

hold on
plot(dat,'c')
plot(c.y,'r')
plot(c.ptslist.tier3,c.y(c.ptslist.tier3), 'gs', 'MarkerSize', 6);
plot(c.ptslist.tier2,c.y(c.ptslist.tier2), 'bs', 'MarkerSize', 6);
plot(c.ptslist.tier1,c.y(c.ptslist.tier1), 'rs', 'MarkerSize', 6);